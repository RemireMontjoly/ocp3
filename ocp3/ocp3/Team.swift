//
//  Team.swift
//  ocp3
//
//  Created by pith on 25/07/2018.
//  Copyright © 2018 dino. All rights reserved.
//

import Foundation

/// Class Team will allows to make team1 and team2.
class Team {
    var name: String
    var characters = [Character]()
    var countDamage = 0
    var countHealth = 0
    init(name: String, characters: [Character]) {
        self.name = name
        self.characters = characters
    }
    
    /// This function will display informations on each team after their built.Characters' type, name, HP.
    func teamInfo() {
        print("L'équipe \(self.name) est composée de :")
        for character in characters {
            print ("- \(character.name) de type \(character.type) avec une vie à : \(character.life)")
        }
    }
    
    /// This function will allow players to choose a character of his team in order to attack the opposite team.
    /// Will loop if the choosen character is dead.
    /// - Returns: The character of the team choosen by player.
    func chooseAttacker() -> Character {
        print("\nEquipe \(self.name) veuillez choisir un de vos personnages pour passer à l'action (de 1 à 3)")
        miniInfo()
        if let choice = Int(readLine()!) {
            if choice != 1 && choice != 2 && choice != 3  {
                print("Veuillez choisir entre 1 et 3.")
                return chooseAttacker()
            }
            if self.characters[choice - 1].life == 0 { ///////// choice -1 because array of characters start at 0
                print("Ce personnage est mort.Veuillez en choisir un autre.")
                return chooseAttacker()
            } else if self.characters[choice - 1].isPetrified {
                print("Ce personnage est pétrifié pour un tour.Veuillez en choisir un autre.")
                return chooseAttacker()
            } else {
                return characters[choice - 1]
            }
        }
        print("Veuillez choisir entre 1 et 3.")
        return chooseAttacker()
    }
    
    /// This function will allow players to choose a character of the opposite team to attack.
    /// Will loop if the choosen character is dead.
    /// - Returns: The character of the opposite team choosen by player.
    func chooseTarget() -> Character {
        print("\nVeuillez choisir quel personnage attaquer (de 1 à 3)")
        miniInfo()
        if let choice = Int(readLine()!) {
            if choice != 1 && choice != 2 && choice != 3  {
                print("Veuillez choisir entre 1 et 3.")
                return chooseAttacker()
            }
            if self.characters[choice - 1].life == 0 {
                print("Ce personnage est mort.Veuillez en choisir un autre.")
                return chooseTarget()
            } else {
                return characters[choice - 1]
            }
        }
        print("Veuillez choisir entre 1 et 3.")
        return chooseTarget()
    }
    
    /// For the Mage.Will allow to choose a teammate to heal.
    ///
    /// - Returns: The choosen character of the team to heal.
    func chooseWhoToHeal() -> Character {
        print("Quel personnage de votre équipe voulez-vous soigner? (de 1 à 3)")
        if let choice = Int(readLine()!) {
            if choice != 1 && choice != 2 && choice != 3  {
                print("Veuillez choisir entre 1 et 3.")
                return chooseWhoToHeal()
            }
            if self.characters[choice - 1].life == 0 {
                print("Ce personnage est mort.Veuillez en choisir un autre.")
                return chooseWhoToHeal()
            } else {
                return characters[choice - 1]
            }
        }
        print("Veuillez choisir entre 1 et 3.")
        return chooseWhoToHeal()
    }
    
    /// Will be used to know the winner.
    ///
    /// - Returns: return true if a character of the team is still alive.
    func alive() -> Bool {
        return characters.contains(where: { character in
            return character.life > 0
        })
    }
    
    /// To unfroze the frozen character 
    func resetStatus() {
        for character in characters {
            character.isPetrified = false
        }
    }
    
    /// Will display informations on each team before each round.
    private func miniInfo() {
        for(index, character) in characters.enumerated() {
            if character.life == 0 {
                print("-\(index + 1) \(character.name) a 0 HP restant.Il est 💀")
            } else if character.isPetrified {
                print("-\(index + 1) \(character.name) est petrifié pour 1 tour. ❄️")
            } else {
                print("-\(index + 1) \(character.name) avec \(character.life) HP restant.")
            }
        }
    }
    
    
    
}
