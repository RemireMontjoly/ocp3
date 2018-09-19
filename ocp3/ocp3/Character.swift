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
    case Gorgone = 5
}
/// This class will allows to create the team's characters
class Character {
    var type: CharacterType
    var name: String
    var life: Int
    var weapon: Weapon
    var isPetrified = false
    
    init(type: CharacterType, name: String) {
        self.type = type
        self.name = name
        switch self.type {
        case.Combattant:
            self.life = 1
            self.weapon = Weapon(name: "Sword", damage: 50, heal: 0)
        case.Mage:
            self.life = 1
            self.weapon = Weapon(name: "Magic Wand", damage: 0, heal: 2)
        case.Colosse:
            self.life = 1
            self.weapon = Weapon(name: "Hammer", damage: 50, heal: 0)
        case.Nain:
            self.life = 1
            self.weapon = Weapon(name: "Axe", damage: 50, heal: 0)
        case.Gorgone:
            self.life = 1
            self.weapon = Weapon(name: "Petrificator", damage: 0, heal: 0)
        }
    }
    
    /// This function is used in class GameManager.Will substract damage points of a character's life when
    /// attacked.
    /// - Parameter attacker: The character who attack
    func damage (from attacker: Character) {
        self.life -= attacker.weapon.damage
        if self.life <= 0 {
            self.life = 0
        }
    }
    
    /// For the Mage.Will increase the HP of the choosen teammate.
    ///
    /// - Parameter healer: The Mage character.
    func health (from healer: Character) {
        self.life += healer.weapon.heal
    }
    
    /// This func will allows the Gorgone to freeze a character for one round
    func petrify () {
        self.isPetrified = true
    }
    
    /// Weapons in the random chest
    func equipeNewWeapon() {
        switch self.type {
        case.Combattant:
            self.weapon = Weapon(name: "Sword upgraded", damage: 50, heal: 0)
        case.Mage:
            self.weapon = Weapon(name: "Magic Wand upgraded", damage: 0, heal: 2)
        case.Colosse:
            self.weapon = Weapon(name: "Hammer upgraded", damage: 50, heal: 0)
        case.Nain:
            self.weapon = Weapon(name: "Axe upgraded", damage: 50, heal: 0)
        case.Gorgone:
            self.weapon = Weapon(name: "Black Arrow", damage: 50, heal: 0)
            
        }
    }
    
}
