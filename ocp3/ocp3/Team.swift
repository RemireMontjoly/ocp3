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
        for character in characters {
            print ("- \(character.name) de type \(character.type) avec une vie à : \(character.life)")
        }
    }
    
    func beforPlay() {
        var count = 0
        for character in characters {
         count += 1
            if character.life > 0 {  print("\(count)" + "- " + "\(character.type)")
            } else {
                print("Tous les personnages sont mort")
            }
    }

    }
}



