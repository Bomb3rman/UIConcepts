import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

AppWindow {
    id: theRoot
    width: 1200
    height: 900
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
    }

    Rectangle {
        id: tools
        color: "#27282a"
        width: 250
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        TabView {
            anchors.topMargin: 50
            anchors.fill: parent
            style: tabViewStyle
            Tab {
                title: "Info"
            }
            Tab {
                title: "Notifications"
                Item {
                    width: parent.width
                    height: parent.height

                    MessageCenter {
                        anchors.fill: parent
                        Component.onCompleted: print(width + " " + height)
                    }
                }
            }
        }

//        Rectangle {
//            id: service
//            anchors.left: parent.left
//            anchors.right: parent.right
//            anchors.top: parent.top
//            anchors.margins: 10
//            height: 200
//            border.color: "black"
//            border.width: 2
//            Image {
//                source: "pics/service.png"
//                anchors.fill: parent
//                anchors.margins: 2
//            }
//        }

        Label {
            id: title
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.margins: 20
            text: "Servicebar"
            font.family: myFont.name
            font.pixelSize: 20
        }
    }
}
