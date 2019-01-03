import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.4
import "calculator.js" as CalcEngine

ApplicationWindow {
    id: window
    color: "gray"
    opacity: 0.95
    visible: true
    width: 486
    height: 344
    title: qsTr("Calculator")

    function operatorPressed(operator)
    {
            CalcEngine.operatorPressed(operator)
            //numPad.buttonPressed()
    }
    function digitPressed(digit)
    {
            CalcEngine.digitPressed(digit)
            //numPad.buttonPressed()
    }
    function isButtonDisabled(op)
    {
            return CalcEngine.disabled(op)
    }
    function needOpacity(curOpacity){
        if (curOpacity == 1)
            return 0
        else
            return 1
    }

    Button {
        id: simpleBttn
        font{
            pixelSize : 15
        }
        width: 120
        height: 25
        text: "Обычный"
        onClicked: {
            if(simpleCalc.x != 0)
            {
                simpleCalc.x = 0;
                scientificCalc.x=-488
                animateOpacity1.start()
                animateOpacity2.start()
                simpleBttn.font.pixelSize = 15
                scientificBttn.font.pixelSize = 10
            }

        }
    }
    Button {
        id: scientificBttn
        font{
            pixelSize : 10
        }
        x : 123
        width: 120
        height: 25
        text: "Инженерный"
        onClicked: {
            if(scientificCalc.x != 0)
            {
                scientificCalc.x = 0;
                simpleCalc.x=486
                animateOpacity1.start()
                animateOpacity2.start()
                scientificBttn.font.pixelSize = 15
                simpleBttn.font.pixelSize = 10
            }
        }
    }

    Display {
        id : display
        y : 30
        text: "0" }
    Grid {
        id: simpleCalc
        Behavior on x {
            SpringAnimation{
                spring: 2
                damping: 0.3
            }
        }
        PropertyAnimation {id: animateOpacity1; target: simpleCalc; properties: "opacity"; to: needOpacity(simpleCalc.opacity); duration: 400}
        visible: true
        y: 85
        rows: 5
        columns : 4
        spacing: 1
        NumButton {
            text: "7"
            width : 120
        }
        NumButton {
            text: "8"
            width : 120
        }
        NumButton {
            text: "9"
            width : 120
        }
        CalcButton {
            text: "×"
            width : 120
        }
        NumButton {
            text: "4"
            width : 120
        }
        NumButton {
            text: "5"
            width : 120
        }
        NumButton {
            text: "6"
            width : 120
        }
        CalcButton {
            text: "-"
            width : 120
        }
        NumButton {
            text: "1"
            width : 120
        }
        NumButton {
            text: "2"
            width : 120
        }
        NumButton {
            text: "3"
            width : 120
        }
        CalcButton {
            text: "+"
            width : 120
        }
        CalcButton {
            text: "±"
            width : 120
        }
        NumButton {
            text: "0"
            width : 120
        }
        CalcButton {
            text: "."
            width : 120
        }
        CalcButton {
            text: "√"
            width : 120
        }
        CalcButton {
            text: "÷"
            width : 120
        }
        CalcButton {
            text: "C"
            width : 120
        }
        CalcButton {
            text: "="
            width : 120
        }
    }
    Grid {
        id: scientificCalc
        Behavior on x {
            SpringAnimation{
                spring: 2
                damping: 0.3
            }
        }
        PropertyAnimation {id: animateOpacity2; target: scientificCalc; properties: "opacity"; to: needOpacity(scientificCalc.opacity); duration: 400}
        opacity: 0
        visible: true
        x: -488
        y: 85
        rows: 5
        columns : 8
        spacing: 1
        CalcButton {
            text: "asin"
        }
        CalcButton {
            text: "sin"
        }
        CalcButton {
            text: "exp"
        }
        CalcButton {
            text: "x²"
        }
        NumButton {
            text: "7"
        }
        NumButton {
            text: "8"
        }
        NumButton {
            text: "9"
        }
        CalcButton {
            text: "×"
        }
        CalcButton {
            text: "acos"
        }
        CalcButton {
            text: "cos"
        }
        CalcButton {
            text: "ln"
        }
        CalcButton {
            text: "x³"
        }
        NumButton {
            text: "4"
        }
        NumButton {
            text: "5"
        }
        NumButton {
            text: "6"
        }
        CalcButton {
            text: "-"
        }
        CalcButton {
            text: "atan"
        }
        CalcButton {
            text: "tan"
        }
        CalcButton {
            text: "log"
        }
        CalcButton {
            text: "xʸ"
        }
        NumButton {
            text: "1"
        }
        NumButton {
            text: "2"
        }
        NumButton {
            text: "3"
        }
        CalcButton {
            text: "+"
        }
        CalcButton {
            text: "n!"
        }
        NumButton {
            text: "π"
        }
        CalcButton {
            text: "∛x"
        }
        CalcButton {
            text: "1/x"
        }
        CalcButton {
            text: "±"
        }
        NumButton {
            text: "0"
        }
        CalcButton {
            text: "."
        }
        CalcButton {
            text: "√"
        }
        CalcButton {
            opacity: 0
            enabled: false
        }
        CalcButton {
            opacity: 0
            enabled: false
        }
        CalcButton {
            opacity: 0
            enabled: false
        }
        CalcButton {
            opacity: 0
            enabled: false
        }
        CalcButton {
            text: "÷"
        }
        CalcButton {
            text: "C"
        }
        CalcButton {
            text: "="
        }
    }
}
