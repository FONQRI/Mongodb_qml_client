function dumpJSONObject(jsonObject, indent) {

    var ind = new Array(indent * 2).join(' ')

    for (var key in jsonObject) {

        if (typeof (jsonObject[key]) == 'object') {

            console.log(ind + key + ": ")
            dumpJSONObject(jsonObject[key], indent + 1)
        } else {

            console.log(ind + key + ": " + jsonObject[key])
        }
    }
}

var component
var sprite

function createSpriteObjects(parent) {
    component = Qt.createComponent("../qml/testRect.qml")
    if (component.status == Component.Ready)
        finishCreation()
    else
        component.statusChanged.connect(finishCreation)
}

function finishCreation() {
    if (component.status == Component.Ready) {
        sprite = component.createObject(parent, {
                                            "x": 100,
                                            "y": 100
                                        })
        if (sprite == null) {
            // Error Handling
            console.log("Error creating object")
        }
    } else if (component.status == Component.Error) {
        // Error Handling
        console.log("Error loading component:", component.errorString())
    }
}

function getInformation(parent) {
    createSpriteObjects(parent)
    var req = new XMLHttpRequest
    var httpString = "https://api.upcitemdb.com/prod/trial/lookup?upc="
    httpString += "042100005264"
    req.open("GET", httpString)
    req.onreadystatechange = function () {
        var status = req.readyState
        if (status === XMLHttpRequest.DONE) {
            var objectArray = JSON.parse(req.responseText)
            if (objectArray.errors !== undefined)
                console.log("Error fetching barcode: " + objectArray.errors[0].message)
            else {

                dumpJSONObject(objectArray, 0) //here
            }
        }
    }

    req.send()
}
