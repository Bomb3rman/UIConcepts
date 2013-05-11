import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

AppWindow {
    id: rootApp
    width: 1200
    height: 900
    color: "#1b1c1e"

    FontLoader {
        id: myFont
        source: "fonts/Quicksand_Bold.otf"
    }
    Item {
        id: main
        anchors.left: parent.left
        anchors.right: pageDocumentation.visible ? documentation.left : parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

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
    Documentation {
        id: documentation
        width: rootApp.width - dragTarget.x - 10
        visible: pageDocumentation.visible
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        z: 10
    }
    Rectangle {
        id: dragTarget
        width: 20
        height: 20
        radius: 10
        x: 800
        y: 10
        visible: documentation.visible
        color: "blue"
        MouseArea {
            id: dragArea
            anchors.fill: parent
            drag.axis: Drag.XAxis
            drag.target: dragTarget
        }
        z: 11
    }
}
