import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

Rectangle {
    color: "darkgray"
    TextArea {
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 10
        anchors.topMargin: 40
        wrapMode: Text.WordWrap
        text: pageDocumentation.text
        textFormat: Qt.RichText
    }

    Button {
        z:12
        width: 50
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: 8
        text: "X"
        onClicked: pageDocumentation.visible = !pageDocumentation.visible
        style: buttonStyle
    }
}
