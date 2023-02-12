import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Item {
    id: appPage
    //anchors.fill: infomationAreaId
    ScrollView {
        Rectangle {
            anchors.fill: infomationAreaId
            color: "black"
            clip: true
            ListView {
                id: listViewApp
                model: listAppId
                anchors.fill: parent
                delegate: Grid {
                    columns: 3
                    Rectangle {
                        width: 50
                        height: 50
                        radius: 4
                        Image {
                            anchors.fill: parent
                            source: image
                        }
                    }
                }
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
    }
}
