import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

AppWindow {
    id: theRoot
    width: 1200
    height: 700
    color: "#1b1c1e"

    FontLoader {
        id: myFont
        source: "fonts/Quicksand_Bold.otf"
    }

    ListView {
        id: theView
        anchors.bottom: bottomBar.top
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        model: pageModel
        orientation: ListView.Horizontal
        snapMode: ListView.SnapToItem
        delegate: Rectangle {
            id: delegate
            border.color: "blue"
            border.width: 2
            width: theView.width
            height: theView.height
            Component.onCompleted: {
                model.Page.state = "maximized"
                model.Page.parent = delegate
                model.Page.anchors.centerIn = parent
                model.Page.width = theView.width
                model.Page.height = theView.height
            }
        }
    }
    Rectangle {
        id: bottomBar
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: 200
        color: "#27282a"
        //color: "blue"
        //opacity: 0.5

        Column {
            id: column1
            anchors.top: parent.top
            anchors.left: parent.left
            width: 300
            height: 200
            anchors.margins: 10
            spacing: 10
            Item {
                height: 30
                width: 100
                Label{anchors.verticalCenter: parent.verticalCenter; id: l1; text: "The text"}
                TextField {anchors.left: l1.right; anchors.margins: 5; style: textFieldStyle}
            }
            Label { text: "test" }
            CheckBox {text: "Option 1"; style: radioBStyle}
            CheckBox {text: "Option 2"; style: radioBStyle}
        }
        Column {
            anchors.top: parent.top
            anchors.left: column1.right
            anchors.margins: 10
            spacing: 10
            Button{ text:"Button"; style: buttonStyle}
        }
    }
}
