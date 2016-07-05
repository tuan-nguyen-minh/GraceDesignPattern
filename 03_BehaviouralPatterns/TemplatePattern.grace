//Enable multi-step algorithms 
class Application {
   
   method initialize {}
   
   method startApplication {}
   
   method endApplication {}
   
   //Define the steps for all child classes 
   method runApplication {
      initialize
      startApplication
      endApplication
   }
}

class WebApplication {
   inherit Application

   method initialize is Override {
      print "Initialize the Web Application"
   }

   method startApplication is Override {
      print "Start the Web Application"
   }

   method endApplication is Override {
       print "End the Web Application"
   }
}

class DesktopApplication {
   inherit Application

   method initialize is Override {
      print "Initialize the Desktop Application"
   }

   method startApplication is Override {
      print "Start the Desktop Application"
   }

   method endApplication is Override {
       print "End the Desktop Application"
   }
}

var application := WebApplication
application.runApplication
application := DesktopApplication     
application.runApplication
      