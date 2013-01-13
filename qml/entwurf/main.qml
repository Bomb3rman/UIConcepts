import QtQuick 2.0

Rectangle {
    width: 8000
    height: 500
    FontLoader {
        id: myFont
        source: "fonts/Quicksand_Bold.otf"
    }

    Header {
        id: header
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
    }

    ListModel {
        id: theModel
        ListElement {name: "Page1"}
        ListElement {name: "Page2"}
        ListElement {name: "Page3"}
        ListElement {name: "Page4"}
    }


    ListView {
        id: listView
        antialiasing: true

        anchors.top: header.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        orientation: ListView.Horizontal
        snapMode: ListView.SnapToItem
        highlightRangeMode: ListView.StrictlyEnforceRange

        model:theModel
        delegate: Page {}
        onCurrentIndexChanged: {
            tBar.rep.itemAt(currentIndex).state = "hovered"
            if (currentIndex != 0)
                tBar.rep.itemAt(currentIndex-1).state = "normal"
            if (currentIndex != count-1)
                tBar.rep.itemAt(currentIndex+1).state = "normal"
        }
    }

    Toolbar{
        id: tBar
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
