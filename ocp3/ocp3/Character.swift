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
    var heal: Int
    var weapon: Weapon
    init(type: CharacterType, name: String) {
        self.type = type
        self.name = name
        switch self.type {
        case.Combattant:
            self.life = 1
            self.damage = 1
            self.heal = 0
           self.weapon = Weapon(name: "Machine Gun", damage: 50)
        case.Mage:
            self.life = 1
            self.damage = 0
            self.heal = 1
           self.weapon = Weapon(name: "MegaSparadra", damage: 50)
        case.Colosse:
            self.life = 1
            self.damage = 1
            self.heal = 0
         self.weapon = Weapon(name: "Machine Gun", damage: 50)
        case.Nain:
            self.life = 1
            self.damage = 1
            self.heal = 0
           self.weapon = Weapon(name: "Machine Gun", damage: 50)
        }
    }
    func damage (from attacker: Character) {
    
       self.life -= attacker.damage
        if self.life <= 0 {
            self.life = 0
        }
    }
    func health (from healer: Character) {
        self.life += healer.heal
    }
   
    

}
