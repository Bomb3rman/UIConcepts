import QtQuick 2.0

Rectangle {
    id: page
    color: "transparent"
    //antialiasing: true
    width: ListView.view.width
    height: ListView.view.height

    Grid {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 20
        columns: 2
        spacing: 20
        scale: page.state == "minimize" ? 0.1 : 1
        transformOrigin: Item.TopLeft

        Label {
            text: "First ..Parameter"
        }
        Textfield {

        }

        Label {
            text: "Second Parameter"
        }
        Textfield {

        }

        Label {
            text: "Third Parameter"
        }
        Textfield {

        }

        Checkbox {}

        Button {}

        Progressbar {}
    }
}
