import QtQuick 2.0
import MMKQmlStyle 1.0
import Qt3D 2.0
import Qt3D.Shapes 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

MMKPage {
    id: rootPage

    property Component buttonStyle: MMKButton{}
    property Component radioBStyle: MMKCheckBox{}
    property Component sliderStyle: MMKSlider{}
    property Component textFieldStyle: MMKTextField{}
    property Component tabViewStyle: MMKTabView{}
    property Component comboBoxStyle: MMKComboBox{}
    property Component progressStyle: MMKProgressBar{}
    property Component radioStyle: MMKRadioButton{}

    Viewport {
        width: parent.width; height: parent.height
        anchors.fill: parent
        fillColor: "transparent"
        renderMode: "BufferedRender"
        objectName: "cube viewport"
        navigation: false
        Item3D {
            scale: 0.06
            id: theMesh
            mesh: Mesh {
                source: "qrc:/machineparameters/models/machine.dae"
            }
            transform: Rotation3D {
                angle: 45
                axis: Qt.vector3d(0, 1, 0)
            }
            y: -1
        }

        light: Light {
            //type: Positional
            position: Qt.vector3d(1,1,1)
            ambientColor: "white"
            diffuseColor: "white"
        }
    }

    Text {
        id: title
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 10

        font.bold: true
        font.pixelSize: 30
        color: "white"
        text: "Machine-parameters:"
        style: Text.Raised; styleColor: "#AAAAAA"
    }
    Column {
        id: column
        anchors.top: title.bottom
        anchors.left: parent.left
        anchors.margins: 20
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
        Button{ text: "Dummybutton"; style: buttonStyle; width: 170}
        Slider{ z: 1; style: sliderStyle}
        TextField{ style: textFieldStyle }
//        ComboBox {
//            style: comboBoxStyle
//            model: ListModel {
//                id: menuItems
//                ListElement { text: "Banana"; color: "Yellow" }
//                ListElement { text: "Apple"; color: "Green" }
//                ListElement { text: "Coconut"; color: "Brown" }
//            }
//            width: 200
//        }
        ProgressBar { style: progressStyle; value: parent.progress}
        ProgressBar { style: progressStyle; value: 1-parent.progress}
        ProgressBar { style: progressStyle; value: 1}
        GroupBox {
            id: gbox
            //style: gboxStyle
            title: qsTr("Package selection")
            Column {
                RadioButton { style: radioStyle; exclusiveGroup: group; text: "text1"}
                RadioButton { style: radioStyle; exclusiveGroup: group; text: "text2"}
                RadioButton { style: radioStyle; exclusiveGroup: group; text: "text3"}
                ExclusiveGroup { id: group }
            }
        }
    }
}
