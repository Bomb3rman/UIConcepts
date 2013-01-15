import QtQuick 2.0

Item {
    id: root
    width: rotation == 90 ? 150 + 50 : 150
    height: front.height - (front.height - back.height)/90 * root.rotation
    property int rotation: 90

    Tile {
        id: front
        width: parent.width
        height: 100
        y: - front.height/90 * root.rotation
        transform: Rotation { origin.x: 130; origin.y: front.height;
            axis { x: 1; y: 0; z: 0 } angle: rotation
        }
    }
    Tile {
        id: back
        anchors.top: front.bottom
        width: parent.width
        height: 200
        transform: Rotation { origin.x: 130; origin.y: 0;
            axis { x: 1; y: 0; z: 0 } angle: rotation - 90
        }
    }
    Behavior on rotation {
        NumberAnimation { duration: 500 }
    }
    MouseArea {
        id: marea
        anchors.fill: parent
        onClicked: { print("clicked"); root.rotation == 0 ? root.rotation = 90 : root.rotation = 0 }
    }
}
