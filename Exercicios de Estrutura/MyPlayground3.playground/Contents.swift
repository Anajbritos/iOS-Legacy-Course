import UIKit

func discount(productId: Int) -> Double {
    switch(productId) {
    case 1:
        return 0.2
    case 2:
        return 0.4
    default:
        return 0.0
    }
}

let d = discount(productId: 10)
print("desconto \(Int(d*100))%")


func printProduct(name: String) {
    var message = " "
    switch(name) {
    case "iPhone", "iPad":
        message = "Product usando o S.O iOS"
        break
    case "Motorola":
        message = "Product usando o S.O Android"
        break
    default:
        message = "Produto não encontrado"
        break
    }
    print(message)
}

printProduct(name: "iPad")
