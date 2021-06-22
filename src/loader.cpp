#include "loader.h"
#include "osg_quick_item.h"
#include "scene.h"

#include <QObject>
#include <QQmlApplicationEngine>
#include <QTimer>

Loader::Loader() : _engine(NULL), _scene(NULL)
{
}
Loader::~Loader()
{
    unloadQml();
}

void Loader::unloadQml()
{
    if (_engine != NULL)
    {
        delete _engine;
        _engine = NULL;
    }

    if (_scene != NULL)
    {
        delete _scene;
        _scene = NULL;
    }
}

void Loader::loadQmlSlot()
{
    //unloadQml();

    _engine = new QQmlApplicationEngine();
    _engine->load("qrc:///Main.qml");

    QList<QObject*> rootObjectList = _engine->rootObjects();
    if (!rootObjectList.isEmpty())
    {
        QObject* rootObject = rootObjectList.front();
        OsgQuickItem* osgQuickItem = rootObject->findChild<OsgQuickItem*>();
        if (osgQuickItem != NULL)
        {
            _scene = new Scene();
            _scene->addView(osgQuickItem->getGraphicsWindow());
            osgQuickItem->setScene(_scene);
        }
    }
}