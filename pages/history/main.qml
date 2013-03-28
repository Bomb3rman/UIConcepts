import QtQuick 2.0
import MMKQmlStyle 1.0

MMKPage {
    id: rootPage
    Text {
        anchors.centerIn: parent
        font.bold: true
        font.pixelSize: 30
        color: "white"
        text: "!!!DUMMY PAGE..Bitch!!!"
    }

    Button {
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.margins: 20
        text: "Minimize"
        onClicked: rootPage.state = "minimized"
        style: MMKButton{}
    }
}
