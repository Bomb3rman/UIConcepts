import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

BorderImage {
    id: root
    width: 50
    height: 50
    opacity: 0
    source: "ui/box.png"
    border.left: 5; border.top: 5
    border.right: 5; border.bottom: 5
    visible: opacity != 0
    clip: true

    state: "minimized"

    states: [
        State {
            name: "minimized"
            PropertyChanges { target: root; opacity: 0;
                height:50; width: 50;}
        },
        State {
            name: "maximized"
            PropertyChanges { target: root; opacity: 1; }
        }
    ]

    Behavior on opacity {
        NumberAnimation{duration: 500}
    }
    Behavior on width {
        NumberAnimation{duration: 500}
    }
    Behavior on height {
        NumberAnimation{duration: 500}
    }

    Button {
        id: minimizeButton
        z:10
        width: 120
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: 10
        text: "Minimize"
        onClicked: rootPage.state = "minimized"
        style: MMKButton{}
    }

    Button {
        z:10
        width: 120
        anchors.right: parent.right
        anchors.top: minimizeButton.bottom
        anchors.margins: 10
        text: "Doku"
        onClicked: pageDocumentation.visible = !pageDocumentation.visible
        style: MMKButton{}
    }
}
