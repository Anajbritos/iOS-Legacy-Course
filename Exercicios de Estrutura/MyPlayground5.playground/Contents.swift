import UIKit

var name: String = "João"

func showWelcome(name: String?) {
    if let n = name {
        print("Ola, \(n)")
    } else {
        print("Ola, visitante")
    }
}


//showWelcome(name: "Julia")


var user:(name: String, password: String, adress: String?)
user.name = "Julia"
user.adress = nil
user.password =  "1234"
//print(user)

//if let
var username:String?
username = nil
if let username = username {
    let chars = username.count
    print("Quantidade de caracteres: \(chars)")
} else {
    //    print("O valor do nome esta nulo, logo imprimir uma mensagem para o usuario")
}

func fetchProductById(id: Int) -> String {
    let dict = [
        1: "Iphone",
        2: "Macbook",
        3: "Ipad"
    ]
    
//    if let product = dict[id] {
//        return product
//    }
//    return "produto nao encontrado"
    
    guard let product = dict[id] else {
        return "Nenhum produto encontrado"
    }
    return product
}

fetchProductById(id: 10)
