import UIKit

let name = "twostraws"
let password = "password"

let authentication = (name: "twostraws", password: "password")

switch authentication {
    case ("bilbo", "baggins1"):
        print("hello bilbo")
    case ("twostraws", "password"):
        print("hello paul hudson")
default:
        print("who are you?")
}

// partial matches

let authentication2 = (name: "twostraws", password: "password", ipAddress: "127.0.0.1")

switch authentication2 {
    
    case ("bilbo", "baggins1", _):
        print("hello bilbo")
    case ("twostraws", "password", _):
        print("hello paul hudson")
default:
        print("who are you?")
}

func fizzbuzz(number: Int) -> String {
    switch (number % 3 == 0, number % 5 == 0) {
        case (true, false):
            return "fizz"
        case (false, true):
            return "buzz"
        case (true, true):
            return "fizzbuzz"
    case (false, false):
            return String(number)
    }
}

print(fizzbuzz(number: 15))

// loops

//let twostraws = (name: "twostraws", password: "password")
//let bilbo = (name: "bilbo", password: "password")
//let taylor2 = (name: "taylor", password: "password")
//
//let users = [twostraws, bilbo, taylor]
//
//for user in users {
//    print(user.name)
//}
//
//for case ("twostraws", "password") in users {
//    print("user twostraws has the password password")
//}
//
//for case (let name, let password) in users {
//    print("user \(name) has the password \(password)")
//}
//
//for case let (name, password) in users {
//    print("user \(name) has the password \(password)")
//}

//class MusicPlayer {
//    init() {
//        print("ready to play songs")
//    }
//}
//
//class Singer {
//    static let musicPlayer = MusicPlayer()
//    
//    init() {
//        print("creating a new singer")
//    }
//}
//
//let taylor = Singer()

func fibonacci(of num: Int) -> Int {
   if num < 2 {
      return num
   } else {
      return fibonacci(of: num - 1) + fibonacci(of: num - 2)
   }
}

let lazyFibonacciSequence = Array(0...199).lazy.map(fibonacci)
print(lazyFibonacciSequence[19])
print(lazyFibonacciSequence[19])
print(lazyFibonacciSequence[19])


struct User {
    var username: String
    
    init() {
        username = "Anonymous"
        print("creating a username")
    }
}

var user = User()
user.username = "twostraws"

let heading = "heading"
let underline = String(repeating: "=", count: heading.count)


// string to int
let str2 = String(2)
print(str2)

let scores = [5, 3, 6, 1, 3, 5, 3, 9]
let scoresSet = Set(scores)
let uniqueScores = Array(scoresSet)
