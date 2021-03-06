import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0


Rectangle {
    width: 800
    height: 500
    color: "#f5f5f5"

    property bool alert: false
    FontLoader {
        id: myFont
        source: "fonts/Quicksand_Bold.otf"
    }

    Header {
        id: header
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.leftMargin: 50
        anchors.right: parent.right
        anchors.rightMargin: 30
        anchors.topMargin: 20
    }

    ListModel {
        id: theModel
        ListElement {name: "Page1"}
        ListElement {name: "Page2"}
        ListElement {name: "Page3"}
        ListElement {name: "Page4"}
    }

    Toolbar {
        id: tBar
        model: pageModel
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 20
    }

    Rectangle {
        id: theContent
        anchors.bottom: tBar.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: header.bottom
        anchors.margins: 20
    }

    Keys.onSpacePressed:  {
        alert = !alert
    }
    focus: true

    Infobox {
        visible: alert
        anchors.bottom: tBar.top
        anchors.right: tBar.right
        anchors.rightMargin: 30
    }
}
