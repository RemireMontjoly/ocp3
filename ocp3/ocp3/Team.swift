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
    var numberOfCharacters: Int = 3
    var characters: [Character]
    
    init(name: String, characters: [Character]) {
        
        self.name = getTeamName()
        
        self.characters = characters
}
}

