import QtQuick 2.0
import MMKQmlStyle 1.0

Box {
    id: root
    //height: 150
    //width: 200
    smooth: true
    antialiasing:  true
    property string text;

    Text {
        id: title
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 10
        width: parent.width
        wrapMode: Text.WordWrap
        text: root.text
        font.family: myFont.name
        color: "white"
    }
}
