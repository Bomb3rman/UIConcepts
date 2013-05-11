import QtQuick 2.0
import MMKQmlStyle 1.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

MMKPopup {
    id: root
    Column {
        anchors.centerIn: parent
        Text {
            text: "Send message to:"
            color: "white"
            font.bold: true
        }
        TextField {
            style: MMKTextField{}
        }
        Text {
            text: "Message"
            color: "white"
            font.bold: true
        }
        TextField {
            id: text2Send
            width: 400
            style: MMKTextField{}
        }
        Button {
            style: MMKButton{}
            text: "Send"
            onClicked: {
                messageCenter.sendMessage(text2Send.text);
                root.destroy()
            }
        }
    }
}
