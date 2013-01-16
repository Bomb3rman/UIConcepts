import QtQuick 2.0

Item {
    id: root
    width: Math.max(button.width, buttontext.width)
    height: button.height+buttontext.height
    anchors.bottom: parent.bottom
    signal clicked()
    property alias text: buttontext.text

    Rectangle {
        id: button
        width: 50
        height: width
        anchors.horizontalCenter: parent.horizontalCenter
        radius: 8
        antialiasing: true
        gradient: Gradient {
            GradientStop { position: 0.0; color: "lightgrey" }
            GradientStop { position: 1.0; color: "grey" }
        }
        state: root.state
        states: [
            State { name: "hovered";
                PropertyChanges { target: button; width: 80 }
                PropertyChanges { target: buttontext; font.pixelSize: 15 }
            },
            State { name: "normal";
                PropertyChanges { target: button; width: 50 }
                PropertyChanges { target: buttontext; font.pixelSize: 10 }
            }
        ]
        transitions: Transition {
                 PropertyAnimation { properties: "width"; easing.type: Easing.Linear }
                 PropertyAnimation { target: buttontext; properties: "font.pixelSize"; easing.type: Easing.Linear }
        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            //onEntered: root.state = "hovered"
            //onExited: root.state = "normal"
            onClicked: root.clicked()
        }
    }
    Text {
        id: buttontext
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Toolbutton"
        font.pixelSize: 10
        font.family: myFont.name
    }
}
