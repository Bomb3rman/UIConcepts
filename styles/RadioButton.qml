import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

RadioButtonStyle {
    panel: BorderImage {
        id: root
        source: "ui/switchbg.png"
        width: 60;
        border.left: 10; border.top: 10
        border.right: 10; border.bottom: 10

        property string label;
        property bool on: true;
        property bool pressed: false;
//        control.onOnChecked: {
//            if (on) {
//                handle.x = handleArea.drag.minimumX
//            } else {
//                //switchOn.start()
//                handle.x = handleArea.drag.maximumX
//            }
//        }
        NumberAnimation { id: switchOff; running: !control.checked; target: handle; property: "x"; duration: 400;
            easing.type: Easing.InOutQuad; from: 1; to: 26 }
        NumberAnimation { id: switchOn; running: control.checked; target: handle; property: "x"; duration: 400;
            easing.type: Easing.InOutQuad; from: 26; to: 1 }
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


        MMKLabel {
            id: swhitchLabel
            anchors.left: root.right
            anchors.leftMargin: 17
            anchors.verticalCenter: parent.verticalCenter
            text: control.text
        }

        Item {
            id: clipRegion
            clip: true
            anchors.left: parent.left
            anchors.right: parent.right
            height: handle.height+4
            anchors.margins: 3
            Image {
                id: handle
                source: control.checked ? "ui/switchon.png" : "ui/switchoff.png"
                y: 2
                x: 1
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
            }
        }
    }
}
