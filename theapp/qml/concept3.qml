import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

AppWindow {
    id: theRoot
    width: 1300//1200
    height: 700//900
    color: "#1b1c1e"

    FontLoader {
        id: myFont
        source: "fonts/Quicksand_Bold.otf"
    }

    Item {
        id: mainFrame
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
//        TabView {
//            anchors.fill: parent
//            style: tabViewStyle
//            Tab {
//                title: "Buttons"
//            }
//            Tab {
//                title: "Sliders"
//            }
//            Tab {
//                title: "Progress"
//                Rectangle {color: "blue"}
//            }
//        }
    }

    Rectangle {
        id: tools
        color: "#27282a"
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

        Label {
            id: title
            anchors.top: service.bottom
            anchors.left: parent.left
            anchors.margins: 10
            text: "The title"
            font.family: myFont.name
            font.pixelSize: 20
        }
    }
}
