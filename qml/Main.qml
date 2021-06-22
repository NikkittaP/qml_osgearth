import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

import OsgQuick 1.0

ApplicationWindow {
    id: main
    visible: true
    minimumWidth: 800
    minimumHeight: 600
    width: 1200
    height: 600
    title: "QML osgEarth"

    Item {
        z:0
        id: mainWindow
        objectName: "mainWindow"
        anchors.left: parent.left
        height: parent.height
        width: parent.width

        OsgQuickItem {
            anchors.fill: parent
            focus: true
        }
    }
}
