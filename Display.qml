import QtQuick 2.0

Rectangle {
    id: display
    property alias text: textItem.text
    property bool enteringDigits: false
    property string displayedOperand
    property string errorString: qsTr("ERROR")
    property bool isError: displayedOperand === errorString
    width: 486
    height: 50
    color: "darkgray"

    function appendDigit(digit)
        {
            if(textItem.text != "0" || digit == ".") textItem.text += digit
            else {
                console.log("!!!")
                textItem.text = digit
            }
        }

        function setDigit(digit)
        {
            textItem.text = digit
        }

        function clear()
        {
            textItem.text = "0"
        }

    Text {
        id: textItem
        font.pixelSize: 50
        font.family: "Digital-7"
        anchors.centerIn: parent
    }
}
