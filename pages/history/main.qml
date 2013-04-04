import QtQuick 2.0
import MMKQmlStyle 1.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

MMKPage {
    id: rootPage
    Text {
        anchors.centerIn: parent
        font.bold: true
        font.pixelSize: 30
        color: "white"
        text: "Liste mit Sachen drin. \n Mit ausfahrbarem Menue.\n
            Informationen zu dem Brett"
    }

    ListView {
        id: lView
        anchors.fill: parent
        anchors.topMargin: 200
        anchors.margins: 30
        model: historyModel
        delegate: Rectangle {
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
                text: model.plank
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.margins: 10
            }
            Text {
                id: text
                color: "white"
                font.pixelSize: 20
                text: model.text
                anchors.left: parent.left
                anchors.top: title.bottom
                anchors.margins: 10
            }
            Text {
                id: date
                color: "white"
                font.pixelSize: 15
                text: model.start + " - " + model.end
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.margins: 10
            }

            Behavior on height {
                NumberAnimation {duration: 300}
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    print("clicked")
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
