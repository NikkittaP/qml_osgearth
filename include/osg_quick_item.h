#ifndef OSG_QUICK_ITEM_H
#define OSG_QUICK_ITEM_H

#include <osgViewer/GraphicsWindow>
#include <scene.h>

#include <QQuickItem>

class OsgQuickItem : public QQuickItem
{
    Q_OBJECT

public:
    explicit OsgQuickItem(QQuickItem* parent = nullptr);
    ~OsgQuickItem();

    void setScene(Scene* scene);

    osgViewer::GraphicsWindow* getGraphicsWindow()
    {
        return _graphicsWindow;
    }

private:
    void createGraphicsWindow();

signals:
    void updateSignal();

protected slots:
    void windowChangedSlot(QQuickWindow* window);

protected:
    QSGNode* updatePaintNode(QSGNode* oldNode, UpdatePaintNodeData* updatePaintNodeData) override;
    void mouseMoveEvent(QMouseEvent* event) override;
    void mousePressEvent(QMouseEvent* event) override;
    void mouseReleaseEvent(QMouseEvent* event) override;
    void mouseDoubleClickEvent(QMouseEvent* event) override;
    void wheelEvent(QWheelEvent* event) override;
    void keyPressEvent(QKeyEvent* event) override;
    void keyReleaseEvent(QKeyEvent* event) override;
    void hoverEnterEvent(QHoverEvent* event) override;
    void hoverMoveEvent(QHoverEvent* event) override;
    void touchEvent(QTouchEvent* event) override;

    Scene* _scene = nullptr;

    QRectF _geometry;
    osg::ref_ptr<osgViewer::GraphicsWindow> _graphicsWindow;
};

#endif
