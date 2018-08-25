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
    //////////////////////////////////////////Fonction qui donne les info sur les membres de l'équipe
    func teamInfo() {
        print("L'équipe \(self.name) est composée de :")
        for character in characters {
            print ("- \(character.name) de type \(character.type) avec une vie à : \(character.life)")
        }
    }
    //////////////////////////////////////////Fonction qui permet de choisir avec quel personnage on attaque (En bouclant si le choix est un personnage mort)
    func chooseAttacker() -> Character {
        print("\nEquipe \(self.name) veuillez choisir un de vos personnages pour passer à l'action (de 1 à 3)")
        miniInfo()
        if let choice = Int(readLine()!) {
            if choice != 1 && choice != 2 && choice != 3  {
                print("Veuillez choisir entre 1 et 3.")
                return chooseAttacker()
            }
            if self.characters[choice - 1].life == 0 {                             //////////////// choice -1  car le tableau de character demarre à 0
                print("Ce personnage est mort.Veuillez en choisir un autre.")
                return chooseAttacker()
            } else {
                switch choice {
                case 1: return self.characters[0]
                case 2: return self.characters[1]
                case 3: return self.characters[2]
                default: print("Veuillez choisir entre 1 et 3")
                }
            }
        }
        print("Veuillez choisir entre 1 et 3.")
        return chooseAttacker()
    }
    ///////////////////////////////////////////Fonction qui permet de choisir quel personnage on va attaquer (En bouclant si le choix est un personnage mort)
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
                switch choice {
                case 1: return self.characters[0]
                case 2: return self.characters[1]
                case 3: return self.characters[2]
                default: print("Veuillez choisir entre 1 et 3")
                }
            }
        }
        print("Veuillez choisir entre 1 et 3.")
        return chooseTarget()
    }
    ////////////////////////////////////////
    
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
                switch choice {
                case 1: return self.characters[0]
                case 2: return self.characters[1]
                case 3: return self.characters[2]
                default: print("Veuillez choisir entre 1 et 3")
                }
            }
        }
        print("Veuillez choisir entre 1 et 3.")
        return chooseWhoToHeal()
    }
    
    ///////////////////////////////////Fonction qui permet de savoir quelle equipe n'a plus de personnage en vie    
    func alive() -> Bool {
        return characters.contains(where: { character in
            return character.life > 0
        })
    }
    
    /////////////////////////////Fonction pour rappeler quels sont les noms des membres
    private func miniInfo() {
        for(index, character) in characters.enumerated() {
            if character.life == 0 {
                print("-\(index + 1) \(character.name) a 0 HP restant.Il est 💀")
            } else {
                print("-\(index + 1) \(character.name) avec \(character.life) HP restant.")
            }
        }
    }
    
    
    
    
    
    
}


