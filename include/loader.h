#ifndef LOADER_H
#define LOADER_H

#include <QObject>
#include <QQmlApplicationEngine>

class Scene;

class Loader : public QObject
{
    Q_OBJECT

public:
    Loader();
    virtual ~Loader();

    void unloadQml();

    Scene* getScene()
    {
        return _scene;
    }

public slots:
    void loadQmlSlot();

protected:
    QQmlApplicationEngine* _engine;
    Scene* _scene;
};

#endif