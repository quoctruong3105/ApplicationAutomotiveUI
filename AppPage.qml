import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Item {
    id: appPage
    anchors.fill: infomationAreaId
    ScrollView {
        anchors.fill: parent
        Rectangle {
            id: rectContainId
            anchors.fill: parent
            color: "white"
            z: 5
            GridView {
                id: listViewApp
                model: listAppId
                delegate: delegateId
                width: col1.width - 100
                height: parent.height
                cellWidth: 100; cellHeight: 100

            }
        }
        ListModel {
            id: listAppId
            ListElement{ image: "apps/amazon-pay.png"}
            ListElement{ image: "apps/facebook.png"}
            ListElement{ image: "apps/gmail.png"}
            ListElement{ image: "apps/google.png"}
            ListElement{ image: "apps/google-maps.png"}
            ListElement{ image: "apps/google-play.png"}
            ListElement{ image: "apps/instagram.png"}
            ListElement{ image: "apps/youtube.png"}
        }
        Component {
            id: delegateId
            Rectangle {
                width: 70
                height: 70
                radius: 10
                color: "lightgray"
                Image {
                    id: appIconId
                    width: parent.width - parent.width / 4
                    height: width
                    anchors.centerIn: parent
                    source: image
                }
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: appIconId.scale = 1.2
                    onExited: appIconId.scale = 1
                }
            }
        }
    }
}
