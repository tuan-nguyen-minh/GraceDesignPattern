//The strategy pattern is used to create an interchangeable family of algorithms from which the required process is chosen at run-time.

//The Calculator has to features: add and subtract 2 numbers 

//Interface Calculator is redundant. The code works with no type Calculator. Both codes works (Which shouldn´t be the case)

type Calculator = {
    executeOperation (num1:Number, num2:Number) -> done 
}

class OperationAdd {
    print "OperationAdd added"
    method executeOperation(num1, num2) {
      return num1 + num2
   }
}

class OperationSubstract {

    method executeOperation(num1, num2) {
      return num1 - num2
   }
}

class Client (_strategy) {
    var strategy := _strategy
    print "Client created"
    method executeCalculator (num1, num2) {
      return strategy.executeOperation(num1, num2)
    }
}

var operationAdd:Calculator := OperationAdd
var operationSubtract:Calculator := OperationSubstract

var context := Client(operationAdd)
var result := context.executeCalculator (20,10)
print "20 + 10 = {result}"

context := Client (operationSubtract)
result := context.executeCalculator (20,10)
print "20 - 10 = {result}"


// class Calculator {
//     method executeOperation (num1, num2) is required {}
// }

// class OperationAdd {
//     inherit Calculator
//     print "OperationAdd added"
//     method executeOperation(num1, num2) {
//         return num1 + num2
//     }
// }

// class OperationSubstract {
//     inherit Calculator
//     method executeOperation(num1, num2) {
//         return num1 - num2
//    }
// }

// class Client (_strategy) {
//     var strategy := _strategy
//     print "Client created"
//     method executeCalculator (num1, num2) {
//         return strategy.executeOperation(num1, num2)
//     }
// }

// var operationAdd := OperationAdd
// var operationSubtract := OperationSubstract

// var context := Client(operationAdd)
// var result := context.executeCalculator (20,10)
// print "20 + 10 = {result}"

// context := Client (operationSubtract)
// result := context.executeCalculator (20,10)
// print "20 - 10 = {result}"