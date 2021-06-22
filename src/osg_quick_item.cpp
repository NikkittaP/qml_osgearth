#include "osg_quick_item.h"
#include "scene.h"

#include <QOpenGLContext>
#include <QOpenGLFunctions>
#include <QQuickWindow>
#include <QUuid>

namespace
{
std::map<unsigned int, int> makeKeyMap()
{
    std::map<unsigned int, int> map;

    map[Qt::Key_Escape] = osgGA::GUIEventAdapter::KEY_Escape;
    map[Qt::Key_Delete] = osgGA::GUIEventAdapter::KEY_Delete;
    map[Qt::Key_Home] = osgGA::GUIEventAdapter::KEY_Home;
    map[Qt::Key_Enter] = osgGA::GUIEventAdapter::KEY_KP_Enter;
    map[Qt::Key_End] = osgGA::GUIEventAdapter::KEY_End;
    map[Qt::Key_Return] = osgGA::GUIEventAdapter::KEY_Return;
    map[Qt::Key_PageUp] = osgGA::GUIEventAdapter::KEY_Page_Up;
    map[Qt::Key_PageDown] = osgGA::GUIEventAdapter::KEY_Page_Down;
    map[Qt::Key_Left] = osgGA::GUIEventAdapter::KEY_Left;
    map[Qt::Key_Right] = osgGA::GUIEventAdapter::KEY_Right;
    map[Qt::Key_Up] = osgGA::GUIEventAdapter::KEY_Up;
    map[Qt::Key_Down] = osgGA::GUIEventAdapter::KEY_Down;
    map[Qt::Key_Backspace] = osgGA::GUIEventAdapter::KEY_BackSpace;
    map[Qt::Key_Tab] = osgGA::GUIEventAdapter::KEY_Tab;
    map[Qt::Key_Space] = osgGA::GUIEventAdapter::KEY_Space;
    map[Qt::Key_Delete] = osgGA::GUIEventAdapter::KEY_Delete;
    map[Qt::Key_Alt] = osgGA::GUIEventAdapter::KEY_Alt_L;
    map[Qt::Key_Shift] = osgGA::GUIEventAdapter::KEY_Shift_L;
    map[Qt::Key_Control] = osgGA::GUIEventAdapter::KEY_Control_L;
    map[Qt::Key_Meta] = osgGA::GUIEventAdapter::KEY_Meta_L;

    map[Qt::Key_F1] = osgGA::GUIEventAdapter::KEY_F1;
    map[Qt::Key_F2] = osgGA::GUIEventAdapter::KEY_F2;
    map[Qt::Key_F3] = osgGA::GUIEventAdapter::KEY_F3;
    map[Qt::Key_F4] = osgGA::GUIEventAdapter::KEY_F4;
    map[Qt::Key_F5] = osgGA::GUIEventAdapter::KEY_F5;
    map[Qt::Key_F6] = osgGA::GUIEventAdapter::KEY_F6;
    map[Qt::Key_F7] = osgGA::GUIEventAdapter::KEY_F7;
    map[Qt::Key_F8] = osgGA::GUIEventAdapter::KEY_F8;
    map[Qt::Key_F9] = osgGA::GUIEventAdapter::KEY_F9;
    map[Qt::Key_F10] = osgGA::GUIEventAdapter::KEY_F10;
    map[Qt::Key_F11] = osgGA::GUIEventAdapter::KEY_F11;
    map[Qt::Key_F12] = osgGA::GUIEventAdapter::KEY_F12;
    map[Qt::Key_F13] = osgGA::GUIEventAdapter::KEY_F13;
    map[Qt::Key_F14] = osgGA::GUIEventAdapter::KEY_F14;
    map[Qt::Key_F15] = osgGA::GUIEventAdapter::KEY_F15;
    map[Qt::Key_F16] = osgGA::GUIEventAdapter::KEY_F16;
    map[Qt::Key_F17] = osgGA::GUIEventAdapter::KEY_F17;
    map[Qt::Key_F18] = osgGA::GUIEventAdapter::KEY_F18;
    map[Qt::Key_F19] = osgGA::GUIEventAdapter::KEY_F19;
    map[Qt::Key_F20] = osgGA::GUIEventAdapter::KEY_F20;

    map[Qt::Key_hyphen] = '-';
    map[Qt::Key_Equal] = '=';

    map[Qt::Key_division] = osgGA::GUIEventAdapter::KEY_KP_Divide;
    map[Qt::Key_multiply] = osgGA::GUIEventAdapter::KEY_KP_Multiply;
    map[Qt::Key_Minus] = '-';
    map[Qt::Key_Plus] = '+';
    map[Qt::Key_Insert] = osgGA::GUIEventAdapter::KEY_KP_Insert;

    return map;
}

std::map<unsigned int, int> keyMap(makeKeyMap());

inline int swapKey(QKeyEvent* event)
{
    std::map<unsigned int, int>::iterator it = keyMap.find(event->key());
    return it == keyMap.end() ? static_cast<int>(*(event->text().toLatin1().data())) : it->second;
}

const QColor clearColor(255, 0, 0, 255);
} // namespace

