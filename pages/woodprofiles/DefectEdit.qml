import QtQuick 2.1
import MMKQmlStyle 1.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Layouts 1.0

Item {
    id: editW
    height: 220
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.margins: 2
    Rectangle {
        anchors.fill: parent
        color: "#27282a"
        opacity: 0.7
    }

    visible: false
    y: rootPage.defect !== -1 ? parent.height - 220 : rootPage.height
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
        rows: 5
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
        MMKLabel {
            text: "Per:"
        }
        TextField {
            id: defectName
            text: rootPage.marked >= 0 && rootPage.defect >= 0 ?
                      woodModel.getDefect(rootPage.marked, rootPage.defect).name : "Name"
            style: MMKTextField{}
        }
        TextField {
            id: defectType
            text: rootPage.marked >= 0 && rootPage.defect >= 0 ?
                      woodModel.getDefect(rootPage.marked, rootPage.defect).type : "T"
            style: MMKTextField{}
        }
        TextField {
            id: defectThreshold
            text: rootPage.marked >= 0 && rootPage.defect >= 0 ?
                      woodModel.getDefect(rootPage.marked, rootPage.defect).threshold : "Th"
            style: MMKTextField{}
        }
        TextField {
            id: defectDescription
            text: rootPage.marked >= 0 && rootPage.defect >= 0 ?
                      woodModel.getDefect(rootPage.marked, rootPage.defect).description : ""
            style: MMKTextField{}
        }
        TextField {
            id: defectPer
            text: rootPage.marked >= 0 && rootPage.defect >= 0 ?
                      woodModel.getDefect(rootPage.marked, rootPage.defect).description : ""
            style: MMKTextField{}
        }

    }
    Column {
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 20
        spacing: 20
        Button {
            id: saveButton
            visible: datahandling.safeMode ? false : true

            text: "save"
            style: MMKButton{}
            onClicked: {
                woodModel.saveDefect(rootPage.marked, rootPage.defect, defectName.text, defectType.text,
                                      defectThreshold.text, defectDescription.text, defectPer.text);
                //rootPage.marked = -1
                rootPage.defect = -1
            }
        }
        Button {
            id: deleteButton
            visible: datahandling.safeMode ? false : true

            text: "delete"
            style: MMKButton{}
            onClicked: {
                woodModel.deleteDefect(rootPage.marked, rootPage.defect);
                rootPage.marked = -1
                rootPage.defect = -1
            }
        }
        Button {
            id: dismissButton
            text: "dismiss"
            style: MMKButton{}
            onClicked: {
                rootPage.marked = -1
                rootPage.defect = -1
            }
        }
    }
}
