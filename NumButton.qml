import QtQuick 2.0
import QtQuick.Controls 2.4
Rectangle {
    id: button
    property string name : "CalcButton"
    property alias text: textItem.text
    color: "white"
    width: 60
    height: 50
    signal clicked()
    Text{
        id: textItem
        font.pixelSize: 15
        anchors.centerIn: parent
    }
    MouseArea {
            id: mousearea
            anchors.fill: parent
            onPressed: {
                button.color = "#999797"
                window.digitPressed(parent.text)
            }
            onReleased: {
                button.color = "white"
            }
            onClicked: {
                button.clicked()
            }

            hoverEnabled: true
            onHoveredChanged: {
                color = containsMouse ? "#ccc6c6" : "white"
            }
        }

}
