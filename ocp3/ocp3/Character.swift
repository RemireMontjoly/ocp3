//
//  Character.swift
//  ocp3
//
//  Created by pith on 25/07/2018.
//  Copyright © 2018 dino. All rights reserved.
//

import Foundation
enum CharacterType: Int {
    case Combattant
    case Mage
    case Colosse
    case Nain 
    
}
class Character {
    var type: CharacterType
    var name: String
    var life: Int
    var damage: Int
    init(type: CharacterType, name: String) {
        self.type = type
        self.name = name
        switch self.type {
        case.Combattant:
            self.life = 100
            self.damage = 80
        case.Mage:
            self.life = 80
            self.damage = 50
        case.Colosse:
            self.life = 120
            self.damage = 40
        case.Nain:
            self.life = 90
            self.damage = 120
            
        }
    }
}

