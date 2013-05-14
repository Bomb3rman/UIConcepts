import QtQuick 2.1
import MMKQmlStyle 1.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Layouts 1.0

Item {
    id: editW
    height: parent.height/4
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.margins: 2
    Rectangle {
        anchors.fill: parent
        color: "#27282a"
        opacity: 0.7
    }

    visible: false
    y: rootPage.defect !== -1 ? rootPage.height/4 * 3 : rootPage.height
    Behavior on y {
        NumberAnimation {duration: 500; easing.type: Easing.InOutSine}
    }

    Rectangle {
        height: 1
        color: "#17181a"
        anchors.left: parent.left
        anchors.right: parent.right
    }
    Rectangle {
        height: 1
        color: "#202024"
        y: 1
        anchors.left: parent.left
        anchors.right: parent.right
    }
    GridLayout {
        rows: 4
        flow: GridLayout.TopToBottom
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: saveButton.top
        anchors.margins: 10
        MMKLabel {
            text: "Name:"
        }
        MMKLabel {
            text: "Type:"
        }
        MMKLabel {
            text: "Threshold:"
        }
        MMKLabel {
            text: "Description:"
        }
        TextField {
            id: defectName
            text: rootPage.marked >= 0 ? woodModel.getDefect(rootPage.marked, rootPage.defect).name : ""
            style: MMKTextField{}
        }
        TextField {
            id: defectType
            text: rootPage.marked >= 0 ? woodModel.getDefect(rootPage.marked, rootPage.defect).type : ""
            style: MMKTextField{}
        }
        TextField {
            id: defectThreshold
            text: rootPage.marked >= 0 ? woodModel.getDefect(rootPage.marked, rootPage.defect).threshold : ""
            style: MMKTextField{}
        }
        TextField {
            id: defectDescription
            text: rootPage.marked >= 0 ? woodModel.getDefect(rootPage.marked, rootPage.defect).description : ""
            style: MMKTextField{}
        }

    }
    Button {
        id: saveButton
        visible: datahandling.safeMode ? false : true
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 30
        text: "save"
        style: MMKButton{}
        onClicked: {
            woodModel.saveDefect(rootPage.marked, rootPage.defect, defectName.text, defectType.text,
                                  defectThreshold.text, defectDescription.text);
            rootPage.marked = -1
        }
    }
    Button {
        id: dismissButton
        anchors.right: datahandling.safeMode ? parent.right :saveButton.left
        anchors.bottom: parent.bottom
        anchors.margins: 30
        text: "dismiss"
        style: MMKButton{}
        onClicked: rootPage.marked = -1
    }
}
