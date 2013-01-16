import QtQuick 2.0

ListView {
    width: 100
    clip: true

    Rectangle {
        anchors.fill: parent
        radius: 5
        color: "#e3e3e3"
        z:-1

    }

    delegate: Rectangle {
        id: root
        width: 100
        height: 70
        color: "transparent"
        radius: 10
        Text {
            id: text
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 10
            text: model.name
            color: "#676666"
        }
        Rectangle {
            width: parent.width
            height: 1
            color: "#f0f0f0"
        }
        Rectangle {
            width: parent.width
            height: 1
            color: "#d3d3d3"
            y:-1
        }

        MouseArea {
            hoverEnabled: true
            anchors.fill: parent
            onEntered: { root.color = "#7a7a7a"; text.color = "#bfbfbf"; }
            onExited: { root.color = "transparent"; text.color = "#676666" }
        }
    }
}
