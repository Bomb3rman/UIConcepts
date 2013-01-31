import QtQuick 2.0

BorderImage {
    id: root
    source: "ui/switchbg.png"
    width: 60;
    border.left: 10; border.top: 10
    border.right: 10; border.bottom: 10
    clip: true

    property string label;
    property bool on: true;
    property bool pressed: false;
    onOnChanged: {
        if (on) {
            handle.x = handleArea.drag.minimumX
        } else {
            handle.x = handleArea.drag.maximumX
        }
    }

    Item {
        clip: true
        anchors.left: parent.left
        anchors.right: parent.right
        height: handle.height+4
        anchors.margins: 5

        Image {
            id: handle
            source: root.pressed ? "ui/switchon.png" : "ui/switchoff.png"
            //anchors.verticalCenter: parent.verticalCenter
            //anchors.topMargin: -5
            y: 2
            x: 1
            MouseArea {
                id: handleArea
                anchors.fill: parent
                anchors.margins: -10
                drag.minimumX: 1
                drag.maximumX: 26
                drag.target: handle
                drag.axis: Drag.XAxis
                onPressed: root.pressed = true
                onReleased: root.pressed = false
            }
            onXChanged: {
                if (x > 25)
                    root.on = false
                else if (x < 15)
                    root.on = true
            }
        }
        Text {
            id: onText
            color: "white"
            anchors.left: handle.right
            anchors.leftMargin: 7
            anchors.verticalCenter: handle.verticalCenter
            text: "On"
            font.bold: true
            font.pixelSize: 11
            font.family: myFont.name
            MouseArea {
                anchors.fill: parent
                onClicked: root.on = false
            }
        }
        Text {
            id: offText
            color: "white"
            anchors.right: handle.left
            anchors.rightMargin: 7
            anchors.verticalCenter: handle.verticalCenter
            text: "Off"
            font.bold: true
            font.pixelSize: 11
            font.family: myFont.name
            MouseArea {
                anchors.fill: parent
                onClicked: root.on = true
            }
        }
    }
}
