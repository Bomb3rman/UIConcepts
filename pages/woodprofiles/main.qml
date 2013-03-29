import QtQuick 2.0
import MMKQmlStyle 1.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

MMKPage {
    id: rootPage
    Text {
        id: title
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 10
        font.bold: true
        font.pixelSize: 30
        color: "white"
        text: "Wood profiles"
    }

    Grid {
        anchors.top: title.bottom
        anchors.left: parent.left
        anchors.margins: 20
        spacing: 10
        Repeater {
            model: woodModel
            delegate: Box {
                width: 220
                height: 150
                Image {
                    id: img
                    width: 100
                    height: 100
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    source: model.image
                }
                Text {
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.topMargin: 5
                    anchors.rightMargin: 7
                    color: "white"
                    text: model.name
                }
            }
        }
    }
}
