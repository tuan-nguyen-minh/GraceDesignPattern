//Add additional features to an object dynamically. 
//Usage: When we dont want to add features to class, but only to object.

//Add the feature executeTask for all employee. Set new attribute isBusy := true after executing method 

//Why does DecoratorEmployee have to inherit from Employee ? 

import "/Users/if0814/Dropbox/01_Master_Studium/04_Semester_NZ/03_Thesis/02_Implementation/list" as list
import "CompositePattern" as CompositeEmployeePackage

class DecoratorEmployee (_employee) {
    // inherit CompositeEmployeePackage.Employee (_name, _role)
    inherit CompositeEmployeePackage.Employee (_employee.name, _employee.role)

    var decoratorEmployee is readable := _employee

    method executeTask {
        decoratorEmployee.executeTask
    }

}

class DecoratedTask (_employee) {
    inherit DecoratorEmployee  (_employee)
      alias executeTaskEmployee = executeTask
    var isBusy := false

    method executeTask is override {
        executeTaskEmployee
        print "{name} is busy"
        isBusy := true 
    }
}

var decoratedCEO := DecoratedTask (CompositeEmployeePackage.headManager)
decoratedCEO.executeTask


// var decoratedCEO := DecoratedTask (CompositeEmployeePackage.CEO)
// decoratedCEO.decoratorEmployee.executeTask

// class DecoratorEmployee (_employee) {

//     var decoratorEmployee is readable := _employee

//     method executeTask {
//         decoratorEmployee.executeTask
//     }

// }

// class DecoratedTask (_employee) {
//     inherit DecoratorEmployee  (_employee)
//       alias executeTaskEmployee = executeTask
//     var isBusy := false

//     method executeTask is override {
//         executeTaskEmployee
//         print "{name} is busy"
//         isBusy := true 
//     }
// }

