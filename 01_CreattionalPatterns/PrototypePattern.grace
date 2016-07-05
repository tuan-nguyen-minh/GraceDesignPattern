//Instantiate a new object by copying all of the properties of an existing object, creating an independent clone
//Comment: In generall, that pattern is useful when the construction of a brand new object, using the new operator, is inefficient.
//in our implementation, we create new object on method clone(), which is not really efficient according to the motivation. 

//Clone a Burger with "copy by value"


class Burger (_typeOfburger,_levelofSpiciness,_size,_friesIncluded) {
    method clone {}
 
    var typeOfburger is readable, writable := _typeOfburger
    var levelofSpiciness is readable, writable := _levelofSpiciness
    var size is readable, writable := _size
    var friesIncluded is readable, writable := _friesIncluded
}
 
 
class CheeseBurger (_typeOfburger,_levelofSpiciness,_size,_friesIncluded, _extraCheese) {
    inherit Burger (_typeOfburger,_levelofSpiciness,_size,_friesIncluded)
    
    var extraCheese is readable, writable := _extraCheese
 
    method clone is override {
        var cloneCheeseBurger := CheeseBurger (_typeOfburger,_levelofSpiciness,_size,_friesIncluded, _extraCheese) 
        return cloneCheeseBurger
    }

    method asString is override {
        print "{typeOfburger}, {levelofSpiciness}, {size}, {friesIncluded}, {extraCheese}" 
    }
}
 
 
class Hamburger (_typeOfburger,_levelofSpiciness,_size,_friesIncluded, _sauce) {
    inherit Burger (_typeOfburger,_levelofSpiciness,_size,_friesIncluded)

    var sauce is readable, writable := _sauce
 
    method clone is override {
        var cloneHamburger := Hamburger (_typeOfburger,_levelofSpiciness,_size,_friesIncluded, _sauce) 
        return cloneHamburger
    }

    method asString is override {
        print "{typeOfburger}, {levelofSpiciness}, {size}, {friesIncluded}, {sauce}" 
    }
}

var CheeseBurger := CheeseBurger ("CheeseBurger", "Very spicy", "Medium", true, false)
print (CheeseBurger)

var CheeseBurgerClone := CheeseBurger.clone
CheeseBurgerClone.extraCheese := true
print (CheeseBurgerClone)
print (CheeseBurger)