OsgQuickItem::OsgQuickItem(QQuickItem* parent) : QQuickItem(parent), _scene(nullptr)
{
    setFlag(ItemHasContents, true);
    setAcceptedMouseButtons(Qt::AllButtons);
    setAcceptHoverEvents(true);

    connect(this, &QQuickItem::windowChanged, this, &OsgQuickItem::windowChangedSlot);
    connect(this, &OsgQuickItem::updateSignal, this, &QQuickItem::update);

    _geometry = QRectF(0.0, 0.0, 0.0, 0.0);
    createGraphicsWindow();
}

OsgQuickItem::~OsgQuickItem()
{
}

void OsgQuickItem::setScene(Scene* scene)
{
    _scene = scene;
}

void OsgQuickItem::createGraphicsWindow()
{
    _graphicsWindow = new osgViewer::GraphicsWindowEmbedded(0, 0, 600, 400);
}

void OsgQuickItem::windowChangedSlot(QQuickWindow* quickWindow)
{
    if (quickWindow != NULL)
        quickWindow->setClearBeforeRendering(false);
}

QSGNode* OsgQuickItem::updatePaintNode(QSGNode* oldNode, UpdatePaintNodeData* updatePaintNodeData)
{
    QSGNode* node = oldNode;
    if (node == NULL)
        node = new QSGNode();

    qreal ratio = window()->devicePixelRatio();
    QPointF pos = mapToScene(QPointF(0.0, 0.0)) * ratio;
    pos.setY(window()->height() * ratio - height() * ratio - pos.y());
    QRectF geometry = QRectF(pos.x(), pos.y(), width() * ratio, height() * ratio);

    if (geometry != _geometry)
    {
        if (_graphicsWindow != nullptr)
        {
            _graphicsWindow->resized((int) geometry.x(), (int) geometry.y(), (int) geometry.width(),
                                     (int) geometry.height());

            osg::GraphicsContext::Cameras& cameraList = _graphicsWindow->getCameras();
            osg::GraphicsContext::Cameras::iterator currentCamera = cameraList.begin();
            osg::GraphicsContext::Cameras::const_iterator endCamera = cameraList.end();
            while (currentCamera != endCamera)
            {
                osg::Camera* camera = (*currentCamera);

                if (camera->getRenderTargetImplementation() == osg::Camera::FRAME_BUFFER_OBJECT)
                {
                    ++currentCamera;
                    continue;
                }

                camera->setViewport(new osg::Viewport((int) geometry.x(), (int) geometry.y(),
                                                      (int) geometry.width(),
                                                      (int) geometry.height()));

                ++currentCamera;
            }

            _graphicsWindow->getEventQueue()->windowResize((int) geometry.x(), (int) geometry.y(),
                                                           (int) geometry.width(),
                                                           (int) geometry.height());
        }

        _geometry = geometry;
    }

    QOpenGLFunctions* openGLFunctions = window()->openglContext()->functions();
    openGLFunctions->glUseProgram(0);
    openGLFunctions->glClearColor(clearColor.redF(), clearColor.greenF(), clearColor.blueF(),
                                  clearColor.alphaF());
    openGLFunctions->glClear(GL_COLOR_BUFFER_BIT);

    if (_scene != nullptr)
        _scene->frame();

    window()->resetOpenGLState();

    node->markDirty(QSGNode::DirtyForceUpdate);

    emit updateSignal();

    return node;
}

void OsgQuickItem::mouseMoveEvent(QMouseEvent* event)
{
    qreal ratio = window()->devicePixelRatio();
    QPointF pos = mapToScene(QPointF(event->x(), event->y())) * ratio;
    pos.setY(pos.y() + height() * ratio - window()->height() * ratio);

    if (_graphicsWindow != nullptr)
    {
        _graphicsWindow->getEventQueue()->mouseMotion(pos.x(), pos.y());
    }
}

