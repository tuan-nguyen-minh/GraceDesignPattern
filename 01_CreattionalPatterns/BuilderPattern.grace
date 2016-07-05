//The builder pattern is a design pattern that allows for the step-by-step creation of complex objects using the correct sequence of actions. 
//The construction is controlled by a director object that only needs to know the type of object it is to create.

//This also represents BridgePattern, which separates the abstract elements of a class from its technical implementation

//The program represents burger menu order.
//There are 2 menu choices: The hamburger and happy meal menu


class MenuOrder {
    method makeMenu( menuBuilder) {
        menuBuilder.addMainDish()
        menuBuilder.addSideOrder()
        menuBuilder.addDrink()
        menuBuilder.setPrice()
    }
}
 
 
class MenuBuilder {
    method addMainDish {}
    method addSideOrder {}
    method addDrink {}
    method setPrice {}
    method getMenu {}
}
 
 
class BurgerMenu (_burger){
    inherit MenuBuilder

    var menu is readable := Menu
 
    method addMainDish() is override { menu.mainDish := _burger}
    method addSideOrder() is override {menu.sideOrder := "Fries"}
    method addDrink() is override {menu.drink := "Soft Drink"}
    method setPrice() is override {menu.price := 8 }
    
}
 
 
class HappyMealMenu (_burger) {
    inherit MenuBuilder

    var menu is readable := Menu
 
    method addMainDish() is override { menu.mainDish := _burger}
    method addSideOrder() is override {menu.sideOrder := "Toy"}
    method addDrink() is override {menu.drink := "Cola"}
    method setPrice() is override {menu.price := 5 }
    //method getMenu() is override{ return menu}
}

class Menu {
    var mainDish is readable, writable 
    var sideOrder is readable, writable 
    var drink is readable, writable 
    var price is readable, writable

    method printOrder {
        print "{mainDish} with {sideOrder}, {drink}, {price}"
    } 
}

class Burger (_size) {
    var size := _size
}

class Hamburger (_size, _sauce) {
    inherit Burger (_size)
    var sauce := _sauce

    method asString is override {
        print "Hamburger, {size}, {sauce}"
    }
}

class CheeseBurger (_size, _extraCheese) {
    inherit Burger (_size)
    var extraCheese := _extraCheese

    method asString is override {
        print "CheeseBurger, {size}, {_extraCheese}"
    }
}

var hamburgerMenu := BurgerMenu (Hamburger("medium","ketchup"))
var menuOrder := MenuOrder
menuOrder.makeMenu (hamburgerMenu)
print "{hamburgerMenu.menu.printOrder}"

var happyMealMenu := HappyMealMenu (CheeseBurger("large","yes"))
menuOrder.makeMenu (happyMealMenu)
print "{happyMealMenu.menu.printOrder}"

    