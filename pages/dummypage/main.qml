import QtQuick 2.0
import MMKQmlComponents 1.0

Page {
    id: root
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
        onClicked: root.state = "minimized"
    }
}
