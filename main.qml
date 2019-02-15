import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4
import "src/qml/"

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    JsonView {
    }

    //    Rectangle {
    //        width: 400
    //        height: 200

    //        ListModel {
    //            id: cityModel
    //            ListElement {
    //                name: "Static Sunny City"
    //                temp: 31.95
    //                attributes: [
    //                    ListElement {
    //                        description: "Tropical"
    //                    },
    //                    ListElement {
    //                        description: "Cloudless"
    //                    }
    //                ]
    //            }
    //        }

    //        Component {
    //            id: cityDelegate
    //            Row {
    //                spacing: 10
    //                Text {
    //                    text: name
    //                }
    //                Text {
    //                    text: temp + "°C"
    //                }
    //            }
    //        }

    //        //            ListView {
    //        //                anchors.fill: parent
    //        //                model: cityModel
    //        //                delegate: cityDelegate
    //        //            }
    //        TreeView {
    //            anchors.fill: parent
    //            TableViewColumn {
    //                title: "Name"
    //                role: "temp"
    //                width: 300
    //            }
    //            TableViewColumn {
    //                title: "Permissions"
    //                role: "name"
    //                width: 100
    //            }
    //            model: cityModel
    //        }

    //        Component.onCompleted: {
    //            cityModel.append({
    //                                 "name": "Append Cold City",
    //                                 "temp": 5.95
    //                             })
    //            getCityJSON()
    //        }

    //        function getCityJSON() {
    //            var request = new XMLHttpRequest()
    //            request.open('GET',
    //                         'http://api.openweathermap.org/data/2.5/weather?q=London&units=metric&appid=44db6a862fba0b067b1930da0d769e98',
    //                         true)
    //            request.onreadystatechange = function () {
    //                if (request.readyState === XMLHttpRequest.DONE) {
    //                    if (request.status && request.status === 200) {
    //                        console.log("response", request.responseText)
    //                        //                        var result = JSON.parse(request.responseText)
    //                        var result = JSON.parse("{\"name\":45}")
    //                        console.log(result.toString())
    //                        cityModel.append({
    //                                             "name": result.name + " " + Date(
    //                                                         result.dt * 1000),
    //                                             "temp": result.main.temp
    //                                         })
    //                    } else {
    //                        console.log("HTTP:", request.status, request.statusText)
    //                    }
    //                }
    //            }
    //            request.send()
    //        }
    //    }
}
