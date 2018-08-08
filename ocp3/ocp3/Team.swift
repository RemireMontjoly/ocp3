//
//  Team.swift
//  ocp3
//
//  Created by pith on 25/07/2018.
//  Copyright © 2018 dino. All rights reserved.
//

import Foundation

class Team {
    var name: String
    var characters = [Character]()
    
    init(name: String, characters: [Character]) {
        self.name = name
        self.characters = characters
    }
    func teamInfo() {
        print("L'équipe \(self.name) est composée de :")
        for character in characters{
            print ("- \(character.name) de type \(character.type) avec une vie à : \(character.life)")
        }
    }
}




