//separates a set of structured data from the functionality that may be performed upon it. 
//This promotes loose coupling and enables additional operations to be added without modifying the data classes.

//Extension of Composite Pattern. Adding PrintAllEmployees and PaySalary features.

import "/Users/if0814/Dropbox/01_Master_Studium/04_Semester_NZ/03_Thesis/02_Implementation/list" as list

class Employee (_name, _role) {
    var name is readable := _name
    var role is readable := _role

    method asString is override {
        "{name}, {role}"
    }

    method executeTask {
        print "{name}, {role} is executing a task"
    }

}

class PermanentEmployee (_name, _department) {
    inherit Employee (_name, _department)
    def subordinates = list.with []
    method addSubordinate (_subordinate) {
        subordinates.add(_subordinate)
    }

    method accept (visitor) {
        visitor.visitPermanentEmployee (self)
        var counter := subordinates.size - 1
        for (0 .. counter) do { n:Number ->
            subordinates.get(n).accept(visitor)
        }
    }
}

//Contractor cannot have any subordinates
class Contractor (_name, _department) { 
    inherit Employee (_name, _department)

    method accept (visitor) {
        visitor.visitContractor (self)
    }
}

//Base class for visitors of Employee class 
class EmployeeVisitor {
    method visitPermanentEmployee (employee) { }
    method visitContractor (employee) { }
}

//Visitor 1: pay salary to all employees
class PaySalary {
    inherit EmployeeVisitor
    method visitPermanentEmployee (employee) is override {
        print "{employee.name} has got the salary for this month"
    }
    method visitContractor (employee) is override {
        print "{employee.name} has got the contracting rates for this month"
    }
}

//Visitor 2: print all employees
class PrintAllEmployees {
    inherit EmployeeVisitor
    method visitPermanentEmployee (employee) is override {
        print "{employee}"
    }
    method visitContractor (employee) is override {
        print "Contractor {employee}" 
    }
}

var headManager is public:= PermanentEmployee ("Toni", "HeadManager")
var headRD is public := PermanentEmployee ("Florian", "Head Research and Development")
var headSoftwareDevelopment is public := PermanentEmployee ("Harry", "Head Software Development")
var scientist is public := PermanentEmployee ("Fabian", "Scientist in Research and Development")
var contractor is public := Contractor ("Andrew", "Scientist in Research and Development")
var developer is public := PermanentEmployee ("Ben", "Developer in Software Development")
var tester is public := PermanentEmployee ("Corey", "Tester in Software Development")

headManager.addSubordinate(headRD) 
headManager.addSubordinate(headSoftwareDevelopment)
headSoftwareDevelopment.addSubordinate(developer)
headSoftwareDevelopment.addSubordinate(tester)
headRD.addSubordinate(scientist)
headRD.addSubordinate(contractor)

headManager.accept(PaySalary)
headManager.accept(PrintAllEmployees)



    