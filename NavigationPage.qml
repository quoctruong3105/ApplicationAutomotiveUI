import QtQuick 2.0
import QtPositioning 5.8
import QtLocation 5.9
import QtQuick 2.9

Item {
    id: navigationPage
    anchors.fill: infomationAreaId
    Rectangle {
        anchors.fill: parent
        visible: true
        Plugin {
            id: mapPlugin
            name: "osm" // "mapboxgl", "esri", ...
            // specify plugin parameters if necessary
            // PluginParameter {
            //     name:
            //     value:
            // }
        }

        Map {
            anchors.fill: parent
            plugin: mapPlugin
            center: QtPositioning.coordinate(10.80, 106.64) // Oslo
            zoomLevel: 20
        }
    }
}
