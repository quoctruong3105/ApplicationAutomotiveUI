import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.4
import QtMultimedia 5.15

Item {
    id: multimediaPage
    anchors.fill: infomationAreaId
    property int time: 1
    function showCurrentStatus() {
        if(time === 1) {
            pauseId.opacity = 0
            playId.opacity = 1
            playMusic.pause()
            diskRotateAniId.pause()
        }
        else {
            playId.opacity = 0
            pauseId.opacity = 1
            playMusic.play()
            diskRotateAniId.resume()
        }
    }
    Flickable {
        id: listTrackId
        width: infomationAreaId.width
        height: 180
        anchors.top: groupButtonId.bottom
        anchors.bottom: diskId.top
        anchors.bottomMargin: 10
        clip: true
        Rectangle {
            anchors.fill: parent
            ListView {
                id: viewId
                anchors.fill: parent
                model: musicList
                currentIndex: playlist.currentIndex
                delegate: Rectangle {
                    id : delegateId
                    width: parent.width
                    height: 40
                    color: "lightslategray"
                    border.color: "white"
                    Row {
                        anchors.fill: parent
                        spacing: 20
                        Rectangle {
                            id: currentTrackRectIcon
                            x: 10
                            y: textId.y
                            z: 2
                            height: parent.height - 15
                            width: height
                            color: "lightslategray"
                            visible: (ind == viewId.currentIndex) ? true : false
                            Image {
                                id: currentTrackIcon
                                anchors.fill: parent
                                source: "images/volume.png"
                            }
                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                onEntered: currentTrackIcon.scale = 1.2
                                onExited: currentTrackIcon.scale = 1
                                onClicked: {
                                    volumnPop.open()
                                }
                            }
                        }
                        Text {
                            id : textId
                            anchors.centerIn: parent
                            font.pointSize: 15
                            text : name
                            color: "white"
                        }
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: textId.color = "red"
                            onExited: textId.color = "white"
                            onClicked: {
                                playlist.currentIndex = index
                                console.log(playlist.currentIndex)
                                playId.opacity = 0
                                pauseId.opacity = 1
                                playMusic.play()
                                diskRotateAniId.resume()
                            }
                        }
                    }
                }
            }
            ListModel {
                id: musicList
                ListElement { ind: "0"; name: "Đơn giản anh yêu em"; artis: "Quốc Việt"}
                ListElement { ind: "1"; name: "Vỡ tan"; artis: "Trịnh Thăng Bình"}
                ListElement { ind: "2"; name: "Lắng nghe nước mắt"; artis: "Noo Phước Thịnh"}
                ListElement { ind: "3"; name: "Chạy về phía anh"; artis: "Noo Phước Thịnh"}
                ListElement { ind: "4"; name: "Suy nghĩ trong anh"; artis: "Khắc Việt"}
                ListElement { ind: "5"; name: "Ngày em đi"; artis: "Only C - Lou Hoàng"}
                ListElement { ind: "6"; name: "Xa em"; artis: "Noo Phước Thịnh"}
                ListElement { ind: "7"; name: "Yêu em rất nhiều"; artis: "Hoàng Tôn"}
            }
        }
    }
    Column {
        id: id1
        y: infomationAreaId.height / 2 - 20
        width: parent.width * 2 / 3
        anchors.horizontalCenter: parent.horizontalCenter
        Image {
            id: diskId
            width: 120
            height: 120
            anchors.horizontalCenter: parent.horizontalCenter
            source: "images/disk.png"
            RotationAnimation {
                id: diskRotateAniId
                target: diskId
                loops: Animation.Infinite
                from: diskId.rotation
                to: 360
                direction: RotationAnimation.Clockwise //Clockwise or Counterclockwise
                duration: 20000
                running: true
            }
        }
        Rectangle {
            id: duarationContainerId
            anchors.top: diskId.bottom
            width: infomationAreaId.width
            height: 30
            anchors.topMargin: 5
            x : -23
            anchors.left: rootId.left
            RowLayout {
                anchors.fill: parent
                Rectangle {
                    id: musicPositionId
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: durationId.left
                    width: text1.implicitWidth
                    height: text1.implicitHeight
                    Text {
                        id: text1
                        text: playMusic.minuteToShow + ":" + playMusic.secondToShow
                        font.pointSize: 15
                        font.bold: true
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    id:durationId
                    width: sliderId.implicitWidth
                    height: sliderId.implicitHandleHeight
                    anchors.verticalCenter: parent.verticalCenter
                    Slider {
                        id: sliderId
                        from: 0
                        to: playMusic.duration
                        anchors.centerIn: parent
                        onValueChanged: {
                            playMusic.seek(sliderId.value)
                        }
                    }
                }
                Rectangle {
                    anchors.left: durationId.right
                    anchors.verticalCenter: durationId.verticalCenter
                    width: text2.implicitWidth
                    height: text2.implicitHeight
                    Text {
                        id: text2
                        text: playMusic.minuteDurationToShow + ":" + playMusic.secondDurationToShow
                        font.pointSize: 15
                        font.bold: true
                        anchors.centerIn: parent
                    }
                }
            }
        }
        Row {
            id: musicButtonId
            anchors.top: duarationContainerId.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 50
            Rectangle {
                id: preTrackId
                width: 30
                height: width
                Image {
                    id: preIconId
                    anchors.fill: parent
                    source: "images/forward.png"
                    rotation: 180
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: preIconId.scale = 1.2
                        onExited: preIconId.scale = 1
                        onClicked: {
                            if(playlist.currentIndex > 0) playlist.currentIndex--
                            playMusic.play()
                            pauseId.opacity = 1
                            playId.opacity = 0
                            diskRotateAniId.resume()
                        }
                    }
                }
            }
            Rectangle {
                width: 30
                height: width
                Image {
                    id: playId
                    width: parent.width
                    height: parent.height
                    source: "images/play.png"
                    opacity: 1
                }
                Image {
                    id: pauseId
                    width: parent.width
                    height: parent.height
                    source: "images/pause.png"
                    opacity: 1
                }
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: (playId.opacity === 1) ? playId.scale = 1.2 : pauseId.scale = 1.2
                    onExited: (playId.opacity === 1) ? playId.scale = 1 : pauseId.scale = 1
                    onClicked: {
                        time++
                        if(time === 3) time = 1
                        showCurrentStatus()
                    }
                }
            }
            Rectangle {
                id: nextTrackId
                width: 30
                height: width
                Image {
                    id: nextIconId
                    anchors.fill: parent
                    source: "images/forward.png"
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: nextIconId.scale = 1.2
                        onExited: nextIconId.scale = 1
                        onClicked: {
                            if(playlist.currentIndex < 8) playlist.currentIndex++
                            playMusic.play()
                            pauseId.opacity = 1
                            playId.opacity = 0
                            diskRotateAniId.resume()
                        }
                    }
                }
            }
        }
    }

    MediaPlayer {
        id: playMusic
        autoPlay: true
        autoLoad: true
        volume: volumnButton.realVolume
        property int minute: (playMusic.position / Math.pow(10, 3)) / 60
        property int second: (playMusic.position / Math.pow(10, 3)) % 60
        property var minuteToShow: (minute < 10) ? "0" + minute : minute
        property var secondToShow: (second < 10) ? "0" + second : second


        property var minuteDurationToShow
        property var secondDurationToShow
        playlist: Playlist {
            id: playlist
            PlaylistItem {source: "musics/track1.mp3"}
            PlaylistItem {source: "musics/track2.mp3"}
            PlaylistItem {source: "musics/track3.mp3"}
            PlaylistItem {source: "musics/track4.mp3"}
            PlaylistItem {source: "musics/track5.mp3"}
            PlaylistItem {source: "musics/track6.mp3"}
            PlaylistItem {source: "musics/track8.mp3"}
            PlaylistItem {source: "musics/track9.mp3"}
        }
        onPositionChanged: {
            sliderId.value = playMusic.position
        }
        onDurationChanged: {
            var duarationMinute = Math.round((duration / Math.pow(10, 3)) / 60)
            var durationSecond = Math.round((duration / Math.pow(10, 3)) % 60)
            minuteDurationToShow = (duarationMinute < 10) ? "0" + duarationMinute : duarationMinute
            secondDurationToShow = (durationSecond < 10) ? "0" + durationSecond : durationSecond
        }
    }
    Component.onCompleted: showCurrentStatus()
    Popup {
        id: volumnPop
        modal: true
        width: 150
        height: width
        x: 120
        y: 30
        Rectangle {
            anchors.fill: parent
            radius: volumnButton.width/2
            color: "lightgrey"
            Dial {
                id: volumnButton
                anchors.fill: parent
                from: 0
                to: 100
                value: 40
                z: 1
                property double realVolume: volumnButton.value / 100
                Text {
                    y: parent.height / 2 - 10
                    text: "Volume"
                    font.pointSize: 15
                    font.bold: true
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Text {
                    y: parent.height / 1.5
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: Math.round(volumnButton.value)
                    font.pointSize: 20
                    font.bold: true
                    color: (text < 70) ? "dodgerblue" : "red"
                }

                onValueChanged: {
                    playMusic.volume = realVolume
                }
            }
        }
    }
}

