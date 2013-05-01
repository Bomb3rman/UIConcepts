import QtQuick 2.0

ListView {
    model: messageCenter
    delegate: Rectangle {
        height: expanded ? 40 + description.height : 26
        anchors.left: parent.left
        anchors.right: parent.right
        property bool expanded: false
        property bool hovered: mArea.containsMouse
        color: hovered ? "#AAAAAAAA" : "transparent"
        Text {
            id: title
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 10
            anchors.topMargin: 5
            text: model.title
            font.pixelSize: 16
            font.bold: true
            color: "white"
        }
        Text {
            id: description
            visible: parent.expanded
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: title.bottom
            anchors.margins: 10
            anchors.leftMargin: 20
            text: model.description
            wrapMode: Text.WordWrap
            font.pixelSize: 16
            font.bold: true
            color: "white"
        }
        Image {
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 1
            height: 24
            width: 24
            source: model.type === "Error" ? "pics/error.png" :
                                             model.type === "Info" ? "pics/info.png" :
                                                                     model.type === "Note" ? "pics/question.png" : "";
        }
        MouseArea {
            id: mArea
            anchors.fill: parent
            onClicked: parent.expanded = ! parent.expanded
            hoverEnabled: true
        }
    }
}
