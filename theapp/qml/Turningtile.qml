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
        text: model.BasicInfo
    }
    Tile {
        id: back
        anchors.top: front.bottom
        width: parent.width
        height: 200
        transform: Rotation { origin.x: 130; origin.y: 0;
            axis { x: 1; y: 0; z: 0 } angle: rotation - 90
        }
        text: model.ExtendedInfo
        Rectangle {
            width: 50
            height: 50
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.margins: 5
            radius: 5
            border.color: "black"
            border.width: 2
            color: "lightgrey"
            MouseArea {
                z: 1
                anchors.fill: parent
                preventStealing: true
                onClicked: {
                    print("making it visible")
                    model.Page.visible = true
                    model.Page.anchors.fill = theRoot
                }
            }
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
        enabled: parent.state !== "enlarged"
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
