import UIKit

var str = "Hello, playground"

//*//Error Protocol is just a type for representing error values that can be thrown.


// go through this link for error concept https://www.journaldev.com/19651/swift-error-handling-swift-try  ///

//Swift requires you to create a custom Error type. Typically an Enum is used which conforms to the Error Protocol.


//throws and throw
    
//If a function or an initializer can throw an error, the throws modifier must be added in the definition itself right after the paratheses and just before the return type.

enum UserDetailError:Error{
    
    case noValidName
    case noValidAge
    
    
}
func userTest(age:Int, name:String) throws{
    
    
    guard age > 0 else {
        throw  UserDetailError.noValidAge
    }
    guard name.count > 0 else {
        
        
        throw UserDetailError.noValidName
    }
    
    
}
do {

    try userTest(age: 28, name: "ra")
}
catch UserDetailError.noValidName{
print("The name isn't valid")
}
catch UserDetailError.noValidAge
{
    print("The age isn't valid")
}
catch let error {
    print("Unspecified Error: \(error)")
}




/////
//throw error in initalizer

enum StudentError: Error {
    case invalid(String)
    case tooShort(String)
}

class Student {
    var name: String?
    init(name: String?) throws {
        guard let name = name else{
            throw StudentError.invalid("Invalid")
        }
        self.name = name
        
    }
    
    func myName(str: String) throws -> String {
        
        guard str.count < 5
            else{
                throw StudentError.tooShort("name is too short")
        }
        
        return "My name is \(str)"
    }
}

//var s = Student(name: nil)//// compilation error make it as try

do{
    var s = try Student(name: "rr")
    try s.myName(str: "rrr")
}
catch let error
{
    print("result",error)
}


