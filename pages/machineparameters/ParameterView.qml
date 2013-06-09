import QtQuick 2.0

Column {
    id: view
    Repeater {
        model: parameterModel
        delegate: Item {
            height: name.height + 10
            width: view.width
            Text {
                id: name
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                text: model.name
                font.bold: true
                color: "white"
            }

        }
    }
}
