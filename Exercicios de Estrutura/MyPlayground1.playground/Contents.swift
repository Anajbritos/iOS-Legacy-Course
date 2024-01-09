
//var stringA = "Ana"
//var stringB = "Julia"
//
//var comparando = (stringA == stringB)
//print(comparando)


//var idade = 14
//
//var naoPodeDirigir = idade < 18
//print(naoPodeDirigir)


//var isMotorista = true
//var idade = 45
//var dados = isMotorista && idade > 30
//print("É motorista e tem mais de 30 anos")

//var paiTemPlano =  false
//var maeTemPlano = false
//var euTenhoPlano = true
//
//
//if paiTemPlano && maeTemPlano && euTenhoPlano {
//    print("todos aqui em casa possui um plano de saúde")
//} else if paiTemPlano || maeTemPlano || euTenhoPlano {
//    print( "pelo menos uma pessoa em casa possui um plano de saúde")
//} else {
//    print("ninguem tem plano de saude")
//}


//var produto: String = "iMac"
//var precoProduto: Float = 10000.00
//
//if produto == "iMac" || precoProduto >= 10000.00 {
//    print("Desconto Aplicado")
//} else {
//    print("Sem Desconto")
//}


//var idade = 50
//
//if idade < 17 || idade > 65 {
//    print("Não me preocupo com Boleto!")
//} else {
//    print("boletos fazem parte da vida!")
//}

//
//var banco = (agencia: 30, contaCorrente: "1234-5" )
//let (agencia, contaCorrente) = banco
//agencia
//contaCorrente

//var banco:(agencia: Int, contaCorrente: String)
//banco.agencia = 20
//banco.contaCorrente = "2345-6"
//print(banco)

//let aniversario = (dia: 06, mes: 03, ano: 2001)
//let (_,_,year) = aniversario
//print(year)

//var produtos = ["iMac","AirPod Max", "iPod", "AppleWatch"]
//produtos.append("iPad")
//
//
//produtos = Array(produtos[0...produtos.count-2])
//print(produtos)
//
//if produtos.count > 3 {
//    print("sua lista de produtos está ok")
//}
//if !produtos.contains("iPhone") {
//    print( "Esse produto não está cadastrado: iPhone")
//}
//
//produtos.removeAll()


//var funcionarios = ["Betania", "Rafaela", "Gabriel", "Leandro", "Ronaldo"]
//var i = 0
//
//while i < funcionarios.count {
//    print(" Boas Vindas \(funcionarios[i])")
//    i+=1
//}


//var materias = ["Matematica", "Portugues", "Historia", "Ciencia", "Biologia", "Fisica", "Quimica"]
//var notas = [8.0,4.0,9.0,4.0,5.0,1.0,10.0]
//
//var media = 0.0
//for i in 0..<materias.count {
//    print("\(materias[i]) -> \(notas[i])")
//    media += notas[i]
//}
//
//var mediaTotal = media/Double(notas.count)
//print(mediaTotal)


//var semana = ["SEGUNDA","TERÇA","QUARTA", "QUINTA","SEXTA"]
//
//for i in 0..<semana.count {
//
//    if semana[i] == "TERÇA" {
//        continue
//    }
//    if semana[i] == "SEXTA" {
//        break
//    }
//    print(semana[i])
//}

//var diasDaSemana = [
//    "SEGUNDA": true,
//    "TERCA": true,
//    "QUARTA": true,
//    "QUINTA": true,
//    "SEXTA": true,
//    "SABADO": false,
//    "DOMINGO": false,
//]
//
//diasDaSemana["SABADO"] = true
//diasDaSemana["DOMINGO"] = nil
//
//for key in diasDaSemana.keys {
//    print("Dias da Semana -> \(key)")
//}

//var agendamento: Set = ["01/02", "02/02", "03/02"]
//
//agendamento.insert("04/02")
//agendamento.remove("02/02")
//
//let res = agendamento.insert("04/02")
//
//if !res.inserted {
//    print("Nao é possivel adicionar um novo agendamento, pois ele ja existe")
//}
//print(agendamento)

//func semana(dia: String) -> String{
//    switch (dia) {
//    case "SAB","DOM" :
//      return "Final de Semana"
//    case "SEG","TER","QUA","QUI","SEX" :
//        return "Dia útil"
//    default:
//        return "Nenhum dia válido informado"
//    }
//}
//
//semana(dia: "OLA")
//semana(dia: "SAB")
//semana(dia: "SEG")


//func desconto(_ valor: Double,_ valorDesconto: Double = 20.0)  {
//    var produtoDescontado = ((valorDesconto / 100)*valor)
//     print("O desconto aplicado: R$ \(produtoDescontado)")
//     print(" O produto sair por: R$ \(valor-produtoDescontado)")
//}
//
//desconto(10, 20)

//func conversao(palavra: String) -> String {
//    let conversor: Int? = Int(palavra)
//
//    guard let number = conversor else {
//        return "Não foi possivel converter String em Int"
//    }
//    return "numero \(number)"
//
//}
//
//conversao(palavra: "abc")
//conversao(palavra: "1")


//struct Person {
//    var nome: String
//    var idade : Int
//    var altura: Double
//    var peso: Double
//
//
//    func calcImc() -> Double {
//        let imc = peso/(altura*altura)
//        return imc
//    }
//}
//
//var person = Person(nome: "Ana", idade: 20, altura: 1.69, peso: 67)
//
//let imc = person.calcImc()
//
//print("\(person.nome) possui \(imc)")

//class Person {
//    var nome: String
//    var idade : Int
//    var altura: Double
//    var peso: Double
//    
//    init(nome: String, idade: Int, altura: Double, peso: Double) {
//        self.nome = nome
//        self.idade = idade
//        self.altura = altura
//        self.peso = peso
//    }
//    
//    func calcImc()-> Double{
//        return peso/(altura*altura)
//    }
//}
//
//var person = Person(nome: "Ana", idade: 12, altura: 1.45, peso: 45.3)
//var imc = person.calcImc()
//print("\(person.nome) possui \(imc)")

//func calculadora(numero: Int, operation:(Int) -> Int) {
//    let result = operation(numero)
//    print("resultado : \(result)")
//}
//
//calculadora(numero: 4) { x in
//    x*x
//}
//
//calculadora(numero: 4) { x in
//    x * 2
//}

func netflix(email: String, dispositivo:(String) -> [String: String]) {
    print("conectando com o email \(email)")
    let deviceConnected = dispositivo(email)
    print("dispositivo conectado \(deviceConnected)")
}

func tv(email: String) -> [String:String] {
    return [
        "email": email,
        "modelo": "samsung"
    ]
}

netflix(email: "anajbritos@gmail.com", dispositivo: tv(email:))

netflix(email: "anajbritos@gmail.com") { email in
    [ "email": email,
      "modelo" : "iphone 11"
    ]
}
