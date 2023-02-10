import QtQuick 2.0

Rectangle {
    id: buttonId
    width: 50
    height: 50
    border.color: "black"
    border.width: 3
    property alias source: imageId.source
    property alias  button: buttonId
    property alias area: areaId
    Image {
        id: imageId
        anchors.fill: parent
        anchors.margins: 2
    }
    MouseArea {
        id: areaId
    }
}
