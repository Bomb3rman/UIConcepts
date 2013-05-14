import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Private 1.0
import QtQuick.Controls.Styles 1.0

ScrollViewStyle {
    id: root

    property color textColor: __syspal.text
    property color highlightedTextColor: "blue"

    property SystemPalette __syspal: SystemPalette {
        colorGroup: control.enabled ? SystemPalette.Active : SystemPalette.Disabled
    }

//    property Component frame//: Rectangle {
//        //color: "transparent"
//        //border.color: "#999"
//        //border.width: 1
//        //radius: 5
//        //visible: control.frameVisible
//    //}
//    property Component scrollBar;//: Rectangle{color: "transparent"}

    property Component headerDelegate: Rectangle {
        color: "transparent"
        gradient: Gradient {
            GradientStop {position: 0 ; color: "#555"}
            GradientStop {position: 1 ; color: "#777"}
        }

        implicitHeight: 30
        implicitWidth: 80
        Text {
            anchors.fill: parent
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            anchors.leftMargin: 4
            text: itemValue
            color: textColor
            font.pixelSize: 15
            font.bold: true
            renderType: Text.NativeRendering
        }
        Rectangle {
            anchors.bottom: parent.bottom
            width: parent.width
            height: 1
            color: "#666"
        }
        Rectangle {
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 2
            width: 1
            color: "#111"
        }
    }

    property Component rowDelegate: Rectangle {
        color: "transparent"
        implicitHeight: 30
        implicitWidth: 80
        property color selectedColor: hasActiveFocus ? "transparent" : "transparent"
        gradient: Gradient {
            GradientStop { color: rowSelected ? Qt.lighter(selectedColor, 1.1)
                                              : alternateBackground ? "#666" : "darkgray" ; position: 1 }
            GradientStop { color: rowSelected ? Qt.lighter(selectedColor, 1.2)
                                              : alternateBackground ? "#666" : "darkgray" ; position: 0 }
        }
        Rectangle {
            anchors.bottom: parent.bottom
            width: parent.width
            height: 1
            color: rowSelected ? Qt.darker(selectedColor, 1.1) : "transparent"
        }
        Rectangle {
            anchors.top: parent.top
            width: parent.width
            height: 1
            color: rowSelected ? Qt.darker(selectedColor, 1.1) : Qt.darker(parent.color, 1.15)
        }
    }

    property Component standardDelegate: Item {
        height: Math.max(16, label.implicitHeight)
        property int implicitWidth: sizehint.paintedWidth + 4

        Text {
            id: label
            objectName: "label"
            width: parent.width
            anchors.margins: 3
            font.pixelSize: 15
            font.bold: true
            anchors.left: parent.left
            anchors.right: parent.right
            horizontalAlignment: itemTextAlignment
            anchors.verticalCenter: parent.verticalCenter
            elide: itemElideMode
            text: itemValue != undefined ? itemValue : ""
            color: itemTextColor
            renderType: Text.NativeRendering
        }
        Text {
            id: sizehint
            font: label.font
            text: itemValue ? itemValue : ""
            visible: false
        }
    }
}
