import QtQuick 2.0

Rectangle {
    id: root
    width: 100
    height: 62
    property var model;
    property int spacing: 10;
    property var separators;
    property int columns: 4;
    property int rows: 4;

    Component {
        id: separator
        Rectangle {height: 20}
    }

    function arrangeItems() {
        for (var i=0; i<repeater.count; i++) {
            if (i > 0) {
                repeater.itemAt(i).anchors.left = repeater.itemAt(i-1).right
                repeater.itemAt(i).anchors.leftMargin = spacing
                if (i%columns == 0) {
                    separators[1].y = Math.max(repeater.itemAt(i).height,repeater.itemAt(i-1).height, repeater.itemAt(i-2).height)
                }
            }
        }
    }

    function insertSeparators() {
        separators = new Array();
        for (var i=0; i<columns-1; i++) {
            separators[i] = separator.createObject(root, {"anchors.left" : root.left, "anchors.right" : root.right});
        }

        for (i=0; i<rows-1; i++) {
            separators[i] = separator.createObject(root, {"anchors.top" : root.top, "anchors.bottom" : root.bottom});
        }
    }

    Repeater {
        id: repeater
        model: root.model
        onCountChanged: root.arrangeItems()
        delegate: Turningtile{}
    }
    Component.onCompleted: insertSeparators()
}
