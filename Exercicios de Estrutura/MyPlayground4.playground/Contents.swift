// Forma Tradicional
func getFullName(firstName: String, lastName: String) -> String {
    return firstName + " " + lastName
}

let fullname = getFullName(firstName: "Ana", lastName: "Brito")
print(fullname)


//

func getFullName2(firstName: String, lastName: String = "Desconhecido") -> String {
    return firstName + " " + lastName
}

let fullname2 = getFullName2(firstName: "Ana")
print(fullname2)


//

func getFullName3(_ firstName: String, _ lastName: String = "Desconhecido") -> String {
    return firstName + " " + lastName
}

let fullname3 = getFullName3("Tiago", "Aguiar")
print(fullname3)

//

func getFullName4(name firstName: String, _ lastName: String = "Desconhecido") -> String {
    return firstName + " " + lastName
}

let fullname4 = getFullName4(name: "Tiago", "Rocha")
print(fullname4)

func somar(numero1 x: Int, numero2 y: Int) {
    print(x+y)
}

somar(numero1: 10, numero2: 10)
