//Creating hierarchical object models. The pattern defines a manner in which to design recursive tree structures of objects

//Define company's management structure. Contractor cannot have subordinates

import "/Users/if0814/Dropbox/01_Master_Studium/04_Semester_NZ/03_Thesis/02_Implementation/list" as list

class Employee (_name, _department) {
    var name is readable := _name
    var role is readable := _department
    //var subordinates is readable := false

    method asString is override {
        "{name}, {role}"
    }

    method executeTask {
        print "{name}, {role} is executing a task"
    }

    method printAll {
        //print "test {self}"
    }

}

class PermanentEmployee (_name, _department) {
    inherit Employee (_name, _department)
    def subordinates = list.with []
    method addSubordinate (_subordinate) {
        //if (subordinates == false) then {
        //subordinates := list.with []
        //}
        subordinates.add(_subordinate)
    }

    method printAllEmployees {
        print "{self}"
        printAll
    }

    method printAll is override {
        var counter := subordinates.size - 1
        for (0 .. counter) do { n:Number ->
            print "{subordinates.get(n)}"
            // if (subordinates.get(n).subordinates != false) then {
            subordinates.get(n).printAll
            // }
        }
    }
}

//Contractor cannot have any subordinates
class Contractor (_name, _department) { 
    inherit Employee (_name, _department)
}

var headManager is public:= PermanentEmployee ("Toni", "HeadManager")
var headRD is public := PermanentEmployee ("Florian", "Head Research and Development")
var headSoftwareDevelopment is public := PermanentEmployee ("Harry", "Head Software Development")
var scientist is public := PermanentEmployee ("Fabian", "Scientist in Research and Development")
var contractor is public := Contractor ("Andrew", "Contractor Scientist in Research and Development")
var developer is public := PermanentEmployee ("Ben", "Developer in Software Development")
var tester is public := PermanentEmployee ("Corey", "Tester in Software Development")

headManager.addSubordinate(headRD) 
headManager.addSubordinate(headSoftwareDevelopment)
headSoftwareDevelopment.addSubordinate(developer)
headSoftwareDevelopment.addSubordinate(tester)
headRD.addSubordinate(scientist)
headRD.addSubordinate(contractor)
headManager.printAllEmployees




    