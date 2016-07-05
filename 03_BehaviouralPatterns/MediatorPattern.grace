//Todo: Correct the pattern

//The mediator pattern is used to reduce coupling between classes that communicate with each other. 
//Instead of classes communicating directly, and thus requiring knowledge of their implementation, the classes send messages via a mediator object.

//The script is a demonstration of a online lecture.
//Teacher can present slides to all students, revceives quesion from a particular student and answer the question directly to it 
//Student revceives slides, ask question to Teacher and revceives answer
//Mediator is responsible for the whole communication. Each time a new Student is created, Mediator will add the Student to its Student list. 

import "/Users/if0814/Dropbox/01_Master_Studium/04_Semester_NZ/03_Thesis/02_Implementation/list" as list

//Can I delete ClassMember ? redundant
//Make ClassMember a type ?

class ClassMember (_mediator, _name) {
    var mediator := _mediator
    var name is readable:= _name
}

class Teacher (_mediator, _name) {
    inherit ClassMember (_mediator, _name)
 
    method receiveQuestion (question, attendee) {
        print "Teacher received question: {question} from {attendee} "
    }
 
    method answerQuestion(answer, attendee) {
        print "Teacher answered: {answer} to {attendee.name} "
        mediator.sendAnswer(answer, attendee)
    }
    
    method presentSlides (url){
        print "Teacher changed slide to {url}"
        mediator.updateBoard(url)
    }
}

class Student (_mediator, _name) {
    inherit ClassMember (_mediator, _name)
    _mediator.addNewStudentToClass(self)

    method askQuestion (question) {
        print "Student {name} asks question: {question}"
        _mediator.sendQuestion(question,self)
    }

    method receiveAnswer (answer) {
        print "{name} has received the answer {answer}"
    }
    
    method receiveSlides (url) {
        print "Student {name} revceives the slides from the file: {url}"     
    }

    method asString {
        "{name}"
    }
}

class Mediator (_teacher) {
    var teacher is readable, writable := _teacher
    var classMember := list.with []
    //var classMember := list.with [ "red", "green", "blue" ]

    //for (classMember) do { member ->
    //    print(member)
    //}

    method addNewStudentToClass (_student) {
        classMember.add(_student)
    }
    method sendAnswer(answer, _student) {
        _student.receiveAnswer(answer)
    }
    
    method sendQuestion(question, _student) {
        teacher.receiveQuestion(question, _student)
    }
    
    method updateBoard (url) {
      //  for (classMember) do {member ->
        //    member.receiveSlides (url)
        //}
        for (classMember) do { member ->
            member.receiveSlides (url)
        }
    }
}

var mediator := Mediator
var teacherDavid := Teacher (mediator, "David")
var andrew := Student(mediator, "Andrew")
var michael := Student(mediator, "Michael")
//mediator.classMember.add(andrew)
//mediator.classMember.add(michael)
mediator.teacher := teacherDavid
teacherDavid.presentSlides ("MarketingStrategyMethods.pdf")
andrew.askQuestion("'What is that ?'")
teacherDavid.answerQuestion("'I do not know'", andrew)
