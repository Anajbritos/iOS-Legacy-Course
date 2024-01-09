import Foundation

protocol Tracker {
    func monitoraEvento(name: String)
}

class MeuSistemaAnalytics: Tracker {
    func monitoraEvento(name: String) {
        print(" Ola \(name)")
    }
}

class GoogleAnalytics: Tracker {
    func monitoraEvento(name: String) {
        let dataDoEvento = Date()
        print("\(dataDoEvento): \(name)")
    }
}

class Login {
    
    private let tracker: Tracker
    
    init(tracker: Tracker) {
        self.tracker = tracker
    }
    
    func fazerLogin() {
        print("Fazendo login")
        tracker.monitoraEvento(name: "Login")
    }
}

class Home {
    
    private let tracker: Tracker
    
    init(tracker: Tracker) {
        self.tracker = tracker
    }
    func carregarProdutos() {
        print("Carregando produtos")
        tracker.monitoraEvento(name: "Home")
    }
}

class Perfil {
    private let tracker: Tracker
    
    init(tracker: Tracker) {
        self.tracker = tracker
    }
    
    func editarPerfil() {
        print("Editando perfil")
        tracker.monitoraEvento(name: "Perfil")
    }
}
let t = MeuSistemaAnalytics()

let login = Login(tracker: t)
login.fazerLogin()
sleep(2)

let home = Home(tracker: t)
home.carregarProdutos()
sleep(5)

let perfil = Perfil(tracker: t)
perfil.editarPerfil()
sleep(2)

print("Fim do Programa")
