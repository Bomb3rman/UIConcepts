import QtQuick 2.0
import Qt3D 2.0
import Qt3D.Shapes 2.0

Viewport {
    width: 480; height: 640
    fillColor: "darkblue"
    renderMode: "BufferedRender"
    objectName: "cube viewport"
    antialiasing: true

    Cube {
        scale: 1.5
        objectName: "cube"

        transform: Rotation3D {
            angle: 45
            axis: Qt.vector3d(1, 1, 0.5)
        }

        effect: Effect {
            color: "#aaca00"
            decal: true
        }
    }
}
