import QtQuick 2.0

Rectangle {
    width: 50
    height: 50
    color: "red"

    Text {
        anchors.centerIn: parent
        font.bold: true
        font.pixelSize: 30
        color: "white"
        text: "!!!DUMMY PAGE..Bitch!!!"
    }
    Behavior on width {
        NumberAnimation{duration: 500}
    }
    Behavior on height {
        NumberAnimation{duration: 500}
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            parent.width = 50
            parent.height = 50
            parent.visible = false
        }
    }
}
