//The memento pattern is used to capture the current state of an object and store it 
//in such a manner that it can be restored at a later time without breaking the rules of encapsulation.
//Modify Memento to store only neccessary information from Machine.
//set the software version of machine back to the last state 

class Machine (_id, _version) {
    var id is readable,writable := _id
    var version is readable,writable := _version
 
    method createUndo -> Memento {
        //var memento := Memento
        return Memento (id, version)
    }
 
    method restoreFromUndo (memento) {
        version := memento.version
    }
 
    method logMachine {
        print "MachineID: {id}. Version: {version}."
    }
}

class Memento (_id, _version) {
    var id is readable := _id
    var version is readable := _version
}
 
 
class Caretaker {
    var memento is readable,writable
}

// Initialise Machine
var machine := Machine("12","1.0");
machine.logMachine

// Set undo point
var history := Caretaker
history.memento := machine.createUndo
 
// Modify Version of Machine
machine.version := "2.0"
machine.logMachine
 
// Undo
machine.restoreFromUndo(history.memento)
machine.logMachine

