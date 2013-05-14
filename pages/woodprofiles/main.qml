import QtQuick 2.1
import MMKQmlStyle 1.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Layouts 1.0

MMKPage {
    id: rootPage
    property int marked: -1
    property int defect: -1
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
            delegate: Tile {}
        }
        Box {
            width: mArea1.pressed ? 120 : 100
            height: mArea1.pressed ? 70 : 60
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

    DefectEdit {
        id: editW
    }
}
