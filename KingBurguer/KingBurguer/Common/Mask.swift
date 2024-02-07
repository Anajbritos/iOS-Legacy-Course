//
//  Mask.swift
//  KingBurguer
//
//  Created by Ana Julia Brito de Souza on 05/02/24.
//

import Foundation
import UIKit

class Mask {
    
    private let mask: String
    var oldString: String = ""
    
    init(mask: String) {
        self.mask = mask
    }
    
    private func replaceChars(value: String) -> String {
        return value.replacingOccurrences(of: ".", with: "")
            .replacingOccurrences(of: "-", with: "")
            .replacingOccurrences(of: "/", with: "")
        
    }
    
    func process(value: String) -> String? {
        
        if value.count > mask.count {
            return String(value.dropLast())
        }
        let str = replaceChars(value: value)
        let isDelete = str <= oldString
        oldString = str
        var result = ""
        var i = 0
        for char in mask {
            if char != "#" {
                if isDelete {
                    continue
                }
                result = result + String(char)
            } else {
                let character = str.chatAtIndex(index: i)
                guard let c = character else {break}
                
                result = result + String(c)
                i += 1
            }
            
        }
        return result
    }
}
