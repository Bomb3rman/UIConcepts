import QtQuick 2.0

BorderImage {
    id: root
    source: pressed ? "ui/buttonpressed.png" : "ui/button.png"
    property bool pressed: false
    border.left: 5; border.top: 5
    border.right: 5; border.bottom: 5

    width: 100


    Text {
        id: text
        font.family: myFont.name
        color: root.pressed ? "#27440a" : "#7e7e80"
        text: "Button"
        anchors.centerIn: parent
    }
    MouseArea {
        anchors.fill: parent
        onPressed: root.pressed = true
        onReleased: root.pressed = false
    }
}
