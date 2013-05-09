import QtQuick 2.1
import MMKQmlStyle 1.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

Rectangle {
    id: rootApp
    property Component buttonStyle: MMKButton{}
    property Component radioBStyle: MMKCheckBox{}
    property Component sliderStyle: MMKSlider{}
    property Component textFieldStyle: MMKTextField{}
    property Component tabViewStyle: MMKTabView{}
    property Component comboBoxStyle: MMKComboBox{}
    property Component progressStyle: MMKProgressBar{}
    property Component radioStyle: MMKRadioButton{}
    //property Component gboxStyle: MMKGroupBox{}

    signal sendMsg(string message);

    Text {
        z: 1
        text: "Safemode"
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.margins: 15
        font.pixelSize: 20
        color: "red"
        font.bold: true
        visible: datahandling.safeMode
    }

    Rectangle {
        id: loginscreen
        width: parent.width
        height: parent.height
        color: "black"
        z: 2
        Image {
            anchors.right: loginform.left
            anchors.top: loginform.top
            anchors.rightMargin: 20
            source: "pics/key.png"
            height: 128
            width: 128
        }

        Column {
            id: loginform
            anchors.centerIn: parent
            Label {
                color: "white"
                text: "Username"
            }

            TextField{
                id: username
                style: textFieldStyle
                width: 230
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
                width: 230
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

            Row {
                anchors.right: parent.right
                spacing: 10
                Button {
                    width: 100
                    height: 30
                    style: buttonStyle
                    text: "Login"
                    onClicked: {
                        if (username.text === "admin" &&
                                password.text === "bitch") {
                            loginscreen.visible = false;
                            loginscreen.state = "loggedIn"
                        } else {
                            loginscreen.state = "loginFailed"
                            loginFailedAnimation.start()
                        }
                    }
                }
                Button {
                    width: 100
                    height: 30
                    style: buttonStyle
                    text: "Safemode"
                    onClicked: {
                        loginscreen.visible = false;
                        print ("Setting safemode:" + datahandling.safeMode)
                        datahandling.safeMode = true
                        print(datahandling.safeMode)
                        loginscreen.state = "loggedIn"
                        rootApp.sendMsg("Hu, this is a message");
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