void OsgQuickItem::mousePressEvent(QMouseEvent* event)
{
    int modkey = event->modifiers() & (Qt::ShiftModifier | Qt::ControlModifier | Qt::AltModifier);
    unsigned int mask = 0;
    if (modkey & Qt::ShiftModifier)
        mask |= osgGA::GUIEventAdapter::MODKEY_SHIFT;
    if (modkey & Qt::ControlModifier)
        mask |= osgGA::GUIEventAdapter::MODKEY_CTRL;
    if (modkey & Qt::AltModifier)
        mask |= osgGA::GUIEventAdapter::MODKEY_ALT;

    if (_graphicsWindow != nullptr)
        _graphicsWindow->getEventQueue()->getCurrentEventState()->setModKeyMask(mask);

    unsigned int button = 0;

    switch (event->button())
    {
    case Qt::LeftButton:
        button = 1;
        break;
    case Qt::MiddleButton:
        button = 2;
        break;
    case Qt::RightButton:
        button = 3;
        break;
    default:
        break;
    }

    qreal ratio = window()->devicePixelRatio();
    QPointF pos = mapToScene(QPointF(event->x(), event->y())) * ratio;
    pos.setY(pos.y() + height() * ratio - window()->height() * ratio);

    if (_graphicsWindow != nullptr)
        _graphicsWindow->getEventQueue()->mouseButtonPress(pos.x(), pos.y(), button);
}

void OsgQuickItem::mouseReleaseEvent(QMouseEvent* event)
{
    int modkey = event->modifiers() & (Qt::ShiftModifier | Qt::ControlModifier | Qt::AltModifier);
    unsigned int mask = 0;
    if (modkey & Qt::ShiftModifier)
        mask |= osgGA::GUIEventAdapter::MODKEY_SHIFT;
    if (modkey & Qt::ControlModifier)
        mask |= osgGA::GUIEventAdapter::MODKEY_CTRL;
    if (modkey & Qt::AltModifier)
        mask |= osgGA::GUIEventAdapter::MODKEY_ALT;

    if (_graphicsWindow != nullptr)
        _graphicsWindow->getEventQueue()->getCurrentEventState()->setModKeyMask(mask);

    unsigned int button = 0;

    switch (event->button())
    {
    case Qt::LeftButton:
        button = 1;
        break;
    case Qt::MiddleButton:
        button = 2;
        break;
    case Qt::RightButton:
        button = 3;
        break;
    default:
        break;
    }

    qreal ratio = window()->devicePixelRatio();
    QPointF pos = mapToScene(QPointF(event->x(), event->y())) * ratio;
    pos.setY(pos.y() + height() * ratio - window()->height() * ratio);

    if (_graphicsWindow != nullptr)
        _graphicsWindow->getEventQueue()->mouseButtonRelease(pos.x(), pos.y(), button);
}

void OsgQuickItem::mouseDoubleClickEvent(QMouseEvent* event)
{
    int modkey = event->modifiers() & (Qt::ShiftModifier | Qt::ControlModifier | Qt::AltModifier);
    unsigned int mask = 0;
    if (modkey & Qt::ShiftModifier)
        mask |= osgGA::GUIEventAdapter::MODKEY_SHIFT;
    if (modkey & Qt::ControlModifier)
        mask |= osgGA::GUIEventAdapter::MODKEY_CTRL;
    if (modkey & Qt::AltModifier)
        mask |= osgGA::GUIEventAdapter::MODKEY_ALT;

    if (_graphicsWindow != nullptr)
        _graphicsWindow->getEventQueue()->getCurrentEventState()->setModKeyMask(mask);

    unsigned int button = 0;

    switch (event->button())
    {
    case Qt::LeftButton:
        button = 1;
        break;
    case Qt::MiddleButton:
        button = 2;
        break;
    case Qt::RightButton:
        button = 3;
        break;
    default:
        break;
    }

    qreal ratio = window()->devicePixelRatio();
    QPointF pos = mapToScene(QPointF(event->x(), event->y())) * ratio;
    pos.setY(pos.y() + height() * ratio - window()->height() * ratio);

    if (_graphicsWindow != nullptr)
        _graphicsWindow->getEventQueue()->mouseDoubleButtonPress(pos.x(), pos.y(), button);
}

void OsgQuickItem::wheelEvent(QWheelEvent* event)
{
    int delta = event->delta();

    osgGA::GUIEventAdapter::ScrollingMotion motion = delta > 0
                                                         ? osgGA::GUIEventAdapter::SCROLL_UP
                                                         : osgGA::GUIEventAdapter::SCROLL_DOWN;

    if (_graphicsWindow != nullptr)
        _graphicsWindow->getEventQueue()->mouseScroll(motion);
}

