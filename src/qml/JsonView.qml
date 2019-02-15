import QtQuick 2.0
import "../js/HandleJson.js" as Test

Item {
    id:root

    anchors.fill: parent
    Component.onCompleted: Test.getInformation()
}
