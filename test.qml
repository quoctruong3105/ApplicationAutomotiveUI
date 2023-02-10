import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.4
import QtQuick.Dialogs 1.3

Rectangle {
    id: plateId
    anchors.centerIn: parent
    height: Math.min(root.width, root.height)
    width: height
    radius: width/2
    color: root.color
    border.color: "gold"
    border.width: 4
    Repeater {
        model: 12
        Item {
            id: hourContainer
            property int hour: index
            height: plateId.height/2
            transformOrigin: Item.Bottom
            rotation: index * 30
            x: plateId.width/2
            y: 0
            Rectangle {
                height: plateId.height*0.05
                width: height
                radius: width/2
                color: "black"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 4
            }
        }
    }
    Text {
        anchors {
            horizontalCenter: parent.horizontalCenter
        }
        color: "black"
        x: 0
        y: plateId.height * 0.06
        rotation: 360 - index * 30
        text: hourContainer.hour == 0 ? 12 : hourContainer.hour
        font.pixelSize: plateId.height * 0.1
        font.family: "Comic Sans MS"
    }
}
