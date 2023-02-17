import QtQuick 2.0
import QtPositioning 5.0
import QtLocation 5.11
import QtQuick 2.9

Item {
    id: navigationPage
    anchors.fill: infomationAreaId
    Rectangle {
        anchors.fill: infomationAreaId
        visible: true
        Plugin {
            id: mapPlugin
            name: "osm"
        }
        Map {
            anchors.fill: parent
            plugin: mapPlugin
            center: QtPositioning.coordinate(10.80, 106.64)
            zoomLevel: 15
        }
    }
}
