#include "scene.h"

#include <osg/CullFace>
#include <osg/LineWidth>
#include <osgDB/ReadFile>
#include <osgGA/NodeTrackerManipulator>
#include <osgGA/StateSetManipulator>
#include <osgViewer/Renderer>
#include <osgViewer/ViewerEventHandlers>

#include <osgEarth/EarthManipulator>
#include <osgEarth/GLUtils>
#include <osgEarth/LogarithmicDepthBuffer>
#include <osgEarth/Registry>
#include <osgEarth/SpatialReference>

#include <QCoreApplication>
#include <QDebug>
#include <QFileInfo>
#include <QtMath>

namespace
{
const double _CAMERA_FOVY = 30.0;
const unsigned int targetMaximumNumberOfPageLOD = 1000;
} // namespace

Scene::Scene()
{
    _appDirPath = std::string(QCoreApplication::applicationDirPath().toLocal8Bit().data()) + "/";
    _dataDirPath = _appDirPath + "data_osg/";

#ifdef _WIN32
    _putenv_s("GDAL_DATA", (_dataDirPath + "gdal_data/").c_str());
    _putenv_s("PROJ_LIB", (_dataDirPath + "proj_data/").c_str());
#endif // _WIN32

    osg::DisplaySettings::instance()->setNumMultiSamples(4);
    osg::DisplaySettings::instance()->setNumOfDatabaseThreadsHint(4);
    osg::DisplaySettings::instance()->setNumOfHttpDatabaseThreadsHint(0);
    osg::DisplaySettings::instance()->setMinimumNumStencilBits(1);

    osgDB::Registry::instance()->getObjectWrapperManager()->findWrapper("osg::Image");
    osgDB::Registry::instance()->addMimeTypeExtensionMapping("application/octet-stream", "jpg");

    osgDB::FilePathList dataFilePathList = osgDB::Registry::instance()->getDataFilePathList();
    dataFilePathList.push_back(_dataDirPath);
    osgDB::Registry::instance()->setDataFilePathList(dataFilePathList);

    // not working in osgEarth 3.1.0
    //osgEarth::SpatialReference::init();

    _viewer = new osgViewer::CompositeViewer();
    _viewer->setThreadingModel(osgViewer::ViewerBase::SingleThreaded);
    _viewer->setIncrementalCompileOperation(new osgUtil::IncrementalCompileOperation());
    _viewer->setKeyEventSetsDone(0);

    _earthFileNode = osgDB::readNodeFile(_appDirPath + "data_osg/data.earth");

    if (_earthFileNode.valid())
    {
        _mapNode = osgEarth::MapNode::findMapNode(_earthFileNode);
    }
}
Scene::~Scene()
{
    if (_mapNode.valid())
    {
        _mapNode->clearExtensions();
        _mapNode = nullptr;
    }

    _rootNode = nullptr;
    _earthFileNode = nullptr;
    _viewer = nullptr;
}

void Scene::addView(osg::GraphicsContext* graphicsWindow)
{
    if (graphicsWindow == nullptr)
        return;

    if (!_viewer.valid())
        return;

    if (!_mapNode.valid())
        return;

    if (_view.valid())
    {
        osg::Camera* camera = _view->getCamera();

        if (camera->getGraphicsContext() == graphicsWindow)
        {
        }
        else
        {
            _viewer->getIncrementalCompileOperation()->removeGraphicsContext(
                camera->getGraphicsContext());
            _viewer->getIncrementalCompileOperation()->addGraphicsContext(graphicsWindow);

            camera->setGraphicsContext(graphicsWindow);

            const osg::GraphicsContext::Traits* traits = graphicsWindow->getTraits();
            camera->setViewport(new osg::Viewport((double) traits->x, (double) traits->y,
                                                  (double) traits->width, (double) traits->height));
            camera->setProjectionMatrix(
                osg::Matrixd::perspective(_CAMERA_FOVY,
                                          (double) traits->width / (double) traits->height, 1.0,
                                          2.0));

            // NOT working after update to osgEarth 3.1.0
            //_mapNode->getTerrainEngine()->dirtyTerrain();
        }
        return;
    }

    _viewer->getIncrementalCompileOperation()->addGraphicsContext(graphicsWindow);

    _view = new osgViewer::View();
    osgDB::DatabasePager* databasePager = _view->getDatabasePager();
    databasePager->setUnrefImageDataAfterApplyPolicy(true, false);
    databasePager->setTargetMaximumNumberOfPageLOD(targetMaximumNumberOfPageLOD);
    _viewer->addView(_view.get());

    osg::Camera* camera = _view->getCamera();
    camera->setGraphicsContext(graphicsWindow);
    camera->setClearColor(osg::Vec4f(198.0 / 255.0, 227.0 / 255.0, 243.0 / 255.0, 1.0f));
    camera->setNearFarRatio(0.00000001);
    camera->setComputeNearFarMode(osg::CullSettings::COMPUTE_NEAR_FAR_USING_BOUNDING_VOLUMES);
    camera->setSmallFeatureCullingPixelSize(-1.0f);

    const osg::GraphicsContext::Traits* traits = graphicsWindow->getTraits();
    camera->setViewport(new osg::Viewport((double) traits->x, (double) traits->y,
                                          (double) traits->width, (double) traits->height));
    camera->setProjectionMatrix(
        osg::Matrixd::perspective(_CAMERA_FOVY, (double) traits->width / (double) traits->height,
                                  1.0, 2.0));

    osgEarth::Util::LogarithmicDepthBuffer* logarithmicDepthBuffer =
        new osgEarth::Util::LogarithmicDepthBuffer();
    logarithmicDepthBuffer->setUseFragDepth(true);
    logarithmicDepthBuffer->install(camera);

    osg::StateSet* stateSet = camera->getOrCreateStateSet();
    stateSet->setAttributeAndModes(new osg::CullFace(osg::CullFace::BACK), osg::StateAttribute::ON);

    osgEarth::GLUtils::setGlobalDefaults(stateSet);

    _rootNode = new osg::Group();
    _rootNode->setName("RootNode");
    _earthFileNode->setName("EarthFileNode");
    _rootNode->addChild(_earthFileNode);
    _view->setSceneData(_rootNode);

    osg::ref_ptr<osgEarth::EarthManipulator> earthManipulator = new osgEarth::EarthManipulator();
    _view->setCameraManipulator(earthManipulator);
}
void Scene::frame()
{
    if (_viewer.valid())
        _viewer->frame();
}