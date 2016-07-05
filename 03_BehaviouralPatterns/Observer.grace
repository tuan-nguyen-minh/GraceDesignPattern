import "/Users/if0814/Dropbox/01_Master_Studium/04_Semester_NZ/03_Thesis/02_Implementation/list" as list

class FamousPerson {

    var monitors := list.with []
    var action
    
    method attach (_monitor) {
        monitors.add (_monitor)
    }

    method setAction (_action) {
        action := _action
        notify
    }

    method getAction {
        return action
    }
  
    method notify {
        for (monitors) do { _monitor ->
            _monitor.update (self)
        }   
    }
}

class FamousActor (_name) {
    inherit FamousPerson
    var name is readable := _name
}

class FamousPersonMonitor {
    method update (_famousPerson) {}
}
 
 
class Newspaper {
    inherit FamousPersonMonitor
    
    print "Create Newspaper"
    
    method update (_famousPerson) is override {
        print "Headline: {_famousPerson.name} {_famousPerson.getAction}"
    }
}
   
 
class Tabloid {
    inherit FamousPersonMonitor
    
    print "Create Tabloid"

    method update (_famousPerson) is override {
        print "Headline: Oh my God. {_famousPerson.name} {_famousPerson.getAction}"
    }
}

var emma := FamousActor ("Emma")
var cnn := Newspaper 
var theSun := Tabloid 

emma.attach (cnn)
emma.attach (theSun)

emma.setAction ("Takes part in a new movie")


