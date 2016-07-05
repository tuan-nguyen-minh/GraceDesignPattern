//TODO: Not completed
//When executed, a lineup returns an object that supports the Iterator interface,
//which includes the methods size, map, do(_), and iterator. Lineups are most
//frequently used to build collections, to control loops, and to pass collections of
//options to methods.

import "/Users/if0814/Dropbox/01_Master_Studium/04_Semester_NZ/03_Thesis/02_Implementation/list" as list

var order := list.with []
order.add ("Hamburger Menu")
order.add ("Cheese Burger Menu")
order.add ("Happy Meal Menu")


class Iterator {
    method hasNext {}
    method next {}
}

class Container {
    method getIterator {}
}

class MenuRepository {
    inherit Container
    var order := list.with []
    order.add ("Hamburger Menu")
    order.add ("Cheese Burger Menu")
    order.add ("Happy Meal Menu")

   
    method getIterator is override {
        return  MenuIterator    
    }

    class MenuIterator is confidential {
        inherit Iterator
        var index := 0 

        method hasNext is override {
            if (index < order.size) then {
                return true
            }
            return false
        }

        method next {
            if (self.hasNext) then {
                index := index + 1
                return order.get(index - 1) 
               
            }
            return false
        }        
    }
}
    
var menuRepository := MenuRepository
var iterator := menuRepository.getIterator

while {iterator.hasNext} do {
    print "{iterator.next}"
}
