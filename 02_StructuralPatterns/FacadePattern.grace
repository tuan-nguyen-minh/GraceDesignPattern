//The facade pattern is a design pattern that is used to simplify access to functionality in complex or poorly designed subsystems. 
//The facade class provides a simple, single-class interface that hides the implementation details of the underlying code.

//Using the features from PrototypePattern. The programm will clone either CheeseBurger or Hamburger in run-time enviroment.
//BurgerFacade is the Facade class. 

import "/Users/if0814/Dropbox/01_Master_Studium/04_Semester_NZ/03_Thesis/02_Implementation/01_CreattionalPatterns/PrototypePattern" as prototypePattern

class BurgerFacade (_burger) {
    var burger := _burger

    method cloneBurger {
        burger.clone
    }
}

var cheeseBurger := prototypePattern.CheeseBurger ("CheeseBurger", "Very spicy", "Medium", true, false)
print (cheeseBurger)
var burgerFacade := BurgerFacade (cheeseBurger)
var cloneCheeseBurger := burgerFacade.cloneBurger

cloneCheeseBurger.extraCheese := true
print (cheeseBurger)
print (cloneCheeseBurger)
