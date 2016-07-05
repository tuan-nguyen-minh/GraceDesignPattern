class Person. person (forename2:String) surname (surname2:String) id (id2:Number)  {
    var forename := forename2
    var surname := surname2
    var id := id2
    method asString {"Person: {forename} {surname} id:{id}"}
}
var joe := Person.person("joe")surname("Nguyen")id(12)
print "joe is {joe}." // error here
