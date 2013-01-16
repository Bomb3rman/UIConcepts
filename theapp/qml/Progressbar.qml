import QtQuick 2.0

BorderImage {
    id: root
    source: "ui/progressbar.png"
    width: 100;
    border.left: 5; border.top: 5
    border.right: 5; border.bottom: 5

    property real progress: 30

    BorderImage {
        id: progress
        source: "ui/progressbarfill.png"
        width: parent.width / 100 * handle.x + handle.width/2
        //height: parent.height
        border.left: 5; border.top: 5
        border.bottom: 5
    }
    Image {
        id: handle
        anchors.verticalCenter: parent.verticalCenter
        source: "ui/progressbarhandle.png"
        x: root.progress
        MouseArea {
            anchors.fill: parent
            anchors.margins: -20
            drag.minimumX: -handle.width/2
            drag.maximumX: root.width - handle.width/2
            drag.target: handle
            drag.axis: Drag.XAxis
        }
    }
}
