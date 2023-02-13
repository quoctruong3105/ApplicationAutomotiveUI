import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.4
import QtMultimedia 5.9

Item {
    id: cameraPage
    anchors.fill: infomationAreaId
    property bool cameraOn: false

    Rectangle {
        width: 50
        height: 50
        radius: 5
        anchors.horizontalCenter: parent.horizontalCenter
        y: 15
        Image {
            id: cameraOn
            anchors.fill: parent
            source: "images/cameraOn.png"
            opacity: 0
        }
        Image {
            id: cameraOff
            anchors.fill: parent
            source: "images/videoOff.png"
            opacity: 1
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                cameraPage.cameraOn = !cameraPage.cameraOn
                if(cameraPage.cameraOn) {
                    cameraOn.opacity = 1
                    cameraOff.opacity = 0
                    behindCamera.visible = true
                } else {
                    cameraOn.opacity = 0
                    cameraOff.opacity = 1
                    behindCamera.visible = false
                }
            }
        }
    }

    Camera {
        id: camera

        imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceFlash

        exposure {
            exposureCompensation: -1.0
            exposureMode: Camera.ExposurePortrait
        }

        flash.mode: Camera.FlashRedEyeReduction

        imageCapture {
            onImageCaptured: {
                photoPreview.source = preview  // Show the preview in an Image
            }
        }

    }
    VideoOutput {
        id: behindCamera
        source: camera
        anchors.fill: parent
        focus: visible
        visible: false
    }
}
