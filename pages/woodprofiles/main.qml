import QtQuick 2.1
import MMKQmlStyle 1.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Layouts 1.0

MMKPage {
    id: rootPage
    property int marked: -1
    Text {
        id: title
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 10
        font.bold: true
        font.pixelSize: 30
        color: "white"
        text: "Wood profiles"
    }

    Grid {
        id: woodGrid
        anchors.top: title.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        columns: 3
        anchors.margins: 20
        height: parent.height/2
        spacing: 10
        horizontalItemAlignment: Grid.AlignHCenter
        verticalItemAlignment: Grid.AlignVCenter
        Repeater {
            id: woodProfiles
            model: woodModel
            delegate: Box {
                width: mArea2.pressed ? 240 : 220
                height: mArea2.pressed ? 170 : 150
                Behavior on height {
                    NumberAnimation {duration: 200; easing.type: Easing.InOutSine}
                }
                Behavior on width {
                    NumberAnimation {duration: 200; easing.type: Easing.InOutSine}
                }
                property string name: model.name
                MouseArea {
                    id: mArea2
                    anchors.fill: parent
                    onClicked: {
                        editW.visible = true
                        rootPage.marked = index
                    }
                }

                Text {
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.margins: 10
                    font.bold: true
                    font.pixelSize: 15
                    color: "red"
                    text: "Active"
                    visible: index === woodModel.activeProfile
                }

                Text {
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.topMargin: 5
                    anchors.rightMargin: 7
                    color: "white"
                    text: parent.name
                }
            }
        }
        Box {
            width: mArea1.pressed ? 240 : 220
            height: mArea1.pressed ? 170 : 150
            Behavior on height {
                NumberAnimation {duration: 200; easing.type: Easing.InOutSine}
            }
            Behavior on width {
                NumberAnimation {duration: 200; easing.type: Easing.InOutSine}
            }
            Text {
                anchors.centerIn: parent
                text: "Add new"
                color: "white"
            }
            MouseArea {
                id: mArea1
                anchors.fill: parent
                onClicked: {
                    editW.visible = true
                    rootPage.marked = -2;
                }
            }
        }
    }
    onStateChanged: if (state === "minimized") editW.visible = false

    Item {
        id: editW
        height: parent.height/2
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 2
        Rectangle {
            anchors.fill: parent
            color: "#27282a"
            opacity: 0.7
        }

        visible: false
        y: rootPage.marked !== -1 ? rootPage.height/2 : rootPage.height
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

        Text {
            id: editTitle
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.margins: 5
            font.bold: true
            color: "white"
            text: rootPage.marked !== -2 ? "Edit wood profile" : "New wood profile"
        }

        GridLayout {
            anchors.top: editTitle.bottom
            anchors.left: parent.left
            anchors.topMargin: 20
            anchors.leftMargin: 10
            Text {
                color: "white"
                text: "Name:"
                font.pixelSize: 15
                font.bold: true
                Layout.row: 0
                Layout.column: 0
            }
            TextField {
                id: profileName
                text: rootPage.marked >= 0 ? woodProfiles.itemAt(rootPage.marked).name : ""
                style: MMKTextField{}
                Layout.row: 0
                Layout.column: 1
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
                woodModel.saveProfile(rootPage.marked, profileName.text);
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
        Button {
            visible: datahandling.safeMode ? false : rootPage.marked !== -2
            anchors.right: dismissButton.left
            anchors.bottom: parent.bottom
            anchors.margins: 30
            text: "activate"
            style: MMKButton{}
            onClicked: {
                woodModel.activeProfile = rootPage.marked;
                rootPage.marked = -1
            }
        }
    }
}
