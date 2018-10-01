//
//  Weapon.swift
//  ocp3
//
//  Created by pith on 25/08/2018.
//  Copyright © 2018 dino. All rights reserved.
//

import Foundation




/// This is the class for character's weapon
class Weapon {
    var name: String
    var damage: Int
    var heal: Int
    init(name: String, damage: Int, heal: Int) {
        self.name = name
        self.damage = damage
        self.heal = heal
    }
}
