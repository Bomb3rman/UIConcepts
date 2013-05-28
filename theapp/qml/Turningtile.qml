import QtQuick 2.0
import MMKQmlStyle 1.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

Item {
    id: root
    width: 180 + 50*(rotation/90)
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
        text: model.PageObject.extendedInfo
        Button {
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.margins: 5
            text: "View"

            style: buttonStyle

            onClicked: {
                model.Page.state = "maximized"
                model.Page.parent = mainFrame
                model.Page.anchors.centerIn = mainFrame
                model.Page.width = mainFrame.width
                model.Page.height = mainFrame.height
                model.Page.visible = true;
                pageDocumentation.text = model.Documentation
                activePage = Page;
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
            if (root.parent.selection !== undefined) {
                root.parent.selection.state = "minimized"
            }
            root.parent.selection = root;
            root.state = "enlarged"
        }
    }
}
