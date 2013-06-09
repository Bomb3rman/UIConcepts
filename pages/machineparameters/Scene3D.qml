import QtQuick 2.0
import Qt3D 2.0
import Qt3D.Shapes 2.0

Viewport {
    fillColor: "transparent"
    renderMode: "BufferedRender"
    objectName: "viewport"
    antialiasing: true
    navigation: false
    visible: !rootPage.pageAnimation.running
    Item3D {
        scale: 0.06
        id: theMesh
        mesh: Mesh {
            source: "qrc:/machineparameters/models/gld600.3DS"
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
