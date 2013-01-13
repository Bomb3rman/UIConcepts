import QtQuick 2.0

BorderImage {
    id: root
    source: "ui/infobox.png"
    width: 200; height: label.height + 50
    border.left: 5; border.top: 5
    border.right: 32; border.bottom: 10

    Label {
        id: label
        anchors.left: root.left
        anchors.right: root.right
        anchors.top: root.top
        anchors.margins: 10
        text: "Das ist eine sehr sinnvolle Nachricht!!!! asdasda sd as d sad as d as d as d as da sd a sd as d as d as d sa da sd as d as d as d as d as da s"
    }
}
