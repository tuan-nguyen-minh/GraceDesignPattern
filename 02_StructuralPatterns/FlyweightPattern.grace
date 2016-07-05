//Minimise resource usage when working with very large numbers of objects. 
//Factory avoid creating similar objects.

//Extension of Factory Method Pattern
//FoodFactory can generate either Western or Asian FoodFactory
//WesternFoodFactory can create either Burger or Sandwich
//AsianFoodFactory can create either BeijingDuck or Sushi


class FoodFactory {
    var burgerObject := false
    var sandwichObject := false
    var sushiObject := false
    var beijingDuckObject := false
    method createFood(foodType) {
        print "Factory is generating {foodType}"
    }
}
 
class WesternFoodFactory {
    inherit FoodFactory
      // alias createWesternFood (foodType) = createFood (foodType)

    method createFood (foodType) is override {
        // createWesternFood (foodType)
        if (foodType == "burger") then {
            if (burgerObject == false) then { 
                burgerObject := Burger (foodType)
            } else {
                //do nothing 
            return burgerObject
        } elseif {foodType == "sandwich"} then {
            if (sandwichObject == false) then { 
                sandwichObject := Sandwich (foodType)
            } else {
                //do nothing 
            }
            return sandwichObject
        } else {
            print "We do not have this kind of food"
        }
    }
}

class AsianFoodFactory {
    inherit FoodFactory

    method createFood (foodType) is override {
        if (foodType == "Beijing Duck") then {
            if (beijingDuckObject == false) then { 
                beijingDuckObject := BeijingDuck (foodType)
            } else {
                //do nothing
            }
            return beijingDuckObject
        } elseif {foodType == "Sushi"} then {
            if (sushiObject == false) then { 
                sushiObject := Sushi (foodType)
            } else {
                //do nothing
            }
            return sushiObject
        } else {
            print "We do not have this kind of food"
        }
    }
}
     
 
class Food (_foodType) {
    var foodType := _foodType
    print "{foodType} created"

    method serveFood {}
}
 
class Burger (_foodType) { 
    inherit Food (_foodType)
    method serveFood {
        print "Its {foodType}, so bring fork and knife"   
    }
}
 
class Sandwich (_foodType) { 
    inherit Food (_foodType)
    method serveFood {
        print "Its {foodType}, so bring fork and knife"   
    }

}
 
class BeijingDuck (_foodType) { 
    inherit Food (_foodType)
    method serveFood {
        print "Its {foodType}, so bring the additional rice and chopstick to the table"
    }

}
 
class Sushi (_foodType) { 
    inherit Food (_foodType)
    method serveFood {
        print "Its {foodType}, so bring Wasabi and ginger to the table"
    }

}

var westernFoodFactory := WesternFoodFactory
var burger := westernFoodFactory.createFood("burger")
var burger2 := westernFoodFactory.createFood("burger")
burger.serveFood

var asianFoodFactory := AsianFoodFactory
var sushi := asianFoodFactory.createFood("Sushi")
var sushi2 := asianFoodFactory.createFood("Sushi")
sushi.serveFood
