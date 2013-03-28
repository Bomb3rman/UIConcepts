import QtQuick 2.0

Rectangle {
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
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        highlightFollowsCurrentItem: true
        model: pageModel
        orientation: ListView.Horizontal
        snapMode: ListView.SnapToItem
        move: Transition {
            NumberAnimation { properties: "x,y"; duration: 1000 }
        }
        delegate: Rectangle {
            id: delegate
            color: "darkgrey"
            border.color: "blue"
            border.width: 2
            width: theView.width / 2
            height: theView.height
            Text{
                id: basicInfo
                anchors.top: parent.top
                anchors.topMargin: 30
                anchors.horizontalCenter: parent.horizontalCenter
                text: model.BasicInfo
                font.family: myFont.name
                color: "white"
            }
            Text{
                id: extendedInfo
                anchors.top: basicInfo.bottom
                anchors.topMargin: 30
                anchors.horizontalCenter: parent.horizontalCenter
                text: model.ExtendedInfo
                font.family: myFont.name
                color: "white"
            }
            state: "idle"
            states: [
                State {
                    name: "idle"
                    PropertyChanges { target: delegate; }
                },
                State {
                    name: "clicked"
                    PropertyChanges { target: delegate; }
                }
            ]
            Behavior on width {
                NumberAnimation { duration: 700 }
            }

            NumberAnimation{ id: moveAnim; target: theView; property: "contentX";
                to: theView.currentIndex * theView.width/2; duration: 700 }

            onStateChanged: {
                if (state === "clicked") {
                    //theView.currentIndex = index
                    delegate.parent = theRoot
                    width = 200;
                    x = -300
                    y = -1
                    //theView.contentX = theView.currentIndex * theView.width/2
                    //theView.positionViewAtIndex(index, ListView.Contain);
                    //moveAnim.start()
                } else {
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: parent.state = parent.state === "clicked" ? "idle" : "clicked"
            }
        }
    }
}
