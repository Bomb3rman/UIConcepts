import QtQuick 2.0

Item {
    id: root
    width: 100
    height: 32
    property bool checked: false
    property string label: "Checkbox"
    Image {
        id: img
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 5
        source: checked ? "ui/checkfull.png" : "ui/checkempty.png"
    }
    MouseArea {
        anchors.fill: parent
        onClicked: checked = !checked
    }
    Text {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: img.right
        anchors.leftMargin: 10
        text: root.label
        color: "#676666"
        font.family: myFont.name
    }
}
