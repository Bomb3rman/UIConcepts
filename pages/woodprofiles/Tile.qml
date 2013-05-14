import QtQuick 2.1
import MMKQmlStyle 1.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Layouts 1.0

Box {
    width: clicked ? 450 : 100
    height: clicked ? 300 : 60
    Behavior on height {
        NumberAnimation {duration: 150; easing.type: Easing.InOutSine}
    }
    Behavior on width {
        NumberAnimation {duration: 150; easing.type: Easing.InOutSine}
    }
    property string name: model.name
    property var defects: model.defects
    property bool clicked: index === rootPage.marked;
    MouseArea {
        id: mArea2
        anchors.fill: parent
        onClicked: {
            rootPage.marked = index
        }
    }

    Text {
        id: nameLabel
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.leftMargin: 7
        color: "white"
        text: parent.name
    }

    TableView {
        visible: parent.clicked
        Behavior on opacity {
            NumberAnimation {duration: 150; easing.type: Easing.InOutSine}
        }
        frameVisible: false
        opacity: visible
        anchors.top: nameLabel.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: activeLabel.top
        anchors.leftMargin: 10
        anchors.topMargin: 10
        anchors.bottomMargin: 10
        clip: true
        model: rootPage.marked >= 0 ? woodProfiles.itemAt(rootPage.marked).defects : 0

        alternatingRowColors: false
        TableViewColumn{ role: "name"  ; title: "Name" ; width: 100 }
        TableViewColumn{ role: "threshold" ; title: "Threshold" ; width: 70 }
        TableViewColumn{ role: "per" ; title: "Per" ; width: 60 }
        TableViewColumn{ role: "type" ; title: "Type" ; width: 40 }
        TableViewColumn{ role: "description" ; title: "Description" ; }

        style: MMKTableView{}

        onCurrentRowChanged: { editW.visible = true; rootPage.defect = currentRow }
    }

    Button {
        visible: datahandling.safeMode || index === woodModel.activeProfile || !parent.clicked ?
                     false : rootPage.marked !== -2
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.margins: 10
        text: "Activate"
        style: MMKButton{}
        onClicked: {
            woodModel.activeProfile = rootPage.marked;
            rootPage.marked = -1
            rootPage.defect = -1
        }
    }
    Button {
        visible: datahandling.safeMode || !parent.clicked ?
                     false : rootPage.marked !== -2
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.margins: 10
        text: "Add defect"
        style: MMKButton{}
        onClicked: {
            editW.visible = true;
            rootPage.defect = -2
        }
    }
    Text {
        id: activeLabel
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.margins: 10
        font.bold: true
        font.pixelSize: 15
        color: "red"
        text: "Active"
        visible: index === woodModel.activeProfile
    }
}
