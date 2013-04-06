import QtQuick 2.1
import MMKQmlStyle 1.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

Rectangle {
    property Component buttonStyle: MMKButton{}
    property Component radioBStyle: MMKCheckBox{}
    property Component sliderStyle: MMKSlider{}
    property Component textFieldStyle: MMKTextField{}
    property Component tabViewStyle: MMKTabView{}
    property Component comboBoxStyle: MMKComboBox{}
    property Component progressStyle: MMKProgressBar{}
    property Component radioStyle: MMKRadioButton{}
    //property Component gboxStyle: MMKGroupBox{}

    Rectangle {
        id: loginscreen
        width: parent.width
        height: parent.height
        color: "black"
        z: 2
        Column {
            anchors.centerIn: parent
            Label {
                color: "white"
                text: "Username"
            }

            TextField{
                id: username
                style: textFieldStyle
            }
            Item {
                height: 20
                width: 1
            }

            Label {
                color: "white"
                text: "Password"
            }

            TextField{
                id: password
                style: textFieldStyle
                echoMode: TextInput.Password
            }
            Item {
                height: 10
                width: 1
            }
            Text {
                id: loginFailed
                visible: false
                text: "Login failed"
                color: "red"
                font.bold: true
                SequentialAnimation on x{
                    id: loginFailedAnimation
                    NumberAnimation{
                        duration: 200
                        from:0; to: 15;
                        easing.type: Easing.InOutBack
                    }
                    NumberAnimation{
                        duration: 200
                        from:15; to: 0;
                        easing.type: Easing.InOutBack
                    }
                }
            }

            Button {
                width: 100
                height: 30
                anchors.right: parent.right
                style: buttonStyle
                text: "Login"
                onClicked: {
                    if (username.text === "admin" &&
                            password.text === "password") {
                        loginscreen.visible = false;
                        loginscreen.state = "loggedIn"
                    } else {
                        loginscreen.state = "loginFailed"
                        loginFailedAnimation.start()
                    }
                }
            }
        }


        Behavior on y {
            NumberAnimation {duration: 400; easing.type: Easing.InQuart }
        }

        state: "login"

        states: [
            State {
                name: "login"
                PropertyChanges { target: loginscreen; visible: true; y: 0}
            },
            State {
                name: "loginFailed"
                extend: "login"
                PropertyChanges { target: loginFailed; visible: true;}
            },
            State {
                name: "loggedIn"
                PropertyChanges { target: loginscreen; y: -loginscreen.height}
            }
        ]
    }
}
