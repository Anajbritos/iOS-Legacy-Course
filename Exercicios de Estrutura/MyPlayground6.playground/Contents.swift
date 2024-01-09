//
//struct User {
//    let name: String
//    let lastName: String?
//    let isAdmin: Bool
//    var ranking: Int
//    
//    func getFullName() -> String {
//        var fullName = name
//        if let lastName = lastName {
//            fullName += " \(lastName)"
//        }
//        return fullName
//    }
//    
//    mutating func resetRanking() {
//        ranking = 0
//        print("ranking foi resetado!")
//    }
//}
//
//var userA = User(name: "Ana Julia", lastName: nil, isAdmin: true, ranking: 10)
//var userB = User(name: "Gustavo", lastName: "Jesus", isAdmin: true, ranking: 20)
//
//userA.getFullName()
//userB.getFullName()
//
//userA.resetRanking()
//userB.resetRanking()

//struct Person {
//    let name: String
//    var cpf: Int
//}
//
//var personA = Person(name: "Ana", cpf: 123123123)
//
//var personB = Person(name: "Gustavo", cpf: 456456456)
//
//print(personA)
//personB = personA
//personB.cpf = 789789789
//print(personB)
//print(personA)


class Person {
    let name: String
    var cpf: Int
    
    init(name: String, cpf: Int) {
        self.name = name
        self.cpf = cpf
    }
}

var personA = Person(name: "Ana", cpf: 123123123)

var personB = Person(name: "Gustavo", cpf: 456456456)

print(personA.cpf)
personB = personA
personB.cpf = 789789789
print(personB.cpf)
print(personA.cpf)
