import QtQuick 2.0

BorderImage {
    id: root
    width: 50
    height: 50
    opacity: 0
    source: "ui/box.png"
    border.left: 5; border.top: 5
    border.right: 5; border.bottom: 5
    visible: opacity != 0

    state: "minimized"

    states: [
        State {
            name: "minimized"
            PropertyChanges { target: root; opacity: 0;
                height:50; width: 50;}
        },
        State {
            name: "maximized"
            PropertyChanges { target: root; opacity: 1; }
        }
    ]

    Behavior on opacity {
        NumberAnimation{duration: 500}
    }
    Behavior on width {
        NumberAnimation{duration: 500}
    }
    Behavior on height {
        NumberAnimation{duration: 500}
    }
}
