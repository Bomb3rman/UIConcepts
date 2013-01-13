import QtQuick 2.0

Row {
    property alias rep: repeater
    spacing: 5
    Repeater {
        id: repeater
        height: 100
        //spacing: 5

        model: theModel
        delegate: Toolbutton{ text: model.name}
    }
}
