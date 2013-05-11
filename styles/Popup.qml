import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

BorderImage {
    id: root
    opacity: 0.95
    source: "ui/box.png"
    width: 500
    height: 300
    anchors.centerIn: rootApp

    border.left: 5; border.top: 5
    border.right: 5; border.bottom: 5

    clip: true

    Button {
        z:10
        width: 50
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: 0
        text: "X"
        style: MMKButton{}
        onClicked: root.destroy()
    }
}
