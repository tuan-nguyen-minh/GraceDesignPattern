//Bad out this solution:
//1: In this solution one can create many instances of class Interface. A
//2: Global variable are evil
//any other solution ?
//def Object. 

var instance := false
class SingleObject is confidential{
    var testAttribute is readable, writable := "Original Attribute"
    method asString is public {
        print "I am a {testAttribute}"
    }
}

class Interface is public {
    
    method getInstance is public {
        if (instance == false) then {
            instance := SingleObject
            print "instance created"
        } else {
            print "instance not created"
        }
        return instance
    }
}
