import QtQuick 2.0

Rectangle {
    antialiasing: true
    width: tInput.width
    height: tInput.height
    radius: 15
    TextInput {
        id: tInput
        anchors.left: parent.left
        anchors.margins: 10
        width: 150
        //cursorVisible: true
    }
}
