//
//  Character.swift
//  ocp3
//
//  Created by pith on 25/07/2018.
//  Copyright © 2018 dino. All rights reserved.
//

import Foundation
enum CharacterType: Int {
    case Combattant = 1
    case Mage = 2
    case Colosse = 3
    case Nain = 4
    
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
            self.life = 1
            self.damage = 50
        case.Mage:
            self.life = 1
            self.damage = 50
        case.Colosse:
            self.life = 1
            self.damage = 5
        case.Nain:
            self.life = 70
            self.damage = 20
            
        }
    }
    func damage (from attacker: Character) {
    
       self.life -= attacker.damage
        if self.life <= 0 {
            self.life = 0
        }
    }
    func heal (teamMate: Character) {
    //    self.life += teamMate.heal
    }
   
    

}
