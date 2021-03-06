var curVal = 0
var memory = 0
var lastOp = ""
var previousOperator = ""
var digits = "0"
var isCalculated = false

function factorial(num)
{
    if(num < 0) {
        return
    }

    var res = 1
    while(num != 0)
    {
        res *= num
        num--
    }
    return res
}

function disabled(op) {
    if (digits == "" && !((op >= "0" && op <= "9") || op == "."))
        return true
    else if (op == '=' && previousOperator.length < 1)
        return true
    else if (op == "." && digits.toString().search(/\./) != -1) {
        return true
    } else if (op == "√" &&  digits.toString().search(/-/) != -1) {
        return true
    } else {
        return false
    }
}

function digitPressed(op)
{
    if (disabled(op))
    {
        console.log("disabled")
        return
    }
    if (digits.toString().length >= display.maxDigits)
        return
    if(op == "π")
        op = Math.PI
    if (lastOp.toString().length == 1 && ((lastOp >= "0" && lastOp <= "9") || lastOp == ".") ) {
        digits = digits + op.toString()
        if(!isCalculated)
            display.appendDigit(op.toString())
        else display.setDigit(op.toString())
    } else {
        digits = op
        if(!isCalculated)
            display.appendDigit(op.toString())
        else display.setDigit(op.toString())
    }
    lastOp = op
    isCalculated = false
}

function operatorPressed(op)
{
    if (disabled(op))
        return
    lastOp = op

    if (op == "±") {
            digits = Number(digits.valueOf() * -1)
            display.setDigit(digits)
            return
        }

    if (previousOperator == "+") {
        digits = Number(digits.valueOf()) + Number(curVal.valueOf())
    } else if (previousOperator == "-") {
        digits = Number(curVal.valueOf()) - Number(digits.valueOf())
    } else if (previousOperator == "×") {
        digits = Number(curVal) * Number(digits.valueOf())
    } else if (previousOperator == "÷") {
        digits = Number(curVal) / Number(digits.valueOf())
    } else if (previousOperator == "xʸ") {
         digits = Math.pow(Number(curVal), Number(digits.valueOf()))
    }


    if (op == "+" || op == "-" || op == "×" || op == "÷" || op == "xʸ") {
        previousOperator = op
        curVal = digits.valueOf()
        digits = "0"
        display.text = "0"
        return
    }

    if (op == "=") {
        display.setDigit(digits)
        isCalculated = true
        console.log("=")
    }

    curVal = 0
    previousOperator = ""

    if (op == "√") {
        digits = Number(Math.sqrt(digits.valueOf()))
        display.setDigit(digits)
        isCalculated = true
    }

    if (op == ".") {
        if(!digits.toString().search(/./) && !isCalculated)
        {
            digits += "."
            display.appendDigit(op.toString())
            isCalculated = false
            previousOperator = "."
        }
    }

    if (op == "asin") {
        digits = Number(Math.asin(digits.valueOf()))
        display.setDigit(digits)
        isCalculated = true
    }

    if (op == "sin") {
        digits = Number(Math.sin(digits.valueOf()))
        display.setDigit(digits)
        isCalculated = true
    }

    if (op == "exp") {
        digits = Number(Math.exp(digits.valueOf()))
        display.setDigit(digits)
        isCalculated = true
    }

    if (op == "x²") {
        digits = Number(Math.pow(digits.valueOf(), 2))
        display.setDigit(digits)
        isCalculated = true
    }

    if (op == "acos") {
        digits = Number(Math.acos(digits.valueOf()))
        display.setDigit(digits)
        isCalculated = true
    }

    if (op == "cos") {
        digits = Number(Math.cos(digits.valueOf()))
        display.setDigit(digits)
        isCalculated = true
    }

    if (op == "ln") {
        digits = Number(Math.log(digits.valueOf()))
        display.setDigit(digits)
        isCalculated = true
    }

    if (op == "x³") {
        digits = Number(Math.pow(digits.valueOf(), 3))
        display.setDigit(digits)
        isCalculated = true
    }

    if (op == "atan") {
        digits = Number(Math.atan(digits.valueOf()))
        display.setDigit(digits)
        isCalculated = true
    }

    if (op == "tan") {
        digits = Number(Math.tan(digits.valueOf()))
        display.setDigit(digits)
        isCalculated = true
    }

    if (op == "log") {
        digits = Number(Math.log(digits.valueOf())/ Math.log(10))
        display.setDigit(digits)
        isCalculated = true
    }

    if (op == "n!") {
        digits = Number(factorial(digits.valueOf()))
        display.setDigit(digits)
        isCalculated = true
    }

    if (op == "∛x") {
        digits = Number(Math.pow(digits.valueOf(), 1/3))
        display.setDigit(digits)
        isCalculated = true
    }
    if (op == "1/x") {
        digits = Number(1/digits.valueOf())
        display.setDigit(digits)
        isCalculated = true
    }

    // Reset the state on 'C' operator or after
    // an error occurred
    if (op == "C" || display.isError) {
        display.clear()
        curVal = 0
        memory = 0
        lastOp = ""
        digits = "0"
    }
}
