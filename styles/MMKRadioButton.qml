import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

RadioButtonStyle {
    panel: Item {
        id: rButton
        property string markDirection: "none"
        implicitWidth: 150
        implicitHeight: buttonImg.height

        Connections {
            target: control
            ignoreUnknownSignals: true
            onCheckedChanged: {
                if (control.exclusiveGroup === null || control.exclusiveGroup.current === null) /*||
                        (control.exclusiveGroup.current.__panel === rButton && rButton.state !== "checked"))*/ {
                    if (control.checked)
                        rButton.state = "checked"
                    else
                        rButton.state = "inactive"

                } else if (control.checked === true){
                    if (control.exclusiveGroup.current.__panel.mapFromItem(null,0,0).y > rButton.mapFromItem(null,0,0).y) {
                        control.exclusiveGroup.current.__panel.markDirection = "bottom"
                        rButton.markDirection = "top"
                    } else {
                        control.exclusiveGroup.current.__panel.markDirection = "top"
                        rButton.markDirection = "bottom"
                    }

                    control.exclusiveGroup.current.__panel.state = "flyOut"
                    rButton.state = "flyIn"
                }
            }
        }

        Text {
            id: radioBTitle
            clip: true
            width: parent.width - buttonImg.width
            anchors.left: parent.cleft
            anchors.verticalCenter: parent.verticalCenter
            text: control.text
            font.pixelSize: 20
            font.bold: true
            color: "white"
        }

        Image {
            id: buttonImg
            width: sourceSize.width/2
            height: width
            transformOrigin: Item.TopLeft
            anchors.right: parent.right
            source: "ui/core_radiobutton_inactive.png"
        }
        Image {
            id: radioFill
            width: sourceSize.width/2
            height: width
            visible: false
            anchors.right: parent.right
            source:  "ui/core_radiobutton_active.png"
        }

        NumberAnimation {
            id: fillAnimation
            target: radioAnimationImage;
            property: "picNum";
            from: rButton.state === "flyIn" ? 7 : 1
            to: rButton.state === "flyIn" ? 1 : 7
            duration: 300
            onStopped: { if (control.checked)
                    rButton.state = "checked"
                else
                    rButton.state = "inactive"
            }
        }

        Image {
            id: radioAnimationImage
            visible: false
            width: sourceSize.width/2
            height: width
            transformOrigin: Item.TopLeft
            anchors.centerIn: buttonImg
            property int picNum: 7
            source: markDirection != "none" ? "ui/"+markDirection+"/"+picNum+".png"
                                            : ""
            y: 0
        }

        Image {
            id: radioMark
            scale: 0
            //transformOrigin: Item.TopLeft
            visible: false
            anchors.verticalCenter: parent.verticalCenter//buttonImg
            anchors.left: buttonImg.left
            anchors.leftMargin: 4
            source: "ui/core_radiobutton_active_mark.png"
            Behavior on scale {
                id: markBehaviour
                enabled:  true
                NumberAnimation {
                    duration: 100
                    from: 0
                    to: 0.5
                }
            }
        }

        state: "inactive"
        states: [
            State {
                name: "inactive"
                PropertyChanges { target: radioAnimationImage; visible: false; }
            },
            State {
                name: "checked"
                PropertyChanges { target: radioMark; scale: 1; visible: true }
                PropertyChanges { target: radioFill; visible: true; }
                PropertyChanges { target: radioAnimationImage; visible: false; }
            },
            State {
                name: "flyIn"
                PropertyChanges { target: markBehaviour; enabled: true; }
                PropertyChanges { target: fillAnimation; running: true; }
                PropertyChanges { target: radioAnimationImage; visible: true; }
            },
            State {
                name: "flyOut"
                PropertyChanges { target: radioAnimationImage; visible: true; }
                PropertyChanges { target: fillAnimation; running: true; }
            }
        ]
    }
}
