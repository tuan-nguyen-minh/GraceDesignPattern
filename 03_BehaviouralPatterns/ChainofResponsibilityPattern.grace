//The chain of responsibility pattern is a design pattern that defines a linked list of handlers, each of which is able to process requests. 
//When a request is submitted to the chain, it is passed to the first handler in the list that is able to process it.

//This is a Coin Machine which only accept 50 cent and 1 Euro coins 
//It calls 50 cent handler first. If the coin is not a 50 cent coin, it calls the 1 Euro handler
class Coin (_weight, _diameter) {
    var weight is readable, writable := _weight
    var diameter is readable, writable := _diameter
}

class CoinHandlerBase {
    var _successor is readable, writable 
 
    method handleCoin (coin:Coin) is abstract {} 

    method setSuccessor(successor) {
        _successor := successor
        _successor._successor := false
    }
}

class FiftyCentHandler {
    inherit CoinHandlerBase

    method handleCoin (coin) is override {
        if ((coin.weight == 20) && (coin.diameter == 0.15)) then {
            print "50 cent recieved"
        } elseif {_successor != false} then {
            _successor.handleCoin(coin)
        } else {
            print "Cannot handle this coin"
        }
    }
}
 
 
class OneEuroHandler {
    inherit CoinHandlerBase
    method handleCoin(coin) is override {
        if ((coin.weight == 30) && (coin.diameter == 0.2)) then {
            print "1 Euro recieved"
        } elseif {_successor != false} then {
            _successor.handleCoin(coin)
        } else {
            print "Cannot handle this coin"
        }
    }
}

var h50 := FiftyCentHandler
var h100 := OneEuroHandler
h50.setSuccessor(h100)
var fiftyCent := Coin (20,0.15)
var oneEuro := Coin (30,0.2)
var twoEuro := Coin (40,0.3)
h50.handleCoin(fiftyCent)
h50.handleCoin(oneEuro)
h50.handleCoin(twoEuro)
