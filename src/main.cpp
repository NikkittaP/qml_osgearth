// FlightPathOSG.cpp : Defines the entry point for the console application.
//

#include "loader.h"
#include "osg_quick_item.h"
#include "scene.h"

#include <QDir>
#include <QGuiApplication>
#include <QSurfaceFormat>

int main(int argc, char* argv[])
{
    osgEarth::initialize();

    QGuiApplication app(argc, argv);

    QSurfaceFormat surfaceFormat;
    surfaceFormat.setDepthBufferSize(24);
    surfaceFormat.setStencilBufferSize(8);
    surfaceFormat.setSamples(16);
    QSurfaceFormat::setDefaultFormat(surfaceFormat);

    qmlRegisterType<OsgQuickItem>("OsgQuick", 1, 0, "OsgQuickItem");

    Loader* loader = new Loader();
    loader->loadQmlSlot();

    bool appResult = app.exec();

    delete loader;

    return appResult;
}
