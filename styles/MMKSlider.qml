import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

SliderStyle {
    handle: Rectangle {
        property int maxWidth: 25
        width: control.pressed ? maxWidth : 20
        height: width
        y: -1
        radius: height
        antialiasing: true
        color: "transparent" //Qt.lighter("#468bb7", 1.2)
        border.width: control.pressed ? 5 : 3
        border.color: control.pressed ? "white" : Qt.darker("#FFFFFF", 1.2)
        Behavior on border.width { NumberAnimation{ duration:200} }
        Behavior on width { NumberAnimation{ duration:200} }

        Rectangle {
            visible: control.pressed
            anchors.top: parent.bottom
            anchors.topMargin: 6
            anchors.horizontalCenter: parent.horizontalCenter
            color: "black"
            border.width: 1
            border.color: Qt.lighter("black", 1.2)
            width: txt.width + 5
            height: txt.height + 2
            Text {
                id: txt
                anchors.centerIn: parent
                text: control.value
                font.pixelSize: 10
                color: "white"
            }
        }
    }

    background: Item {
        implicitWidth: 200
        height: bg.height
        BorderImage {
            id:bg
            source: "ui/progressbar.png"
            width: parent.width - handle.maxWidth/2
            x: handle.maxWidth/2
            anchors.verticalCenter: parent.verticalCenter
            border.left: 5; border.top: 5
            border.right: 5; border.bottom: 5


            BorderImage {
                id: progress
                source: "ui/progressbarfill2.png"
                width: parent.width * control.value / control.maximumValue -4
                x: 2
                y: 2
                //height: parent.height
                border.left: 5; border.top: 5
                border.bottom: 5; border.right: 5
            }
        }
    }/*Item {

        Rectangle {
            height: 8
            width: parent.width - handle.width/2
            x: handle.width/2
            anchors.verticalCenter: parent.verticalCenter
            color: "#444"
            opacity: 0.8
            Rectangle {
                antialiasing: true
                radius: 1
                color: "#468bb7"
                height: parent.height
                width: parent.width * control.value / control.maximumValue
            }
        }
    }*/
}
