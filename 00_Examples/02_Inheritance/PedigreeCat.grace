// Classes
class Cat(name') colour(colour') {  //class and its factory method
  def colour is readable = colour' // note primes on names
  def name is readable = name'
  var miceEaten := 0
  method eatMouse {miceEaten := miceEaten + 1}
  method miaow {print "{name}({colour}) has eaten {miceEaten} mice"}
}
Cat("Amelia") colour("Tortoiseshell").miaow

// Inheritance
class PedigreeCat(aName) colour(aColour) { //call superclass's factory 
  inherits Cat(aName) colour("Pedigree " ++ aColour)
    alias catMiaow2 = miaow
  var prizes := 0
  var feelingGood is readable:= false
  method winner {prizes := prizes + 1}
  method miaow is override {catMiaow2
                            print "and won {prizes} prizes"}
  method eatMouse is override {
    miceEaten := miceEaten + 2
    feelingGood := true
  }                            
    
}

def woopert = PedigreeCat("Woopert") colour("Siamese")
woopert.winner
woopert.winner
woopert.winner
woopert.eatMouse
woopert.miaow
//woopert.feelingGood := false
print "{woopert.feelingGood}"

def jose = object {
  var forename is public, readable := "Jose"
  var surname is public, readable := "Bloggs"
  var id := 234567
  method asString is public {"Person: {forename} {surname} id:{id}"}
}
print "jose is {jose}." // now works

def joe = object {
    var forename := "Joe"
    var surname := "Bloggs"
    var id := 234567
    method asString {"Person: {forename} {surname} id:{id}"}
}
print "joe is {joe}." // error here

