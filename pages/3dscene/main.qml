import QtQuick 2.0
import MMKQmlStyle 1.0
import Qt3D 2.0
import Qt3D.Shapes 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

MMKPage {
    id: rootPage

    Viewport {
        width: parent.width; height: parent.height
        anchors.fill: parent
        fillColor: "transparent"
        renderMode: "BufferedRender"
        objectName: "cube viewport"

        Cube {
            id: theCube
            scale: 1.5
            objectName: "cube"
            property real rotation: 30;

            transform: Rotation3D {
                angle: theCube.rotation
                axis: Qt.vector3d(1, 1, 1)
            }

            effect: Effect {
                color: "#aaca00"
                texture: "qrc:/3dscene/mmklogo.png"
                decal: true
            }
            NumberAnimation on rotation {
                id: rotaAnim
                from: 0; to: 365; duration: 3000; loops: Animation.Infinite;
                running: true
                onRunningChanged: print ("running changed" + running)
            }
        }

    }

    Text {
        anchors.centerIn: parent
        font.bold: true
        font.pixelSize: 30
        color: "white"
        text: "!!!DUMMY PAGE..With a 3D Scene!!!"
        style: Text.Raised; styleColor: "#AAAAAA"
    }

    Button {
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.margins: 20
        text: "Minimize"
        onClicked: rootPage.state = "minimized"
        style: MMKButton{}
    }

}
