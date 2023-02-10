import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.4

Item {
    id: klimaPage
    anchors.fill: infomationAreaId
    property int level: 1
    property int klimaValue: 18
    property bool isActive: fasle
    property bool isAuto: fasle

    function checkLevel(level) {
        if(level === 1) {
            level1.visible = true
            level2.visible = false
            level3.visible = false
        } else if(level === 2) {
            level1.visible = true
            level2.visible = true
            level3.visible = false
        } else {
            level1.visible = true
            level2.visible = true
            level3.visible = true
        }
    }
    ColumnLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.margins: 15
        spacing: 30
        RowLayout {
            id: row1
            anchors.horizontalCenter: parent.horizontalCenter
            y: 50
            spacing: 70
            ColumnLayout {
                spacing: 30
                Rectangle {
                    id: increase
                    width: 50
                    height: 50
                    radius: width/2
                    color: "transparent"
                    Image {
                        id: increaseId
                        width: parent.width - 1
                        height: parent.height - 1
                        source: "images/triangle.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: increaseId.scale = 1.2
                        onExited: increaseId.scale = 1
                        onClicked: {
                            if(klimaValue < 28) klimaValue++
                        }
                    }
                }
                Rectangle {
                    width: 50
                    anchors.top: increase.bottom
                    anchors.bottom: decrease.top
                    Label {
                        id: klimaLabelId
                        anchors.centerIn: parent
                        text: klimaValue + "\u2103"
                        font.pointSize: 30
                        font.bold: true
                    }
                }
                Rectangle {
                    id: decrease
                    width: 50
                    height: 50
                    radius: width/2
                    color: "transparent"
                    Image {
                        id: decreaseId
                        width: parent.width - 1
                        height: parent.height - 1
                        source: "images/triangle.png"
                        rotation: -180
                    }
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: decreaseId.scale = 1.2
                        onExited: decreaseId.scale = 1
                        onClicked: {
                            if(klimaValue > 18) klimaValue--
                        }
                    }
                }
            }
            ColumnLayout {
                spacing: 40
                Rectangle {
                    id: acButton
                    y: 90
                    width: 60
                    height: 60
                    color: "grey"
                    radius: 5
                    Text {
                        id: acText
                        text: "A/C"
                        color: "darkturquoise"
                        font.bold: true
                        font.pointSize: 20
                        anchors.centerIn: parent
                    }
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: acButton.scale = 1.2
                        onExited: acButton.scale = 1
                        onClicked: {
                            klimaPage.isActive = !klimaPage.isActive
                            if(klimaPage.isActive) {
                                acButton.color = "red"
                            } else {
                                acButton.color = "grey"
                            }
                        }
                    }
                }
                Rectangle {
                    id: autoButton
                    y: 200
                    width: 60
                    height: 60
                    color: "grey"
                    radius: 5
                    Text {
                        id: autoText
                        text: "AUTO"
                        color: "darkturquoise"
                        font.bold: true
                        font.pointSize: 15
                        anchors.centerIn: parent
                    }
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: autoButton.scale = 1.2
                        onExited: autoButton.scale = 1
                        onClicked: {
                            klimaPage.isAuto = !klimaPage.isAuto
                            if(klimaPage.isAuto) {
                                autoButton.color = "red"
                            } else {
                                autoButton.color = "grey"
                            }
                        }
                    }
                }
            }
            ColumnLayout {
                spacing: 30
                Rectangle {
                    id: increase1
                    width: 50
                    height: 50
                    radius: width/2
                    Image {
                        id: increase1Id
                        width: parent.width - 1
                        height: parent.height - 1
                        source: "images/triangle.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: increase1Id.scale = 1.2
                        onExited: increase1Id.scale = 1
                        onClicked: {
                            if(level < 3) level++
                            checkLevel(level)
                            fanId.rotation = 0
                            positiveRotationAni.start()
                            negativeRotationAni.stop()
                        }
                    }
                }
                Rectangle {
                    height: 50
                    width: 50
                    anchors.top: increase1.bottom
                    anchors.bottom: decrease1.top
                    RowLayout {
                        anchors.centerIn: parent
                        spacing: 10
                        Rectangle {
                            id: fanId
                            width: 40
                            height: width
                            Image {
                                anchors.fill: parent
                                source: "images/fan.png"
                            }
                        }
                        Rectangle {
                            id: level1
                            width: 5
                            height: 30
                            color: "#00ced1"
                            visible: false
                        }
                        Rectangle {
                            id: level2
                            width: 5
                            height: 30
                            color: "#00ced1"
                            visible: false
                        }
                        Rectangle {
                            id: level3
                            width: 5
                            height: 30
                            color: "#00ced1"
                            visible: false
                        }
                        RotationAnimation {
                            id: positiveRotationAni
                            target: fanId
                            from: fanId.rotation
                            to: 360
                            direction: Animation.Clockwise
                            duration: 500
                        }
                        RotationAnimation {
                            id: negativeRotationAni
                            target: fanId
                            from: fanId.rotation
                            to: -360
                            direction: Animation.Counterclockwise
                            duration: 500
                        }
                    }
                }
                Rectangle {
                    id: decrease1
                    width: 50
                    height: 50
                    radius: width/2
                    Image {
                        id: decrease1Id
                        width: parent.width - 1
                        height: parent.height - 1
                        source: "images/triangle.png"
                        rotation: -180
                    }
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: decrease1Id.scale = 1.2
                        onExited: decrease1Id.scale = 1
                        onClicked: {
                            if(level > 1) level--
                            checkLevel(level)
                            fanId.rotation = 0
                            negativeRotationAni.start()
                            positiveRotationAni.stop()
                        }
                    }
                }
            }
        }
        RowLayout {
            id: row2
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 65
            Rectangle {
                id: seatHeatButton
                width: 60
                height: 60
                radius: 5
                color: "grey"
                Image {
                    width: parent.width - 15
                    height: parent.height - 15
                    anchors.centerIn: parent
                    source: "images/seat.png"
                }
            }
            Rectangle {
                id: seatHeatButton1
                width: 60
                height: 60
                radius: 5
                color: "grey"
            }
            Rectangle {
                id: seatHeatButton2
                width: 60
                height: 60
                radius: 5
                color: "grey"
            }
        }
        RowLayout {
            id: row3
            spacing: 190
            Rectangle {
                id: seatHeatButton3
                width: 60
                height: 60
                radius: 5
                color: "grey"
            }
            Rectangle {
                id: seatHeatButton4
                width: 60
                height: 60
                radius: 5
                color: "grey"
            }
        }
    }
    Component.onCompleted: checkLevel(level)
}
