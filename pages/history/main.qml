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

    Rectangle {
        id: woodPreview
        anchors.top: title.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: lView.top
        anchors.margins: 15

        Text {
            anchors.centerIn: parent
            text: "Wood preview"
        }
    }

    Box {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: lView.left
        anchors.top: lView.top
        anchors.margins: 15

        Text {
            id: text1
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.margins: 20
            font.bold: true
            font.pixelSize: 15
            color: "white"
            text: "Work mode: stopped\n\nProfile: Testprofile"
        }
        Text {
            id: text2
            anchors.top: text1.bottom
            anchors.left: parent.left
            anchors.margins: 20
            font.bold: true
            font.pixelSize: 15
            color: "white"
            text: "Space:     Width: 250.0      Thickness: 45.0"
        }
        Text {
            id: text3
            anchors.top: text2.bottom
            anchors.left: parent.left
            anchors.margins: 20
            font.bold: true
            font.pixelSize: 25
            color: "white"
            text: "Total Yield: 0.0%       0.0 [m^2]"
        }
    }

    ListView {
        id: lView
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.right: parent.right
        width: 250
        height: 300
        clip: true
        model: historyModel
        delegate: Rectangle {
            radius: 3
            height: 50
            width: lView.width
            clip: true
            border.color: "black"
            border.width: 2
            opacity: 0.7
            color: "#1b1c1e"
            Text {
                id: delegateTitle
                color: "white"
                font.pixelSize: 20
                font.bold: true
                text: model.plank
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.margins: 3
            }
            Text {
                id: date
                color: "white"
                font.pixelSize: 15
                text: Qt.formatDateTime(model.start, "dd.MM hh:mm") + " - " + Qt.formatDateTime(model.end, "dd.MM hh:mm")
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.margins: 3
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                }
            }
        }
    }
}

/* Corrections:
  - art des defekts
  - groesse
  - position

  Auswahl
  - Datum
  - Zeit
  - nach ID suchen
  - sortieren
*/
