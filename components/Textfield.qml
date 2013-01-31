import QtQuick 2.0

BorderImage {
    id: root
    source: "ui/textfield.png"
    border.left: 5; border.top: 5
    border.right: 5; border.bottom: 5
    antialiasing: true
    width: tInput.width
    //height: tInput.height
    TextInput {
        id: tInput
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.margins: 10
        width: 150
        //height: parent.height -10
        font.pixelSize: 15
        //cursorVisible: true
    }
}
