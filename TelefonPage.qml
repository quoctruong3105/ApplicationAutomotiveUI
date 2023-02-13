import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.4
import QtQuick.Dialogs 1.3
import quoc.truong 1.0

Item {
    id: telefonPage
    anchors.fill: infomationAreaId
    function updateData() {
        var length = converterId.length()
        mModelId.clear()
        for(var i = 0; i < length; i++) {
            var list = converterId.getData(i)
            mModelId.append({"name":list[0],"phone":list[2]})
        }
    }

    Converter {
        id: converterId
    }


    Label {
        id: dictionaryLabelId
        y: 5
        text: "Phone Directory"
        font.bold: true
        font.pointSize: 15
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Dialog {
        id: addPhoneDialog
        width: 200
        height: 200
        standardButtons: Dialog.Ok | Dialog.Cancel
        title: "Add new contact"
        ColumnLayout {
            spacing: 5
            Text {
                id: nameLabelId
                width: parent.width
                text: "Name"
            }

            Rectangle {
                width: 200
                height: nameId.implicitHeight
                border.color: "black"
                focus: true
                TextArea {
                    id: nameId
                    placeholderText: "Type name"
                }
            }

            Text {
                id: phoneLabelId
                text: "Phone"
            }

            Rectangle {
                width: 200
                height: phoneId.implicitHeight
                focus: true
                border.color: "black"
                TextArea {
                    id: phoneId
                    placeholderText: "Type phone number"
                }
            }
        }
        onAccepted: {
            if(nameId.text != "" && phoneId.text != "") {
                converterId.pushData(nameId.text, "0", phoneId.text)
                nameId.text = ""
                phoneId.text = ""
                updateData()
            }
        }
    }

    Flickable {
        width: infomationAreaId.width
        height: 370
        anchors.top: dictionaryLabelId.bottom
        contentHeight: mGridId.implicitHeight
        clip: true
        Rectangle {
            id: addButton
            width: 40
            height: 40
            radius: width / 2
            antialiasing: true
            x: 7
            y: 15
            z: 1
            Image {
                id: addImage
                width: 30
                height: 30
                anchors.centerIn: parent
                source: "images/addPhone.png"
            }
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: addButton.color = "lightgrey"
                onExited: addButton.color = "white"
                onClicked: {
                    addPhoneDialog.open()
                }
            }
        }
        ListView {
            id : mListViewId
            anchors.fill: parent
            model : mModelId
            anchors.top: dictionaryLabelId.bottom
            anchors.topMargin: 10
            delegate: delegateId
        }
        ListModel {
            id : mModelId
        }
        Component.onCompleted: {
            updateData()
        }
        Component {
            id : delegateId
            GridLayout {
                id: mGridId
                columns: 2
                columnSpacing: 30
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle {
                    height: 50
                    width: 100
                    //color: "red"
                    Text {
                        id: nameId
                        anchors.centerIn: parent
                        text: name
                        font.pointSize: 15
                    }
                }
                Rectangle {
                    height: 50
                    width: 100
                    Text {
                        id: phoneNumberId
                        anchors.centerIn: parent
                        text: phone
                        font.pointSize: 15
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        nameId.color = "red"
                        phoneNumberId.color = "red"
                    }
                    onExited: {
                        nameId.color = "black"
                        phoneNumberId.color = "black"
                    }

                    onClicked: {
                        messageDialog.open()
                    }
                }
                MessageDialog {
                    id: messageDialog
                    title: "Make a phone call"
                    text: "Do you want to call " + name + "?"
                    standardButtons: StandardButton.Ok | StandardButton.Close
                    onAccepted: {
                        console.log("Calling " + name)
                        callingPopup.open()
                    }
                    onRejected: {
                        console.log("Canceled")
                    }
                }
                Popup {
                    id: callingPopup
                    width: 400
                    height: 600
                    anchors.centerIn: infomationAreaId
                    modal: true
                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 5
                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: phoneNumber
                            font.pointSize: 15
                        }
                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: "calling..."
                            font.pointSize: 15
                        }
                        GridLayout {
                            anchors.horizontalCenter: parent.horizontalCenter
                            columns: 3
                            rowSpacing: 20
                            columnSpacing: 20
                            Rectangle {
                                width: 50
                                height: 50
                                radius: width / 2
                                color: "blue"
                            }
                            Rectangle {
                                width: 50
                                height: 50
                                radius: width / 2
                                color: "blue"
                            }
                            Rectangle {
                                width: 50
                                height: 50
                                radius: width / 2
                                color: "blue"
                            }
                            Rectangle {
                                width: 50
                                height: 50
                                radius: width / 2
                                color: "blue"
                            }
                            Rectangle {
                                width: 50
                                height: 50
                                radius: width / 2
                                color: "blue"
                            }
                            Rectangle {
                                width: 50
                                height: 50
                                radius: width / 2
                                color: "blue"
                            }
                        }
                        Rectangle {
                            id: endCall
                            width: 90
                            height: 90
                            anchors.horizontalCenter: parent.horizontalCenter
                            Image {
                                anchors.fill: parent
                                source: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWxbNeg_HhSOELX1l8cUr3YLjOX_vPcJVo2Olsd0RgYqdUf1lcagSw2nw71R98XZ4Ueqw&usqp=CAU"
                            }
                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    callingPopup.close()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
