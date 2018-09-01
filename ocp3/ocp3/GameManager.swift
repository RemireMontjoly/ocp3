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
    var countRound = 0
    var countDamageTeam1 = 0
    var countDamageTeam2 = 0
    var countHealthTeam1 = 0
    var countHealthTeam2 = 0
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
    func attack(attacker: Character, target: Character) -> Int {
        target.damage(from: attacker)
        print("\(attacker.name) a attaqué \(target.name).Il lui reste \(target.life) hp.")
        return attacker.damage
    }
    
    //////////////////////////////////Fonction pour soigner un membre de son équipe
    func heal (healer: Character, teamMate: Character) -> Int {
        teamMate.health(from: healer)
        print("\(healer.name) a soigné \(teamMate.name) , qui a désormais \(teamMate.life) hp.")
        return healer.heal
    }
    //////////////////////////////////////Fonction pour l'apparition aléatoire du coffre
    
    func chestAppear(char: Character) {
        let hazard = Int(arc4random_uniform(2))
        if hazard == 0 {
            print("")
        } else {
            if char.type == .Mage {
                char.heal = char.weapon.damage            ///Si c'est le Mage , on transforme les points de dommage en points de vie.
            } else {
                char.damage = char.weapon.damage
            }
            print("Un coffre vient d'apparaitre.\(char.name) l'ouvre est découvre une nouvelle arme nommée \(char.weapon.name) et s'en équipe.")
        }
    }
    
    ///////////////////////////////////Fonction qui permet de faire une boucle jusqu'à ce qu'il y ait un vainqueur
    func play() {
        repeat {
            var player1 = team1!
            var player2 = team2!
            let attacker1 = player1.chooseAttacker()
            chestAppear(char: attacker1)                     //Fait apparaitre le coffre ou pas
            if attacker1.type == .Mage {
                let hurtMate = player1.chooseWhoToHeal()   //Fonction qui permet de choisir quel équipier le mage
                countHealthTeam1 += heal(healer: attacker1, teamMate: hurtMate)//  va soigner (y compris lui-même)
            } else {                                                           // et incremente la func gameStat
                let targetTeam2 = player2.chooseTarget()
                countDamageTeam1 += attack(attacker: attacker1, target: targetTeam2) //Pour la func gameStat
            }
            let attacker2 = player2.chooseAttacker()
            chestAppear(char: attacker2)                     //Fait apparaitre le coffre ou pas
            if attacker2.type == .Mage {
                let hurtMate = player2.chooseWhoToHeal()
                countHealthTeam2 += heal(healer: attacker2, teamMate: hurtMate)     //Pour la func gameStat
            } else {
                let targetTeam1 = player1.chooseTarget()
                countDamageTeam2 += attack(attacker: attacker2, target: targetTeam1)
            }
            countRound += 1                       //Pour la fonction gameStat;affichera le nbr de round de la partie
            swap(&player1, &player2)
        } while team1!.alive() == true && team2!.alive() == true
    }
    
    /////////////////////////////////////////////Fonction pour annoncer l'équipe gagnante
    func announceWinner() {
        if team1!.alive() == false {
            print("L'équipe \(team1!.name) a gagné!")
        } else {
            print("L'équipe \(team2!.name) a gagné!")
        }
    }
    
    ///////////////////////////////////////////////Fonction pour afficher les stats de la partie
    func gameStat() {
        print("La partie a durée \(countRound) rounds.")
        print("L'équipe \(team1!.name) a généré \(countDamageTeam1) HP de dommage et \(countHealthTeam1) HP de soin.")
        print("L'équipe \(team2!.name) a généré \(countDamageTeam2) HP de dommage et \(countHealthTeam2) HP de soin.")
    }
    
    
    
}
