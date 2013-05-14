import QtQuick 2.1
import MMKQmlStyle 1.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

MMKPopup {
    id: root
    height: 170
    width: 250
    Column {
        anchors.centerIn: parent
        Text {
            text: "Name"
            color: "white"
            font.bold: true
        }
        TextField {
            id: nameInput
            style: MMKTextField{}
        }
        Button {
            style: MMKButton{}
            text: "Save"
            onClicked: {
                woodModel.addProfile(nameInput.text);
                root.destroy()
            }
        }
        Button {
            style: MMKButton{}
            text: "Discard"
            onClicked: {
                root.destroy()
            }
        }
    }
}
