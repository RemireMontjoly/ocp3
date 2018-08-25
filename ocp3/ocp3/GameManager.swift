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
    ///////////////////////////////////Fonctions pour gerer les combats /////////////////////////////////////////
    func attack(attacker: Character, target: Character) {
        target.damage(from: attacker)
        print("\(attacker.name) a attaqué \(target.name).Il lui reste \(target.life) hp.")
    }
    
    //////////////////////////////////Fonction pour soigner un membre de son équipe
    func heal (healer: Character, teamMate: Character) {
        teamMate.health(from: healer)
        print("\(healer.name) a soigné \(teamMate.name) , qui a désormais \(teamMate.life) hp.")
    }
    
    ///////////////////////////////////Fonction qui permet de faire une boucle jusqu'à ce qu'il y ait un vainqueur
    func play() {
        repeat {
            var player1 = team1!
            var player2 = team2!
            let attacker1 = player1.chooseAttacker()
            if attacker1.type == .Mage {
                let hurtMate = player1.chooseWhoToHeal()   /////Fonction qui permet de choisir quel équipier le  mage veut soigner(y compris lui-même)
                heal(healer: attacker1, teamMate: hurtMate)     
            } else {
                let targetTeam2 = player2.chooseTarget()
                attack(attacker: attacker1, target: targetTeam2)
            }
            let attacker2 = player2.chooseAttacker()
            if attacker2.type == .Mage {
                let hurtMate = player2.chooseWhoToHeal()
                heal(healer: attacker2, teamMate: hurtMate)
            } else { let targetTeam1 = player1.chooseTarget()
                attack(attacker: attacker2, target: targetTeam1)
            }
            swap(&player1, &player2)
            
        } while team1!.alive() == true && team2!.alive() == true
    }
    
    func announceWinner() {
        if team1!.alive() == false {
            print("L'équipe \(team2!.name) a gagné! ")
        } else {
            print("L'équipe \(team1!.name) a gagné! ")
        }
    }
    
}





