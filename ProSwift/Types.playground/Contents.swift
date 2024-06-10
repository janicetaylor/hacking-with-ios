//enum Color {
//    case unknown
//    case blue
//    case green
//    case pink
//    case purple
//    case red
//}
//
//struct Toy {
//    let name: String
//    let color: Color
//}
//
//let barbie = Toy(name: "Barbie", color: .pink)
//
//var set1 = Set<Int>([1, 2, 3, 4, 5])
//var set2 = Set(1...100)
//
//
//// generics
//
//func inspectString(_ value: String) {
//    print("received string with the value \(value)")
//}
//
//inspectString("haters gonna hate")
//
//func inspectInt(_ value: Int) {
//    print("received int with the value \(value)")
//}
//
//inspectInt(42)
//
//func inspect<T>(_ value: T) {
//    print("received \(type(of: value)) with value \(value)")
//}
//
//inspect("haters gonna hate")
//inspect(1989)

// closures

let greetPerson = { [unowned self] (name: String) in
    print("hello \(name)")
}

greetPerson("taylor")

func runSomeClosure(_ closure: (String) -> Void) {
    closure("taylor")
}

runSomeClosure(greetPerson)
