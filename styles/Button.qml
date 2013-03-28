import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

ButtonStyle {
    id: root
    background: Item {
        implicitHeight: 50
        implicitWidth: 170
        Component.onCompleted: print ("----------" + root.label)
        BorderImage {
            id: img
            anchors.fill: parent
            antialiasing: true
            border.bottom: 5
            border.top: 5
            border.left: 5
            border.right: 5
            anchors.margins: control.pressed ? -4 : 0
            source: control.pressed ? "ui/buttonpressed.png" : "ui/button.png"
        }
    }
    foregroundColor: "white"
    font.pixelSize: 23
}

//BorderImage {
//    id: root
//    source: pressed ? "ui/buttonpressed.png" : "ui/button.png"
//    property bool pressed: false
//    border.left: 5; border.top: 5
//    border.right: 5; border.bottom: 5
//    property string text: "Button"
//    width: 100

//    signal clicked();

//    Text {
//        id: text
//        //font.family: myFont.name
//        color: "white"//root.pressed ? "#27440a" : "#7e7e80"
//        text: root.text
//        anchors.centerIn: parent
//    }
//    MouseArea {
//        anchors.fill: parent
//        onPressed: root.pressed = true
//        onReleased: root.pressed = false
//        z: 1
//        preventStealing: true
//        onClicked: root.clicked()
//    }
//}
