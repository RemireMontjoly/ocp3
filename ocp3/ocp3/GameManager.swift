//
//  GameManager.swift
//  ocp3
//
//  Created by pith on 25/07/2018.
//  Copyright © 2018 dino. All rights reserved.
//
import Foundation


class GameManager {
    
    ////////////////////////////////////////////////////// Les variables utiles au programme
    var teamNames = [String]()
    var characterNames = [String]()
    var team1: Team?
    var team2: Team?
    
    ////////////////////////////////////////////////////////////////// Fonction pour obtenir le nom de l'équipe
    func getTeamName() -> String {
        print("Veuillez choisir le nom de votre équipe")
        if let name = readLine() {
            if teamNames.contains(name) {
                print("Veuillez choisir un autre nom car celui-ci est déjà pris")
                return getTeamName()
            } else {
                teamNames.append(name)
                return name
            }
        } else {
            return getTeamName()
        }
    }
    
    /////////////////////////////////////////////////////////////// Fonction pour choisir le type des personnages
    func getCharacterType() -> CharacterType {
        
        print ("Choisissez la classe de votre personnage: "
            + "\n1. Combattant"
            + "\n2. Mage"
            + "\n3. Colosse"
            + "\n4. Nain")
        if let choice = readLine(),
            let rawValue = Int(choice),
            let characterType = CharacterType.init(rawValue: rawValue) {
            return characterType
        } else {
            print("Veuillez choisir entre 1 et 4 ")
            return getCharacterType()
        }
    }
    
    //////////////////////////////////////////////////////////////// Fonction pour choisir les noms des personnages
    func getCharacterName() -> String {
        print("Choisissez son nom: ")
        if let name = readLine(){
            if characterNames.contains(name) {
                print("Veuillez choisir un autre nom car celui-ci est déjà pris")
                return getCharacterName()
            } else {
                characterNames.append(name)
                return name
            }
        } else {
            return getCharacterName()
        }
    }
    
    ///////////////////////////////////////////////////////////////// Fonction pour créer un personnage(type + nom)
    func makeCharacter() -> Character {
        
        let characterType = getCharacterType()
        let characterName = getCharacterName()
        let character = Character(type: characterType, name: characterName)
        return character
    }
    
    ///////////////////////////////////////////////////////// Fonction pour créer les équipes
    func makeTeam () -> Team {
        let teamName = getTeamName()
        var characterTeam = [Character]()
        for _ in 1...3 {
            let character = makeCharacter()
            characterTeam.append(character)
        }
        let team = Team(name: teamName, characters: characterTeam)
        return team
    }
    
    /////////////////////////////////////////////////////////////// Fonction pour initialiser le jeux
    func gameInit() {
        team1 = makeTeam()
        team1?.teamInfo()
        team2 = makeTeam()
        team2?.teamInfo()
    }
 
    //////////////////////////////////////////////////////Fonctions pour gerer les combats /////////////////////////////////////////
    //////////////////Fonction qui permet de choisir avec quel personnage on attaque
    func chooseAttacker (team: Team) -> Character {
        var i: Int
        repeat {
        print("")
        print("Equipe \(team.name) veuillez choisir un de vos personnages pour passer à l'action (de 1 à 3)")
        team.beforPlay()
        let choice = readLine()
            i = Int(choice!)!
        } while i < 1 || i > 3
        let attacker = team.characters[1-i]  //////// i-1 car le tableau de [character] demarre à 0.Du coup ça correspond pas au choix (1 à 3)
        return attacker
    }
    /////////////////Fonction qui permet de choisir quel personnage on va attaquer
    func chooseTarget(team: Team) -> Character {
        var i: Int
        repeat {
            print("Veuillez choisir le personnage à attaquer (de 1 à 3)")
            team.beforPlay()
            let choice = readLine()
            i = Int(choice!)!
        } while i < 1 || i > 3
            let target = team.characters[1-i]
        return target
    }
    ///////////////Fonction qui affiche le resultat team1 vs team2
    
    
    func attack() {
        let charAttacker = chooseAttacker(team: team1!)
        let charTarget = chooseTarget(team: team2!)
            charTarget.damage(attacker: charAttacker)
            print("\(charAttacker.name) a attaqué \(charTarget.name).Il lui reste  \(charTarget.life) hp.")
        }
    //////////////Fonction qui affiche le resultat team2 vs team1
    func counterAttack() {
        let charAttacker = chooseAttacker(team: team2!)
        let charTarget = chooseTarget(team: team1!)
        charTarget.damage(attacker: charAttacker)
        print("\(charAttacker.name) a attaqué \(charTarget.name).Il lui reste  \(charTarget.life) hp.")
    }
    
   
                
    
    
    
    
    
}

    
    
    
    
    
    
    
    
    
    
   
        
       

    
    
    
    
    
    
    
        





























