import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.1

Window {
    id: rootId
    width: 1200
    height: 600
    visible: true
    title: qsTr("Automotive Infomations")

    property int index: 0
    property int pedalValue: 0
    property int gearPosition: 0
    property int distance: allSettingsId.distance
    property int fuelLevel: allSettingsId.fuelNeedleRotationId
    property bool engineOn: false
    property bool airbagOn: fasle
    property bool oilpressureWarning: fasle
    property bool batteryWarning: fasle
    property bool onTurnLeft: false
    property bool onTurnRight: false

    Component.onDestruction:  {
        allSettingsId.fuelNeedleRotationId = fuelLevel
    }

    function defaultBoderButton() {
        navigationbutton.border.color = "black"
        klimabutton.border.color = "black"
        multimediabutton.border.color = "black"
        telefonbutton.border.color = "black"
        errorbutton.border.color = "black"
        camerabutton.border.color = "black"
        appbutton.border.color = "black"
        tachometerbutton.border.color = "black"
    }

    function highlightCurrentPage(index) {
        if(index === 0) {
            defaultBoderButton()
            navigationbutton.border.color = "red"
        }   else if(index === 1) {
            defaultBoderButton()
            klimabutton.border.color = "red"
        }   else if(index === 2) {
            defaultBoderButton()
            multimediabutton.border.color = "red"
        }   else if(index === 3) {
            defaultBoderButton()
            telefonbutton.border.color = "red"
        }   else if(index === 4) {
            defaultBoderButton()
            tachometerbutton.border.color = "red"
        }   else if(index === 5) {
            defaultBoderButton()
            camerabutton.border.color = "red"
        }   else if(index === 6) {
            defaultBoderButton()
            appbutton.border.color = "red"
        }   else {
            defaultBoderButton()
            errorbutton.border.color = "red"
        }
    }

    function changeGearPosition(angle) {
        if(angle > 420) gearPosition = 5
        else if(angle > 380) gearPosition = 4
        else if(angle > 340) gearPosition = 3
        else if(angle > 300) gearPosition = 2
        else if(angle > 260) gearPosition = 1
        else if(angle > 0) gearPosition = 0
    }

    function changeAllIdicatorStatus(engineOn) {
        if(engineOn === true) {
          oilIcon.opacity = 1
          batteryIcon.opacity = 1
        } else {
            oilIcon.opacity = 0.5
            batteryIcon.opacity = 0.5
        }
    }

    Timer {
        id: timer
        interval: 500
        running: true
        repeat: true
        onTriggered: {
            if(onTurnLeft) {
                if(turnLeftOff.opacity === 1) {
                    turnLeftOff.opacity = 0
                    turnLeftOn.opacity = 1
                } else {
                    turnLeftOff.opacity = 1
                    turnLeftOn.opacity = 0
                }
            }
            if(onTurnRight) {
                if(turnRightOff.opacity === 1) {
                    turnRightOff.opacity = 0
                    turnRightOn.opacity = 1
                } else {
                    turnRightOff.opacity = 1
                    turnRightOn.opacity = 0
                }
            }
        }
    }

    RowLayout {
        Column {
            id: col1
            width: rootId.width / 3
            height: rootId.height
            Rectangle {
                id: groupButtonId
                color: "darkgray"
                width: parent.width
                height: 180
                Grid {
                    rows: 2
                    spacing: 30
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    clip: true
                    Rectangle {
                        id: navigationbutton
                        width: 60
                        height: 60
                        border.color: "black"
                        border.width: 3
                        Image {
                            source: "images/navigation.png"
                            anchors.fill: parent
                            anchors.margins: 2
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                defaultBoderButton()
                                parent.border.color = "red"
                                index = 0
                            }
                        }
                    }
                    Rectangle {
                        id: klimabutton
                        width: 60
                        height: 60
                        border.color: "black"
                        border.width: 3
                        Image {
                            source: "images/klima.png"
                            anchors.fill: parent
                            anchors.margins: 2
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                defaultBoderButton()
                                parent.border.color = "red"
                                index = 1
                            }
                        }
                    }
                    Rectangle {
                        id: multimediabutton
                        width: 60
                        height: 60
                        border.color: "black"
                        border.width: 3
                        Image {
                            source: "images/multimedia.png"
                            anchors.fill: parent
                            anchors.margins: 2
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                defaultBoderButton()
                                parent.border.color = "red"
                                index = 2
                            }
                        }
                    }
                    Rectangle {
                        id: telefonbutton
                        width: 60
                        height: 60
                        border.color: "black"
                        border.width: 3
                        Image {
                            source: "images/telefon.png"
                            anchors.fill: parent
                            anchors.margins: 2
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                defaultBoderButton()
                                parent.border.color = "red"
                                index = 3
                            }
                        }
                    }
                    Rectangle {
                        id: tachometerbutton
                        width: 60
                        height: 60
                        border.color: "black"
                        border.width: 3
                        Image {
                            source: "images/tachometer.png"
                            anchors.fill: parent
                            anchors.margins: 2
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                defaultBoderButton()
                                parent.border.color = "red"
                                index = 4
                            }
                        }
                    }
                    Rectangle {
                        id: camerabutton
                        width: 60
                        height: 60
                        border.color: "black"
                        border.width: 3
                        Image {
                            source: "images/camera.png"
                            anchors.fill: parent
                            anchors.margins: 2
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                defaultBoderButton()
                                parent.border.color = "red"
                                index = 5
                            }
                        }
                    }
                    Rectangle {
                        id: appbutton
                        width: 60
                        height: 60
                        border.color: "black"
                        border.width: 3
                        Image {
                            source: "images/app.png"
                            anchors.fill: parent
                            anchors.margins: 2
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                defaultBoderButton()
                                parent.border.color = "red"
                                index = 6
                            }
                        }
                    }
                    Rectangle {
                        id: errorbutton
                        width: 60
                        height: 60
                        border.color: "black"
                        border.width: 3
                        Image {
                            source: "images/error.png"
                            anchors.fill: parent
                            anchors.margins: 2
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                defaultBoderButton()
                                parent.border.color = "red"
                                index = 7
                            }
                        }
                    }
                }
            }
            Rectangle {
                id: separateId
                width: col1.width
                height: 3
                color: "black"
                anchors.top: groupButtonId.bottom
            }
            Rectangle {
                id: infomationAreaId
                width: col1.width
                height: col1.height - groupButtonId.height
                anchors.top: separateId.bottom
                anchors.bottom: rootId.bottom
                clip: true
                SwipeView {
                    id: swipeViewId
                    anchors.fill: parent
                    width: infomationAreaId.width
                    height: infomationAreaId.height
                    currentIndex: index
                    onCurrentIndexChanged: {
                        highlightCurrentPage(currentIndex)
                    }
                    NavigationPage {

                    }
                    KlimaPage {

                    }
                    MultimediaPage {

                    }
                    TelefonPage {

                    }
                    TachometerPage {

                    }
                    CameraPage {

                    }
                    AppPage {

                    }
                    ErrorPage {

                    }
                }
            }
        }
        Column {
            id: col3
            width: horizontalRect.width
            height: horizontalRect.height
            anchors.left: col1.right
            Rectangle {
                id: horizontalRect
                color: "black"
                width: 3
                height: rootId.height
            }
        }
        Column {
            id: col2
            width: rootId.width - col1.width - col3.width
            height: rootId.height
            anchors.left: col3.right
            ColumnLayout {
                height: parent.height
                width: parent.width
                Rectangle {
                    id: odometerArea
                    height: parent.height - 10
                    width: parent.width
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "black"
                    Rectangle {
                        id: backgroundId
                        z: 5
                        anchors.centerIn: parent
                        width: speedOdoId.width + gearOdoId.width * 2 - speedOdoId.width/3
                        height: speedOdoId.height * 1.5
                        border.color: "yellow"
                        border.width: 4
                        color: "black"
                        radius: width
                        antialiasing: true
                        Rectangle {
                            id: turnLeftId
                            width: 70
                            height: width
                            color: "black"
                            anchors.bottom: gearOdoId.top
                            anchors.right: gearOdoId.right
                            Image {
                                id: turnLeftOff
                                anchors.fill: parent
                                source: "images/turnOff.png"
                            }
                            Image {
                                id: turnLeftOn
                                anchors.fill: parent
                                source: "images/turnOn.png"
                                opacity: 0
                            }
                        }
                        Rectangle {
                            id: turnRightId
                            width: 70
                            height: width
                            color: "black"
                            anchors.bottom: fuelOdoContainerId.top
                            anchors.left: fuelOdoContainerId.left
                            Image {
                                id: turnRightOff
                                anchors.fill: parent
                                source: "images/turnOff.png"
                                rotation: 180
                            }
                            Image {
                                id: turnRightOn
                                anchors.fill: parent
                                source: "images/turnOn.png"
                                rotation: 180
                                opacity: 0
                            }
                        }
                        Rectangle {
                            id: minorBackground
                            width: speedOdoId.width + gearOdoId.width*2/3
                            height: speedOdoId.height / 2
                            anchors.bottom: speedOdoId.bottom
                            color: "black"
                            anchors.horizontalCenter: parent.horizontalCenter
                            border {
                                width: 4
                                color: "gold"
                            }
                        }
                        Rectangle {
                            id: speedOdoId
                            z: 2
                            anchors.horizontalCenter: parent.horizontalCenter
                            y: 40
                            height: 300
                            width: 300
                            radius: width / 2
                            color: "black"
                            antialiasing: true
                            border.color: "gold"
                            border.width: 4
                            property int speedMax: 280
                            property int startAngle: 248
                            property int angleLength: ((180 - (startAngle - 180) + 360) - startAngle) / 14
                            property int startAngle1: (startAngle + startAngle + angleLength) / 2
                            property int angleLength1: ((180 - (startAngle1 - 180) + 360) - startAngle1) / 13
                            Repeater {
                                model: 15
                                Item {
                                    id: hourContainer
                                    property int hour: index
                                    height: speedOdoId.height/2
                                    transformOrigin: Item.Bottom
                                    rotation: index * speedOdoId.angleLength + speedOdoId.startAngle
                                    x: speedOdoId.width/2
                                    y: 0
                                    Rectangle {
                                        id: bigSpliterId
                                        height: speedOdoId.height*0.05
                                        width: height*0.5
                                        color: "gold"
                                        antialiasing: true
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        anchors.top: parent.top
                                        anchors.topMargin: 10
                                    }
                                    Text {
                                        id: speedId
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        x: 0
                                        y: speedOdoId.height*0.1
                                        color: (speedId.text > 200) ? "red" : "dodgerblue"
                                        rotation: 360 - (index * speedOdoId.angleLength + speedOdoId.startAngle)
                                        text: index * (speedOdoId.speedMax / (15 - 1))
                                        font.pixelSize: speedOdoId.height*0.047
                                        font.bold: true
                                    }
                                }
                            }
                            Repeater {
                                model: 14
                                Item {
                                    property int hour: index
                                    height: speedOdoId.height/2
                                    transformOrigin: Item.Bottom
                                    rotation: index * speedOdoId.angleLength1 + speedOdoId.startAngle1
                                    x: speedOdoId.width/2
                                    y: 0
                                    Rectangle {
                                        height: speedOdoId.height*0.03
                                        width: height*0.3
                                        color: "white"
                                        antialiasing: true
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        anchors.top: parent.top
                                        anchors.topMargin: 10
                                    }
                                }
                            }
                            Rectangle {
                                id: centerId
                                anchors.centerIn: parent
                                height: speedOdoId.height*0.05
                                width: height
                                radius: width/2
                                color: "red"
                                z: 3
                            }
                            Label {
                                id: speedTextId
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: "Speed"
                                color: "gold"
                                anchors.top: centerId.bottom
                                anchors.topMargin: 20
                                font.pointSize: 20
                                font.bold: true
                            }
                            Label {
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: "km/h"
                                color: "gold"
                                anchors.top: speedTextId.bottom
                                anchors.topMargin: 2
                                font.pointSize: 20
                                font.bold: true
                            }
                            Item {
                                id: speedNeedleId
                                z: 2
                                anchors {
                                    top: speedOdoId.top
                                    bottom: speedOdoId.bottom
                                    horizontalCenter: parent.horizontalCenter
                                }
                                Rectangle {
                                    width: 3
                                    height: speedNeedleId.height * 0.35
                                    color: "gold"
                                    z: 3
                                    anchors {
                                        horizontalCenter: speedNeedleId.horizontalCenter
                                        bottom: speedNeedleId.verticalCenter
                                    }
                                    antialiasing: true
                                }

                                rotation: pedalValue * speedOdoId.angleLength + speedOdoId.startAngle


                                Behavior on rotation {
                                    SmoothedAnimation {
                                        velocity: 50
                                    }
                                }
                                onRotationChanged: {
                                    if(rotation > 300) absIcon.opacity = 1
                                    else absIcon.opacity = 0.5
                                    changeGearPosition(rotation)
                                    if(rotation > 0) {

                                    }
                                }
                            }
                            Rectangle {
                                id: distanceId
                                width: 120
                                height: 30
                                radius: 5
                                anchors.bottom: centerId.top
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.bottomMargin: 12
                                color: "white"
                                Label {
                                    text: "odo 54365 km"
                                    anchors.centerIn: parent
                                    color: "black"
                                    font.pointSize: 12
                                 }
                            }
                        }
                        Rectangle {
                            id: gearOdoId
                            x: speedOdoId.x + speedOdoId.width / 2 - speedOdoId.width * 1/3 - gearOdoId.width
                            height: 250
                            width: 250
                            radius: width / 2
                            anchors.bottom: speedOdoId.bottom
                            color: "black"
                            border.color: "gold"
                            border.width: 4
                            Repeater {
                                model: 6
                                Item {
                                    id: gearContainer
                                    property int hour: index
                                    height: gearOdoId.height/2
                                    transformOrigin: Item.Bottom
                                    rotation: index * 40 + 180
                                    x: gearOdoId.width/2
                                    y: 0
                                    Rectangle {
                                        id: gearBoxId
                                        height: gearOdoId.height*(0.15+index*0.008)
                                        width: height
                                        radius: width / 2
                                        color: (index === gearPosition) ? "gold" : "white"
                                        antialiasing: true
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        anchors.top: parent.top
                                        anchors.topMargin: 20
                                        Text {
                                            anchors.centerIn: parent
                                            color: "black"
                                            text: index + 1
                                            font.bold: true
                                            font.pointSize: 20
                                        }
                                    }
                                }
                            }
                            Text {
                                anchors.verticalCenter: parent.verticalCenter
                                x: parent.width / 2 - 30
                                color: "Gold"
                                text: "Gear" + "\n" + "Postion"
                                font.bold: true
                                font.pointSize: 20
                            }
                        }
                        Rectangle {
                            id: fuelOdoContainerId
                            x: speedOdoId.x + speedOdoId.width / 2 + speedOdoId.width * 1/3
                            height: 250
                            width: 250
                            radius: width / 2
                            anchors.bottom: speedOdoId.bottom
                            color: "black"
                            border.color: "gold"
                            border.width: 4
                            Rectangle {
                                id: fuelOdoId
                                width: parent.width / 1.6
                                height: width
                                radius: width / 2
                                x: width / 2 - 10
                                y: height / 2 - 10
                                color: parent.color
                                border.color: "gold"
                                border.width: 4
                                Repeater {
                                    model: 5
                                    Item {
                                        id: fuelContainer
                                        property int hour: index
                                        height: fuelOdoId.height/2
                                        transformOrigin: Item.Bottom
                                        rotation: index * 45 + 270
                                        x: fuelOdoId.width/2
                                        y: 0
                                        Rectangle {
                                            height: fuelOdoId.height*0.1
                                            width: height/2
                                            color: (index === 0) ? "red" : "gold"
                                            antialiasing: true
                                            anchors.horizontalCenter: parent.horizontalCenter
                                            anchors.top: parent.top
                                            anchors.topMargin: 7
                                        }
                                    }
                                }
                                Image {
                                    id: fuelIcon
                                    width: 40
                                    height: 40
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.bottom: center1Id.top
                                    source: "images/fuel.png"
                                    anchors.bottomMargin: 5
                                    z: 3
                                }
                                Rectangle {
                                    id: center1Id
                                    anchors.centerIn: parent
                                    height: speedOdoId.height*0.05
                                    width: height
                                    radius: width/2
                                    color: "red"
                                    z: 3
                                }
                                Item {
                                    id: fuelNeedleId
                                    anchors {
                                        top: fuelOdoId.top
                                        bottom: fuelOdoId.bottom
                                        horizontalCenter: parent.horizontalCenter
                                    }
                                    Rectangle {
                                        width: 3
                                        height: fuelNeedleId.height * 0.35
                                        color: "gold"
                                        z: 3
                                        anchors {
                                            horizontalCenter: fuelNeedleId.horizontalCenter
                                            bottom: fuelNeedleId.verticalCenter
                                        }
                                        antialiasing: true
                                    }
                                    rotation: fuelLevel
                                    Behavior on rotation {
                                        SmoothedAnimation {
                                            velocity: 40
                                        }
                                    }
                                }
                            }
                            Label {
                                text: "Fuel level"
                                font.pointSize: 20
                                color: "gold"
                                font.bold: true
                                x: 70
                                y: 30
                            }
                        }
                        Rectangle {
                            id: idicatorArea
                            anchors.bottom: parent.bottom
                            anchors.top: speedOdoId.bottom
                            anchors.margins: 10
                            anchors.horizontalCenter: parent.horizontalCenter
                            width: speedOdoId.width
                            color: parent.color
                            Grid {
                                rows: 2
                                anchors.centerIn: parent
                                columnSpacing: 70
                                rowSpacing: 20
                                Image {
                                    id: engineIcon
                                    width: 25
                                    height: width
                                    source: "images/engine.png"
                                    opacity: 0.5
                                }
                                Image {
                                    id: absIcon
                                    width: 25
                                    height: width
                                    source: "images/abs.png"
                                    opacity: 0.5
                                }
                                Image {
                                    id: airbagIcon
                                    width: 25
                                    height: width
                                    source: "images/airbag.png"
                                    opacity: 0.5
                                }
                                Image {
                                    id: batteryIcon
                                    width: 25
                                    height: width
                                    source: "images/battery.png"
                                    opacity: 0.5
                                }
                                Image {
                                    id: oilIcon
                                    width: 25
                                    height: width
                                    source: "images/oil.png"
                                    opacity: 0.5
                                }
                                Image {
                                    id: tireIcon
                                    width: 25
                                    height: width
                                    source: "images/tire.png"
                                    opacity: 0.5
                                }
                                Image {
                                    id: washIcon
                                    width: 25
                                    height: width
                                    source: "images/wash.png"
                                    opacity: 0.5
                                }
                                Image {
                                    id: waterIcon
                                    width: 25
                                    height: width
                                    source: "images/water.png"
                                    opacity: 0.5
                                }
                            }
                        }
                    }
                }
                Rectangle {
                    id: catchKeyAreaId
                    height: col2.height - odometerArea.height
                    width: col2.width
                    y: odometerArea.y + odometerArea.height
                    anchors.top: odometerArea.bottom
                    Rectangle {
                        width: parent.width
                        height: 10
                        color: odometerArea.color
                        anchors.top: odometerArea.bottom
                        focus: true
                        Keys.onPressed: {
                            if (event.key === Qt.Key_R && fuelLevel > 270 && engineOn === true) {
                                while(pedalValue < 14) pedalValue++
                                if(fuelLevel > 270) fuelLevel--
                            }
                            if (event.key === Qt.Key_Up) {
                                if(gearPosition < 5) ++gearPosition
                            }
                            if (event.key === Qt.Key_Down) {
                                if(gearPosition > 0) --gearPosition
                            }
                            if (event.key === Qt.Key_F) {
                                fuelLevel = 450
                            }
                            if(event.key === Qt.Key_1) {
                                engineOn = !engineOn
                                if(engineOn === true) {
                                    engineIcon.opacity = 1
                                    changeAllIdicatorStatus(engineOn)
                                } else {
                                    engineIcon.opacity = 0.5
                                    changeAllIdicatorStatus(engineOn)
                                }
                            }
                            if(event.key === Qt.Key_2 && engineOn === true) {
                                washIcon.opacity = 1
                            }
                            if(event.key === Qt.Key_Left) {
                                if(onTurnRight) {
                                    onTurnRight = false
                                    turnRightOn.opacity = 0
                                    turnRightOff.opacity = 1
                                }
                                onTurnLeft = !onTurnLeft
                                if(onTurnLeft) {
                                    timer.start()
                                } else {
                                    turnLeftOn.opacity = 0
                                    turnLeftOff.opacity = 1
                                }
                            }
                            if(event.key === Qt.Key_Right) {
                                if(onTurnLeft) {
                                    onTurnLeft = false
                                    turnLeftOn.opacity = 0
                                    turnLeftOff.opacity = 1
                                }
                                onTurnRight = !onTurnRight
                                if(onTurnRight) {
                                    timer.start()
                                } else {
                                    turnRightOn.opacity = 0
                                    turnRightOff.opacity = 1
                                }
                            }
                        }
                        Keys.onReleased: {
                            if (event.key === Qt.Key_R)
                            {
                                while(pedalValue > 0) pedalValue--
                            }
                            if(event.key === Qt.Key_2 && engineOn === true) {
                                washIcon.opacity = 0.5
                            }
                        }
                    }
                }
            }
        }
    }
    Settings {
        id: allSettingsId
        property alias fuelNeedleRotationId: fuelNeedleId.rotation
        //property alias distance: value
        property alias currentPage: rootId.index
    }
}
