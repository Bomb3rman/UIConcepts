import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

Rectangle {
    Text {
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: 20
        anchors.topMargin: 40
        wrapMode: Text.WordWrap
        text: pageDocumentation.text
    }

    Button {
        z:12
        width: 90
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: 10
        text: "Close"
        onClicked: pageDocumentation.visible = !pageDocumentation.visible
        style: buttonStyle
    }
}
