import QtQuick 2.1

Rectangle {
    id: theRoot
    width: 1200
    height: 700

    FontLoader {
        id: myFont
        source: "fonts/Quicksand_Bold.otf"
    }

    ListModel {
        id: theModel
        ListElement {name: "Page1"; parameters: "param1"; color: "blue"}
        ListElement {name: "Page2"; parameters: "param1"; color: "green"}
        ListElement {name: "Page3"; parameters: "param1"; color: "red"}
        ListElement {name: "Page4"; parameters: "param1"; color: "steelblue"}
        ListElement {name: "Page5"; parameters: "param1"; color: "lightblue"}
        ListElement {name: "Page6"; parameters: "param1"; color: "brown"}
        ListElement {name: "Page7"; parameters: "param1"; color: "pink"}
        ListElement {name: "Page2"; parameters: "param1"; color: "green"}
        ListElement {name: "Page3"; parameters: "param1"; color: "red"}
        ListElement {name: "Page4"; parameters: "param1"; color: "steelblue"}
        ListElement {name: "Page5"; parameters: "param1"; color: "lightblue"}
        ListElement {name: "Page6"; parameters: "param1"; color: "brown"}
        ListElement {name: "Page7"; parameters: "param1"; color: "pink"}
    }

    Rectangle {
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: tools.left
        anchors.margins: 30
        Grid {
            columns: 4
            anchors.centerIn: parent
            spacing: 10
            layoutDirection: Qt.RightToLeft
            horizontalItemAlignment: Grid.AlignHCenter
            verticalItemAlignment: Grid.AlignVCenter
            property var selection;
            Repeater {
                model: pageModel
                delegate: Turningtile {
                }
            }
        }
    }

    Rectangle {
        id: tools
        color: "#f5f5f5"
        width: 300
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        Rectangle {
            id: service
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.margins: 10
            height: 200
            border.color: "black"
            border.width: 2
            Image {
                source: "pics/service.png"
                anchors.fill: parent
                anchors.margins: 2
            }
        }

        Text {
            id: title
            anchors.top: service.bottom
            anchors.left: parent.left
            anchors.margins: 10
            text: "The title"
            font.family: myFont.name
            font.pixelSize: 20
        }

        Column {
            anchors.top: title.bottom
            anchors.left: parent.left
            anchors.margins: 10
            spacing: 10
            Item {
                height: 30
                width: 100
                Label{anchors.verticalCenter: parent.verticalCenter; id: l1; text: "The text"}
                Textfield {anchors.left: l1.right; anchors.margins: 5}
            }
            Label { text: "test" }
            Checkbox {label: "check that"}
            Button{}

        }
    }

    Toolbar3 {
        visible: false
        id: tBar
        model: theModel
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 20
    }
}
