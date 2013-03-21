import QtQuick 2.0

BorderImage {
    id: root
    source: "ui/switchbg.png"
    width: 60;
    border.left: 10; border.top: 10
    border.right: 10; border.bottom: 10

    property string label;
    property bool on: true;
    property bool pressed: false;
    onOnChanged: {
        if (on) {
            handle.x = handleArea.drag.minimumX
        } else {
            //switchOn.start()
            handle.x = handleArea.drag.maximumX
        }
    }
    NumberAnimation { id: switchOff; target: handle; property: "x"; duration: 400;
        easing.type: Easing.InOutQuad; from: handle.x; to: handleArea.drag.maximumX }
    NumberAnimation { id: switchOn; target: handle; property: "x"; duration: 400;
        easing.type: Easing.InOutQuad; from: handle.x; to: handleArea.drag.minimumX }
    Rectangle {
        id:sep1
        color: "black"
        height: parent.height
        width: 1
        anchors.left: parent.right
        anchors.leftMargin: 8
    }
    Rectangle {
        color: "#1f1f1f"
        height: parent.height
        width: 1
        anchors.left: sep1.right
    }


    Label {
        id: swhitchLabel
        anchors.left: root.right
        anchors.leftMargin: 17
        anchors.top: parent.top
        anchors.topMargin: 3
        text: root.label
    }

    Item {
        id: clipRegion
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
                onClicked: switchOff.start();
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
                onClicked: switchOn.start();
            }
        }
    }
}
