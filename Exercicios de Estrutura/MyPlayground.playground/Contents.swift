import UIKit

var escola: [String:Double] = [
    "João": 28.5,
    "Maria": 27.9,
    "Pedro": 26.3,
    "Ana": 29.1,
    "Carlos": 25.8,
    "Mariana": 27.2,
    "José": 28.0,
    "Laura": 12.4,
    "Gabriel": 29.5,
    "Carolina": 26.8,
    "Fernando": 27.7,
    "Julia": 30.1,
    "Rafael": 25.6,
    "Larissa": 29.3,
    "Diego": 26.7,
    "Camila": 27.4,
    "Thiago": 28.2,
    "Isabela": 28.7,
    "Lucas": 27.0,
    "Manuela": 26.0,
    "Sofia": 29.0,
    "Eduardo": 27.1,
    "Beatriz": 28.4,
    "Daniel": 26.9,
    "Luiza": 28.3
]

var maior = escola.first
var menor = escola.first

for(key,value) in escola {
    
    if value > maior?.value ?? 0.0{
        maior?.value = value
        maior?.key = key
    }
    
    if value < menor?.value ?? 0.0{
        menor?.value = value
        menor?.key = key
    }
}

print(menor?.key ?? "")
print("O aluno com maior nota de \(maior?.value ?? 0.0) se chama \(maior?.key ?? "")")
print("O aluno com menor nota de \(menor?.value ?? 0.0) se chama \(menor?.key ?? "")")

