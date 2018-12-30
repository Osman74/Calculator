import QtQuick 2.0
import QtQuick.Controls 2.4
Rectangle {
    id: button
    property string name : "CalcButton"
    property alias text: textItem.text
    color: "lightgray"
    width: 60
    height: 50
    signal clicked()
    Text{
        id: textItem
        font.pixelSize: 15
        color: "#095eb3"
        anchors.centerIn: parent
    }
    MouseArea {
            id: mousearea
            anchors.fill: parent
            onPressed: {
                button.color = "#999797"
                window.operatorPressed(parent.text)
            }
            onReleased: {
                button.color = "lightgray"
            }
            onClicked: {
                button.clicked()
            }
            hoverEnabled: true
            onHoveredChanged: {
                color = containsMouse ? "#ccc6c6" : "lightgray"
            }
        }

}
