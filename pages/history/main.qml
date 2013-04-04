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
        text: "History"
    }

    ListView {
        id: lView
        anchors.fill: parent
        anchors.topMargin: 130
        anchors.margins: 30
        model: historyModel
        delegate: Rectangle {
            radius: 3
            height: state == "minimized" ? 50 : 150
            width: lView.width
            clip: true
            border.color: "black"
            border.width: 2
            opacity: 0.7
            color: "darkgrey"
            Text {
                id: title
                color: "white"
                font.pixelSize: 20
                font.bold: true
                text: model.plank
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.margins: 10
            }
            Text {
                id: text
                color: "white"
                font.pixelSize: 15
                text: model.text
                anchors.left: parent.left
                anchors.top: title.bottom
                anchors.margins: 10
            }
            Text {
                id: correctionsTitle
                color: "white"
                font.pixelSize: 15
                font.bold: true
                text: "Corrections:"
                anchors.left: parent.left
                anchors.top: text.bottom
                anchors.margins: 10
            }
            Text {
                id: date
                color: "white"
                font.pixelSize: 15
                text: Qt.formatDateTime(model.start, "dd.MM.yyyy hh:mm") + " - " + Qt.formatDateTime(model.end, "dd.MM.yyyy hh:mm")
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.margins: 10
            }

            property var stringList: model.corrections

            Column {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: correctionsTitle.bottom
                anchors.leftMargin: 20
                anchors.rightMargin: 20
                anchors.topMargin: 5
                height: 80
                Repeater {
                    model: stringList
                    delegate: Text {
                        text: modelData
                        color: "white"
                        font.pixelSize: 14
                    }
                }
            }

            Behavior on height {
                NumberAnimation {duration: 300}
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if(parent.state == "minimized")
                        parent.state = "maximized";
                    else
                        parent.state = "minimized"
                }
            }

            state: "minimized"
            states: [
                State {
                    name: "minimized"
                },
                State {
                    name: "maximized"
                }

            ]
        }
    }
}
