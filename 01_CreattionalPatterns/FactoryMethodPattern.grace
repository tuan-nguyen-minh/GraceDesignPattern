//creation of objects without specifying the type of object that is to be created in code. 
//A factory class contains a method that allows determination of the created type at run-time.

//FoodFactory can generate either Western or Asian FoodFactory
//WesternFoodFactory can create either Burger or Sandwich
//AsianFoodFactory can create either BeijingDuck or Sushi

//TODO: Take a look at alias (optional)

class FoodFactory {
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
            return Burger (foodType)
        } elseif {foodType == "sandwich"} then {
            return Sandwich (foodType)
        } else {
            print "We do not have this kind of food"
        }
    }
}

class AsianFoodFactory {
    inherit FoodFactory

    method createFood (foodType) is override {
        if (foodType == "Beijing Duck") then {
            return BeijingDuck (foodType)
        } elseif {foodType == "Sushi"} then {
            return Sushi (foodType)
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
burger.serveFood

var asianFoodFactory := AsianFoodFactory
var sushi := asianFoodFactory.createFood("Sushi")
sushi.serveFood