void OsgQuickItem::keyPressEvent(QKeyEvent* event)
{
    int modkey = event->modifiers() & (Qt::ShiftModifier | Qt::ControlModifier | Qt::AltModifier);
    unsigned int mask = 0;
    if (modkey & Qt::ShiftModifier)
        mask |= osgGA::GUIEventAdapter::MODKEY_SHIFT;
    if (modkey & Qt::ControlModifier)
        mask |= osgGA::GUIEventAdapter::MODKEY_CTRL;
    if (modkey & Qt::AltModifier)
        mask |= osgGA::GUIEventAdapter::MODKEY_ALT;

    if (_graphicsWindow != nullptr)
    {
        _graphicsWindow->getEventQueue()->getCurrentEventState()->setModKeyMask(mask);
        _graphicsWindow->getEventQueue()->keyPress(swapKey(event), (int) event->nativeVirtualKey());
    }
}

void OsgQuickItem::keyReleaseEvent(QKeyEvent* event)
{
    if (event->isAutoRepeat())
        event->ignore();
    else
    {
        int modkey = event->modifiers() &
                     (Qt::ShiftModifier | Qt::ControlModifier | Qt::AltModifier);
        unsigned int mask = 0;
        if (modkey & Qt::ShiftModifier)
            mask |= osgGA::GUIEventAdapter::MODKEY_SHIFT;
        if (modkey & Qt::ControlModifier)
            mask |= osgGA::GUIEventAdapter::MODKEY_CTRL;
        if (modkey & Qt::AltModifier)
            mask |= osgGA::GUIEventAdapter::MODKEY_ALT;

        if (_graphicsWindow != nullptr)
        {
            _graphicsWindow->getEventQueue()->getCurrentEventState()->setModKeyMask(mask);
            _graphicsWindow->getEventQueue()->keyRelease(swapKey(event),
                                                         (int) event->nativeVirtualKey());
        }
    }
}

void OsgQuickItem::hoverEnterEvent(QHoverEvent* event)
{
    forceActiveFocus();
}

void OsgQuickItem::hoverMoveEvent(QHoverEvent* event)
{
    qreal ratio = window()->devicePixelRatio();
    QPointF mouseScreenPos = mapToScene(event->posF()) * ratio;
    mouseScreenPos.setY(mouseScreenPos.y() + height() * ratio - window()->height() * ratio);

    if (_graphicsWindow != nullptr)
    {
        _graphicsWindow->getEventQueue()->mouseMotion(mouseScreenPos.x(), mouseScreenPos.y());
    }
}

void OsgQuickItem::touchEvent(QTouchEvent* event)
{
    if (_graphicsWindow == nullptr)
        return;

    osg::ref_ptr<osgGA::GUIEventAdapter> ea;
    const QList<QTouchEvent::TouchPoint>& touchPoints = event->touchPoints();

    for (QList<QTouchEvent::TouchPoint>::const_iterator touchPointItr = touchPoints.begin();
         touchPointItr != touchPoints.end(); ++touchPointItr)
    {
        QPointF pos = mapToScene(touchPointItr->pos());
        int id = touchPointItr->id();

        if (touchPointItr->state() == Qt::TouchPointPressed)
        {
            if (ea)
                ea->addTouchPoint(id, osgGA::GUIEventAdapter::TOUCH_BEGAN, pos.x(), pos.y());
            else
            {
                ea = _graphicsWindow->getEventQueue()
                         ->touchBegan(id, osgGA::GUIEventAdapter::TOUCH_BEGAN, pos.x(), pos.y());
            }
        }
        else if (touchPointItr->state() == Qt::TouchPointMoved)
        {
            if (ea)
                ea->addTouchPoint(id, osgGA::GUIEventAdapter::TOUCH_MOVED, pos.x(), pos.y());
            else
            {
                ea = _graphicsWindow->getEventQueue()
                         ->touchMoved(id, osgGA::GUIEventAdapter::TOUCH_MOVED, pos.x(), pos.y());
            }
        }
        else if (touchPointItr->state() == Qt::TouchPointReleased)
        {
            if (ea)
                ea->addTouchPoint(id, osgGA::GUIEventAdapter::TOUCH_ENDED, pos.x(), pos.y());
            else
            {
                ea = _graphicsWindow->getEventQueue()
                         ->touchEnded(id, osgGA::GUIEventAdapter::TOUCH_ENDED, pos.x(), pos.y(), 1);
            }
        }
        else if (touchPointItr->state() == Qt::TouchPointStationary)
        {
            if (ea)
                ea->addTouchPoint(id, osgGA::GUIEventAdapter::TOUCH_STATIONERY, pos.x(), pos.y());
            else
            {
                ea = _graphicsWindow->getEventQueue()
                         ->touchEnded(id, osgGA::GUIEventAdapter::TOUCH_STATIONERY, pos.x(),
                                      pos.y(), 1);
            }
        }
    }

    event->setAccepted(true);
}
