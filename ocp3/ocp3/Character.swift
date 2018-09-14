//
//  Character.swift
//  ocp3
//
//  Created by pith on 25/07/2018.
//  Copyright © 2018 dino. All rights reserved.
//

import Foundation

/// Enumeration of the 4 types of characters.
///
/// - Combattant: Classic fighter.
/// - Mage: His talent: heal his team's members.
/// - Colosse: Imposing and though but doesn't hurt a lot.
/// - Nain: A lot of damage but not a lot HP.
enum CharacterType: Int {
    case Combattant = 1
    case Mage = 2
    case Colosse = 3
    case Nain = 4
    
}
/// This class will allows to create the team's characters
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
            self.damage = 20
            self.heal = 0
           self.weapon = Weapon(name: "Storm", damage: 50)
        case.Mage:
            self.life = 1
            self.damage = 0
            self.heal = 1
           self.weapon = Weapon(name: "Magic Wand", damage: 1)
        case.Colosse:
            self.life = 1
            self.damage = 20
            self.heal = 0
         self.weapon = Weapon(name: "Storm", damage: 50)
        case.Nain:
            self.life = 1
            self.damage = 20
            self.heal = 0
           self.weapon = Weapon(name: "Storm", damage: 50)
        }
    }
    
    /// This function is used in class GameManager.Will substract damage points of a character's life when
    /// attacked.
    /// - Parameter attacker: The character who attack
    func damage (from attacker: Character) {
       self.life -= attacker.damage
        if self.life <= 0 {
            self.life = 0
        }
    }
    
    /// For the Mage.Will increase the HP of the choosen teammate.
    ///
    /// - Parameter healer: The Mage character.
    func health (from healer: Character) {
        self.life += healer.heal
    }
   
    

}
