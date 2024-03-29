//
//  Strings.swift
//  KingBurguer
//
//  Created by Ana Julia Brito de Souza on 31/01/24.
//

import Foundation

extension String {
    func isEmail() -> Bool {
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", regEx).evaluate(with: self)
    }
    
    func chatAtIndex(index: Int) -> Character? {
        var indexCurrent = 0
        for char in self {
            if index == indexCurrent {
                return char
            }
            indexCurrent += 1
        }
        return nil
    }
}
