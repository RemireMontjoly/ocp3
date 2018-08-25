//
//  Weapon.swift
//  ocp3
//
//  Created by pith on 25/08/2018.
//  Copyright © 2018 dino. All rights reserved.
//

import Foundation

enum weaponType: Int {
    case AttackWeapon = 1
    case HealWeapon = 2
    
}





class Weapon {
    var name: String
    var damage: Int
    var type: weaponType
    init(name: String, damage: Int, type: weaponType) {
        self.name = name
        self.damage = damage
        self.type = type
        switch self.type {
        case.AttackWeapon:
            self.name = "La faucheuse"
            self.damage = 100
        case.HealWeapon:
            self.name = "Mega sparadra"
            self.damage = 100
            
        }
    }
}
