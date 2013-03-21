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

        //        Grid {
        //            columns: 4
        //            anchors.centerIn: parent
        //            spacing: 10
        //            layoutDirection: Qt.RightToLeft
        //            horizontalItemAlignment: Grid.AlignHCenter
        //            verticalItemAlignment: Grid.AlignVCenter
        //            property var selection;
        //            Repeater {
        //                model: pageModel
        //                delegate: Turningtile {
        //                }
        //            }
        //        }
        TabView {
            anchors.fill: parent
            style: tabViewStyle
            Tab {
                title: "Buttons"
            }
            Tab {
                title: "Sliders"
            }
            Tab {
                title: "Progress"
                Rectangle {color: "blue"}
            }
        }
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
        Flickable {
            clip: true
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: title.bottom
            anchors.bottom: parent.bottom
            contentHeight: column.height
            contentWidth: column.width
            flickableDirection: Flickable.VerticalFlick
            Column {
                id: column
                property real progress: 0
                SequentialAnimation on progress {
                    loops: Animation.Infinite
                    running: true
                    NumberAnimation {
                        from: 0
                        to: 1
                        duration: 3000
                    }
                    NumberAnimation {
                        from: 1
                        to: 0
                        duration: 3000
                    }
                }
                anchors.top: title.bottom
                anchors.left: parent.left
                anchors.margins: 10
                spacing: 10
                Item {
                    height: 30
                    width: 100
                    Label{anchors.verticalCenter: parent.verticalCenter; id: l1; text: "The text";}
                    //Textfield {anchors.left: l1.right; anchors.margins: 5}
                }
                Label { text: "test";}
                RadioButton {text: "Option 1"; style: radioBStyle;}
                RadioButton {text: "Option 2"; style: radioBStyle;}
                RadioButton {text: "Option 3"; style: radioBStyle;}
                RadioButton {text: "Option 4"; style: radioBStyle;}
                RadioButton {text: "Option 5"; style: radioBStyle;}
                Button{ text: "Dummybutton"; style: buttonStyle }
                Slider{ style: sliderStyle}
                TextField{ style: textFieldStyle }
                ComboBox {
                    style: comboBoxStyle
                    model: ListModel {
                        id: menuItems
                        ListElement { text: "Banana"; color: "Yellow" }
                        ListElement { text: "Apple"; color: "Green" }
                        ListElement { text: "Coconut"; color: "Brown" }
                    }
                    width: 200
                }
                ProgressBar { style: progressStyle; value: parent.progress}
                ProgressBar { style: progressStyle; value: 1-parent.progress}
                ProgressBar { style: progressStyle; value: 1}
                GroupBox {
                    title: qsTr("Package selection")
                    Column {
                        ExclusiveGroup { id: group }
                        RadioButton { style: radioStyle; exclusiveGroup: group; text: "text1"}
                        RadioButton { style: radioStyle; exclusiveGroup: group; text: "text2"}
                        RadioButton { style: radioStyle; exclusiveGroup: group; text: "text3"}
                    }
                }
            }
        }
    }
}
