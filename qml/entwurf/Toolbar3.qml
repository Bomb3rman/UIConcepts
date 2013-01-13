import QtQuick 2.0

BorderImage {
    id: root
    source: "ui/header.png"
    border.left: 5; border.top: 5
    border.right: 5; border.bottom: 5

    property alias model: tools.model

    ListView {
        id: tools
        anchors.left: parent.left
        anchors.leftMargin: 70
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.rightMargin: 30

        orientation: ListView.Horizontal

        delegate: Item {
            height: ListView.view.height
            width: 100
            Rectangle {
                id: highlite
                anchors.fill: parent
                anchors.margins: 1
                color: "#7a7a7a"
                visible: false
            }
            Text {
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                text: model.name
            }
            MouseArea {
                id: mouse
                hoverEnabled: true
                anchors.fill: parent
                onEntered: highlite.visible = true
                onExited: highlite.visible = false
            }

            Rectangle {
                height: parent.height-2
                width: 1
                color: "#f0f0f0"
            }
            Rectangle {
                height: parent.height-2
                width: 1
                color: "#d3d3d3"
                x:-1
            }
            Rectangle {
                height: parent.height-2
                width: 1
                x: parent.width-1
                color: "#f0f0f0"
            }
            Rectangle {
                height: parent.height-2
                width: 1
                color: "#d3d3d3"
                x: parent.width
            }
        }
    }

    Image {
        visible: alert
        source: "ui/notification.png"
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.verticalCenter: parent.verticalCenter
        NumberAnimation on opacity { running: true; from: 0.2; to: 1; loops: Animation.Infinite; duration: 1000}
    }
}
