import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

TextFieldStyle {
    foregroundColor: "black"
    selectionColor: "darkgrey"
    font.pixelSize: 15
    font.bold: true
    background: Item {
        implicitHeight: img.height
        implicitWidth: 150
        BorderImage {
            id: img
            source: "ui/textfield.png"
            border.left: 5; border.top: 5
            border.right: 5; border.bottom: 5
            antialiasing: true
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
        }
    }
    topMargin: 0
    bottomMargin: 0
}
