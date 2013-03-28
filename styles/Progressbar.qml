import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

ProgressBarStyle {
    background:
        BorderImage {
        id: root
        source: "ui/progressbar.png"
        width: 150
        border.left: 2; border.top: 4
        border.right: 2; border.bottom: 4
        antialiasing: true
        BorderImage {
            id: progress
            x:2
            y:2
            source: "ui/progressbarfill2.png"
            width: parent.width * control.value / control.maximumValue -4
            border.left: 5; border.top: 5
            border.right: 5;border.bottom: 5
        }
    }
}
