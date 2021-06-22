#ifndef SCENE_H
#define SCENE_H

#include <QObject>
#include <QQmlContext>

#include <osgGA/NodeTrackerManipulator>
#include <osgGA/OrbitManipulator>
#include <osgViewer/CompositeViewer>

#include <osgEarth/MapNode>

class Scene : public QObject
{
    Q_OBJECT

public:
    Scene();
    virtual ~Scene();

    virtual osgViewer::CompositeViewer* getViewer()
    {
        return _viewer;
    }

    void addView(osg::GraphicsContext* graphicsWindow);
    void frame();

protected:
    std::string _appDirPath;
    std::string _dataDirPath;

    osg::ref_ptr<osgViewer::CompositeViewer> _viewer;
    osg::observer_ptr<osgViewer::View> _view;
    osg::ref_ptr<osg::Node> _earthFileNode;
    osg::ref_ptr<osgEarth::MapNode> _mapNode;
    osg::ref_ptr<osg::Group> _rootNode;
};

#endif