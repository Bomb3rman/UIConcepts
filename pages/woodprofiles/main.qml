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
                property var defects: model.defects
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
            id: nameLable
            anchors.top: editTitle.bottom
            anchors.left: parent.left
            anchors.topMargin: 20
            anchors.leftMargin: 10
            color: "white"
            text: "Name:"
            font.pixelSize: 15
            font.bold: true
        }
        TextField {
            id: profileName
            anchors.top: nameLable.top
            anchors.left: nameLable.right
            anchors.leftMargin: 50
            anchors.topMargin: -5
            text: rootPage.marked >= 0 ? woodProfiles.itemAt(rootPage.marked).name : ""
            style: MMKTextField{}
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

        ListView {
            anchors.top: nameLable.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: saveButton.top
            anchors.leftMargin: 10
            anchors.topMargin: 40
            anchors.bottomMargin: 20
            clip: true
            model: rootPage.marked >= 0 ? woodProfiles.itemAt(rootPage.marked).defects : 0
            header:         Item {
                id: defectsHeader
                height: 20
                Text {
                    id: headerName
                    width: 120
                    text: "Defect"
                    font.pixelSize: 15
                    font.bold: true
                    color: "white"
                }
                Text {
                    id: headerThreshold
                    width: 70
                    anchors.left: headerName.right
                    anchors.leftMargin: 7
                    text: "Threshold"
                    font.pixelSize: 15
                    font.bold: true
                    color: "white"
                }
                Text {
                    id: headerPer
                    width: 60
                    anchors.left: headerThreshold.right
                    anchors.leftMargin: 7
                    text: "Per"
                    font.pixelSize: 15
                    font.bold: true
                    color: "white"
                }
                Text {
                    id: headerType
                    width: 50
                    anchors.left: headerPer.right
                    anchors.leftMargin: 7
                    text: "Type"
                    font.pixelSize: 15
                    font.bold: true
                    color: "white"
                }
                Text {
                    id: headerDescription
                    width: 180
                    anchors.left: headerType.right
                    anchors.leftMargin: 7
                    text: "Description"
                    font.pixelSize: 15
                    font.bold: true
                    color: "white"
                }
            }
            delegate: Item {
                height: defectName.height
                TextField {
                    width: 120
                    id: defectName
                    text: model.modelData.name
                    style: MMKTextField{}
                }
                TextField {
                    id: defectThreshold
                    width: 70
                    anchors.left: defectName.right
                    anchors.leftMargin: 7
                    text: model.modelData.threshold
                    style: MMKTextField{}
                }
                TextField {
                    id: defectPer
                    width: 60
                    anchors.left: defectThreshold.right
                    anchors.leftMargin: 7
                    text: model.modelData.per
                    style: MMKTextField{}
                }
                TextField {
                    id: defectType
                    width: 50
                    anchors.left: defectPer.right
                    anchors.leftMargin: 7
                    text: model.modelData.type
                    style: MMKTextField{}
                }
                TextField {
                    id: defectDescription
                    width: 180
                    anchors.left: defectType.right
                    anchors.leftMargin: 7
                    text: model.modelData.description
                    style: MMKTextField{}
                }
            }
            onModelChanged: print ("model changed" + model)
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
