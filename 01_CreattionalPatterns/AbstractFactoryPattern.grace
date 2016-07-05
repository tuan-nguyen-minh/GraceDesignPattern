//creation of groups of related objects without the requirement of specifying the exact concrete classes that will be used. 
//One of a number of factory classes generates the object sets.

//look for the class diagram in Signavio for more information

class DeliveryService (factory, _nameOfProduct, _materialForPackaging) {
    var nameOfProduct := _nameOfProduct
    var packaging is readable,writeable := factory.createPackaging (_materialForPackaging)
    var deliveryCost is readable,writeable := factory.createDeliveryCost 
    print "{_nameOfProduct} ready to be processed" 
}
 
 
class DeliveryFactory {
    method createPackaging  (_materialForPackaging) {}
    method createDeliveryCost {}
}
 
 
class StandardDeliveryFactory {
    inherit DeliveryFactory

    method createPackaging  (_materialForPackaging) is override {
        return StandardPackaging (_materialForPackaging)
    }
 
    method createDeliveryCost is override {
        return StandardCost
    }
}

class FragileDeliveryFactory  {
    inherit DeliveryFactory

    method createPackaging (_materialForPackaging) is override {
        return FragilePackaging (_materialForPackaging)
    }
 
    method createDeliveryCost is override {
        return FragileCost
    }
}

 
class Packaging (_materialForPackaging) {
    var materialForPackaging := _materialForPackaging
    method packageProduct {
        print "{materialForPackaging} is used to for this packaging process"
    }
}
 
class StandardPackaging (_materialForPackaging) { 
    inherit Packaging (_materialForPackaging)
      alias packageStandardProduct = packageProduct

    method packageProduct is override {
        packageStandardProduct
        print "StandardPackaging created"
    }
}
 
class FragilePackaging (_materialForPackaging) { 
    inherit Packaging (_materialForPackaging)
      alias packageFragileProduct = packageProduct
    
    method packageProduct is override {
        packageFragileProduct
        print "FragilePackaging created"
    }
}

class DeliveryCost { 
    var cost := 10

    method calculateDeliveryCost {
        print "The cost for this delivery is {cost} Euro"
    }

}
    
class StandardCost {
    inherit DeliveryCost
      alias calculateCost = calculateDeliveryCost

    method calculateDeliveryCost is override {
        calculateCost
        return cost
    }
}
 
class FragileCost {
    inherit DeliveryCost
      alias calculateCost = calculateDeliveryCost

    method calculateDeliveryCost is override {
        cost := cost + 10
        calculateCost
        return cost 
    }
}

var standardDeliveryFactory :=  StandardDeliveryFactory
var standardDeliveryService := DeliveryService (standardDeliveryFactory, "Iphone 10", "standard box")
standardDeliveryService.packaging.packageProduct
standardDeliveryService.deliveryCost.calculateDeliveryCost

var fragileDeliveryFactory :=  FragileDeliveryFactory
var fragileDeliveryService := DeliveryService (fragileDeliveryFactory, "Samsung Universe 7", "special box")
fragileDeliveryService.packaging.packageProduct
fragileDeliveryService.deliveryCost.calculateDeliveryCost
