import QtQuick 2.0

BorderImage {
    id: root
    height: 150
    width: 200
    source: "ui/header.png"
    border.left: 5; border.top: 5
    border.right: 5; border.bottom: 5
    smooth: true
    antialiasing:  true

    Text {
        id: title
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 10
        text: model.name
        font.family: myFont.name
    }

    Text {
        id: subtitle
        anchors.top: title.bottom
        anchors.left: parent.left
        anchors.margins: 10
        text: model.parameters
        font.family: myFont.name
    }
}
