import UIKit
import Foundation

//func lengthOf(strings: [String]) -> [Int] {
//   return strings.map { $0.count }
//}
//
//let fruits = ["apple", "cherry", "orange"]
//let upperFruits = fruits.map { $0.uppercased() }
//print(upperFruits)
//
//let scores = [100, 80, 90]
//let passOrFail = scores.map { $0 > 85 ? "pass" : "fail" }
//print(passOrFail)
//
//let position = [50, 60, 30]
//let averageResults = position.map { 45...55 ~= $0 ? "within average" : "outside average"}
//print(averageResults)
//
//let numbers: [Double] = [4, 9, 25]
//let results = numbers.map(sqrt)
//
//let i: Int? = 10
//let j = i.map { $0 * 2 }
//print(j)

//func fetchUsername(id: Int) -> String? {
//   if id == 1989 {
//      return "Taylor Swift"
//   } else {
//       return nil
//   }
//}
//
//var username: String? = fetchUsername(id: 1989)
//let formattedname = username.map { "welcome \($0)" } ?? "unknown user"
//print(formattedname)
//
//let albums: [String?] = ["Fearless", nil, "1989", "Red", nil]
//let results2 = albums.compactMap { $0 }
//print(results2)
//
//let scores = ["100", "90", "Fish", "85"]
//let compactMapScores = scores.compactMap { Int($0) }
//print(compactMapScores)
//
//let stringNumber: String? = "5"
//let intNumber = stringNumber.flatMap { Int($0) }
//print(intNumber)
//
//let numbers = [1, 2, 3, 4]
//let evenNumbers = numbers.filter { $0 % 2 == 0 }
//print(evenNumbers)
//
//let names = ["Michael Jackson", "Taylor Swift", "Michael Caine", "Adele Adkins", "Michael Jordan"]
//let result = names.filter { $0.hasPrefix("Michael") }
//print(result)
//
//let words = ["1989", "Fearless", "Red"]
//let input = "My favorite album is Fearless"
//let result2 = words.filter { input.contains($0) }
//print(result2)

//let scores = [100, 90, 95]
//let sum = scores.reduce(0, +)
//print(sum)
//
//let result = scores.reduce("") { $0 + String($1) }
//print(result)
//
//let names = ["Taylor", "Paul", "Adele"]
//let longEnough = names.reduce(true) { $0 && $1.count > 4 }
//print(longEnough)
//
//let longEnough2 = names.allSatisfy { $0.count > 4 }
//print(longEnough2)
//
//let numbers = [
//   [1, 1, 2],
//   [3, 5, 8],
//[13, 21, 34] ]
//
//let flattened: [Int] = numbers.reduce([]) { $0 + $1 }
//print(flattened)
//
//let flattened2 = numbers.compactMap { $0 }
//print(flattened2)
//
//let flattened3 = Array(numbers.joined())
//print(flattened3)
//
//let scoresString = ["100", "95", "85", "90", "100"]
//let sortedString1 = scoresString.sorted()
//print(sortedString1)
//
//let scoresInt = scoresString.compactMap { Int($0) }
//let sortedInt = scoresInt.sorted()
//print(sortedInt)
//
//let sortedString2 = scoresString.sorted {
//   if let first = Int($0), let second = Int($1) {
//      return first < second
//   } else {
//      return false
//   }
//}
//
//print(sortedString2)
//
//struct Person: Comparable {
//   var name: String
//   var age: Int
//    
//    static func <(lhs: Person, rhs: Person) -> Bool {
//       return lhs.name < rhs.name
//    }
//    
//    static func ==(lhs: Person, rhs: Person) -> Bool {
//       return lhs.name == rhs.name && lhs.age == rhs.age
//    }
//}
//let taylor = Person(name: "Taylor", age: 26)
//let paul = Person(name: "Paul", age: 36)
//let justin = Person(name: "Justin", age: 22)
//let adele = Person(name: "Adele", age: 27)
//let people = [taylor, paul, justin, adele]
//
//let sortedPeople = people.sorted { $0.name < $1.name }
//print(sortedPeople)
//
//let sortedPeople2 = people.sorted()
//print(sortedPeople2)
//
//let names2 = ["Taylor", "Paul", "Adele", "Justin"]
//print(names2)
//
//let sorted3 = names2.sorted().reversed()
//print(sorted3)
//
//let london = (name: "London", continent: "Europe", population: 8_539_000)
//let paris = (name: "Paris", continent: "Europe", population: 2_244_000)
//let lisbon = (name: "Lisbon", continent: "Europe", population: 530_000)
//let rome = (name: "Rome", continent: "Europe", population: 2_627_000)
//let tokyo = (name: "Tokyo", continent: "Asia", population: 13_350_000)
//let cities = [london, paris, lisbon, rome, tokyo]
//
//let totalPopulation = cities.reduce(0) { $0 + $1.population }
//print(totalPopulation)
//
//let europePopulation = cities.filter { $0.continent == "Europe" }.reduce(0) { $0 + $1.population }
//print(europePopulation)

//let numbers = Array(1...10000)
//let lazyFilter = numbers.lazy.filter { $0 % 2 == 0 }
//let lazyMap = numbers.lazy.map { $0 * 2 }
//
//print(lazyFilter.count)
//print(lazyMap[5000])

//class Doctor {
//    var name = "House"
//    var currentPatient = "Taylor Swift"
//    
//    func performSurgery(isEmergency emergency: Bool) {
//          if emergency {
//             print("OK, let's go!")
//          } else {
//             print("Please find a surgeon")
//          }
//    }
//    
//    func assignToPatient(_ name: String) {
//       currentPatient = name
//    }
//    
//    init(name: String, currentPatient: String) {
//        self.name = name
//        self.currentPatient = currentPatient
//    }
//}
//
//class Surgeon: Doctor {
//    
//    var title: String
//    
//    init(name: String, title: String, currentPatient: String) {
//        self.title = title
//        super.init(name: name, currentPatient: currentPatient)
//    }
//    
//    override func assignToPatient(_ name: String) {
//          print(getJuniorDoctorDiagnosis())
//          super.assignToPatient(name)
//    }
//       func getJuniorDoctorDiagnosis() -> String {
//          return "He's dead, Jim"
//    }
//}

protocol Payable {
    func calculateWages() -> Int
}

extension Payable {
    func calculateWages() -> Int {
        return 1000
    }
}

protocol ProvidesTreatment {
    func treat(name: String)
}

extension ProvidesTreatment {
    func treat(name: String) {
        print("I have treated \(name)")
    }
}

protocol ProvidesDiagnosis {
    func diagnose() -> String
}

extension ProvidesDiagnosis {
    func diagnose() -> String {
        return "he's dead Jim!"
    }
}

protocol ConductsSurgery {
   func performSurgery()
}
extension ConductsSurgery {
   func performSurgery() {
      print("Success!")
   }
}

protocol HasRestTime {
   func takeBreak()
}
extension HasRestTime {
   func takeBreak() {
      print("Time to watch TV")
   }
}

protocol NeedsTraining {
   func study()
}
extension NeedsTraining {
   func study() {
      print("I'm reading a book")
   }
}



extension Receptionist: Payable, HasRestTime, NeedsTraining { }

protocol Employee: Payable, HasRestTime, NeedsTraining {}

struct Receptionist: Employee { }
struct Nurse: Employee, ProvidesTreatment { }
struct Doctor: Employee, ProvidesDiagnosis, ProvidesTreatment { }
struct Surgeon: Employee, ProvidesDiagnosis, ConductsSurgery { }

extension Employee where Self:ProvidesTreatment {
    func checkInsurance() {
        print("insured")
    }
}
