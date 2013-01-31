import QtQuick 2.0
import MMKQmlComponents 1.0
import Qt3D 2.0
import Qt3D.Shapes 2.0

Page {
    id: root

    Viewport {
        //width: parent.width; height: parent.height
        anchors.fill: parent
        fillColor: "transparent"
        //renderMode: "DirectRender"
        objectName: "cube viewport"

        Cube {
            scale: 1.5
            objectName: "cube"

            transform: Rotation3D {
                angle: 45
                axis: Qt.vector3d(1, 1, 1)
            }

            effect: Effect {
                color: "#aaca00"
                texture: "qrc:/3dscene/mmklogo.png"
                decal: true
            }
        }
    }

    Text {
        anchors.centerIn: parent
        font.bold: true
        font.pixelSize: 30
        color: "white"
        text: "!!!DUMMY PAGE..With a 3D scene!!!"
        style: Text.Raised; styleColor: "#AAAAAA"
    }

    Button {
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.margins: 20
        text: "Minimize"
        onClicked: root.state = "minimized"
    }

}
