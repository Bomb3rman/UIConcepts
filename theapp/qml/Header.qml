import QtQuick 2.0

BorderImage {
    source: "ui/header.png"
    border.left: 5; border.top: 5
    border.right: 5; border.bottom: 5
    //height: arrow.height

    Text {
        id: section
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 15
        text: "Section #1"
        font.pixelSize: 13
        font.bold: true
        font.family: myFont.name
        color: "#9b9b9b"
    }

    Image {
        id: arrow
        anchors.left: section.right
        anchors.leftMargin: 15
        anchors.verticalCenter: parent.verticalCenter
        source: "ui/arrow.png"
    }

    Text {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: arrow.right
        anchors.leftMargin: 15
        text: "Machine State"
        font.pixelSize: 13
        font.bold: true
        font.family: myFont.name
        color: "#676666"
    }
}
