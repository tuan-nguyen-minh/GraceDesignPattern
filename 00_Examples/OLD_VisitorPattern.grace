//The visitor pattern is used to separate a relatively complex set of structured data classes from the functionality that may be performed upon the data that they hold.
//Change the executing of a Element class 

//Exentension from Composite Pattern. Define company's management structure. Contractor cannot have subordinates

import "/Users/if0814/Dropbox/01_Master_Studium/04_Semester_NZ/03_Thesis/02_Implementation/list" as list

class Employee (_name, _department) {
    var name is readable := _name
    var role is readable := _department
    var subordinates is readable := list.with []

    method asString is override {
        "{name}, {role}"
    }

    method executeTask {
        print "{name}, {role} is executing a task"
    }


    method printAll (i){
        var counter := subordinates.size - 1
        for (0 .. counter) do { n:Number ->
            print "{i} {subordinates.get(n)}"
            if (subordinates.get(n).subordinates != false) then {
                subordinates.get(n).printAll(i + 1)
            }
        }
    }
}

class PermanentEmployee (_name, _department) {
    inherit Employee (_name, _department)

    method accept (visitor) {
        print "in accept {_name}"
        visitor.visitPermanentEmployee (self)

        var counter := subordinates.size - 1
        for (0 .. counter) do { n:Number ->
            //if (subordinates.get(n).subordinates != false) then {
            subordinates.get(n).accept(visitor)
            //}
        }
    }

    method addSubordinate (_subordinate) {
        if (subordinates == false) then {
            subordinates := list.with []
        }
        subordinates.add(_subordinate)
    }

    
}

class Contractor (_name, _department) { 
    inherit Employee (_name, _department)

    method printAll {
        print "Should never happen"
    }
    method accept (visitor) {
        visitor.visitContractor (self)
    }

}

class EmployeeVisitor {

    method visitPermanentEmployee (employee) { }
    method visitContractor (employee) { }
}

class PaySalary {
    inherit EmployeeVisitor
    method visitPermanentEmployee (employee) is override {
        print "{employee.name} has got the salary for this month"
    }
    method visitContractor (employee) is override {
        print "{employee.name} has got the contracting rates for this month"
    }
}

var organization is public:= PermanentEmployee ("Grace Enterprise", "Company Name")
var headManager is public:= PermanentEmployee ("Toni", "HeadManager")
var headRD is public := PermanentEmployee ("Florian", "Head Research and Development")
var headSoftwareDevelopment is public := PermanentEmployee ("Harry", "Head Software Development")
var scientist is public := PermanentEmployee ("Fabian", "Scientist in Research and Development")
var contractor is public := Contractor ("Andrew", "Contractor Scientist in Research and Development")
var developer is public := PermanentEmployee ("Ben", "Developer in Software Development")
var tester is public := PermanentEmployee ("Corey", "Tester in Software Development")

organization.addSubordinate(headManager)
headManager.addSubordinate(headRD) 
headManager.addSubordinate(headSoftwareDevelopment)
headSoftwareDevelopment.addSubordinate(developer)
headSoftwareDevelopment.addSubordinate(tester)
headRD.addSubordinate(scientist)
headRD.addSubordinate(contractor)
organization.printAll(0)

//for VisitorPattern
organization.accept(PaySalary)


    