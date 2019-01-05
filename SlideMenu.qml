import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.4

Rectangle {
    width: 180
    height: 700
    color: "gray"
    Rectangle {
        id : rectangle1
        width : 180
        height : 25
        color : bcgdSimple.color
    }

    Rectangle {
        id : rectangle2
        y : parent.y + 26
        width : 180
        height : 25
        color : bcgdScientific.color
    }
    Image {
        y : parent.y + 3
        x : parent.x + 3
        source: "Simple.png"
        width : 20
        height : 20
    }
    Image {
        y : parent.y + 29
        x : parent.x + 3
        source: "Scientific.png"
        width : 20
        height : 20
    }
}
