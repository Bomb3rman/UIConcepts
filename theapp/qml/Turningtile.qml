import QtQuick 2.0

Item {
    id: root
    width: 150 + 50*(rotation/90)
    height: front.height - (front.height - back.height)/90 * root.rotation
    property int rotation: 0

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
//    Behavior on width {
//        NumberAnimation { duration: 500 }
//    }
    state: "minimized"

    states: [
        State {
            name: "minimized"
            PropertyChanges {target: root; rotation: 0 }
        },
        State {
            name: "enlarged"
            PropertyChanges {target: root; rotation: 90 }
        }
    ]
    MouseArea {
        id: marea
        anchors.fill: parent
        onClicked: {
            print(root.parent)
            if (root.parent.selection !== undefined) {
                print ("minimizing");
                root.parent.selection.state = "minimized"
            } else {
                print ("not minimizing");
            }

            root.parent.selection = root;
            root.state = "enlarged"
        }
    }
}
