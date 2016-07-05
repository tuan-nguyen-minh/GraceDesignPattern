import "SingleObject" as s

var instance := s.Interface.getInstance
instance.testAttribute := "att1"
instance.asString

var instance2 :=  s.Interface.getInstance
instance2.asString