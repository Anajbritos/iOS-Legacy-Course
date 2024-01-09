func sum(x:Int, y:Int) -> Int{
    return x + y
}
func divide(x:Int, y:Int) -> Int {
    return x / y
}

//func calc(a: Int, b: Int, operation: (Int, Int) -> (Int)){
//    print("a: \(a)")
//    print("b: \(b)")
//    let result = operation(a, b)
//    print("resultado: \(result)")
//}
//calc(a: 5, b: 5, operation: sum(x:y:))
//calc(a: 10, b: 3, operation: divide(x:y:))
//
//
//calc(a: 5, b: 8) { a, b in
//    a-b
//}
//
//calc(a: 24, b: 8, operation: { a, b in
//    a / b
//})


//==================

func callServer(url: String, callback: (Int) -> ()) {
    let code = 200
    callback(code)
}

callServer(url: "https://meusite.com") { code in
    if code == 200 {
        print("Chamada com sucesso no servidor , mostrar a proxima tela")
    } else {
        print("ops! deu erro no servidor")
    }
}
