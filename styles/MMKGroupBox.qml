import QtQuick 2.0

Item {
    implicitWidth: Math.max(200, contentWidth + 30)
    implicitHeight: contentHeight

    Text {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 4
        text: control.title
    }
}

