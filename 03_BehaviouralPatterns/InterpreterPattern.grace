//Define the grammar for instructions that form part of a language or notation, whilst allowing the grammar to be easily extended.

//Implementation of And- and Or-Expression 
//Put String Contain , and other features 

import "/Users/if0814/Dropbox/01_Master_Studium/04_Semester_NZ/03_Thesis/02_Implementation/list" as list

class ExpressionBase {
    method interpret(context) {}
}
 
class TerminalExpression (_data){
    inherit ExpressionBase
    var data := _data
    var exp1 := ""
    var exp2 := ""

    method interpret (context) {
        parseExpression(context)
        if ((exp1 == data) || (exp2 == data)) then {
            return true
        } else {
            return false
        }
    }

    method parseExpression (string) {
        for (1 .. string.size) do { n:Number ->
            if (string.at(n) == " ") then {
                exp1 := string.substringFrom(1) to (n - 1)
                exp2 := string.substringFrom(n + 1) to (string.size)
                //return true
            }
        }
    }
}
 
class AndExpression (exp1,exp2){
    inherit ExpressionBase
    var expression1 is readable,writable := exp1
    var expression2 is readable,writable := exp2
 
    method interpret(context) {
        return expression1.interpret(context) && expression2.interpret(context)
    }
}

class Client {

    method getMarriedMenExpression {
        var andrew := TerminalExpression ("Andrew")
        var ben := TerminalExpression ("Married")
        return AndExpression(andrew,ben)
    }
}


var client := Client
var isMarriedMale := client.getMarriedMenExpression
var marriedMale := isMarriedMale.interpret ("Married Andrew")
print "{marriedMale}"
    

//print (space)
