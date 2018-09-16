//
//  GameManager.swift
//  ocp3
//
//  Created by pith on 25/07/2018.
//  Copyright © 2018 dino. All rights reserved.
//
import Foundation


/// Class will manage the game with dedicated functions
class GameManager {
    
    /////Globals variables of the class
    var teamNames = [String]()            //Array which will allows to check if the choosen team name is unique
    var characterNames = [String]()       //Array which will allows to check if the choosen character name is unique
    var team1: Team?
    var team2: Team?
    var countRound = 0                    //For the stats at the end of the game
    var countDamageTeam = 0               //For the stats at the end of the game
    var countHealthTeam = 0               //For the stats at the end of the game
    
    /// Function used for asking and getting the name of the team.
    ///
    /// - Returns: return name choosen by players
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
        
    /// Function used for asking and getting the character's type of each team's members
    ///
    /// - Returns: the character's type choosen by players
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
    
    /// Function used to choose the character's name of each team's members
    ///
    /// - Returns: Character's name choosen by players
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
    
    /// Function used to create a complete character (Type + Name)
    ///
    /// - Returns: An instance of Class Character for each characters built with previous functions.
    func makeCharacter() -> Character {
        
        let characterType = getCharacterType()
        let characterName = getCharacterName()
        let character = Character(type: characterType, name: characterName)
        return character
    }
    
    /// Function used to create a complete team (3 characters)
    ///
    /// - Returns: An instance of Class Team
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
    
    /// Function which will create team1 and team2 and display teams' informations.
    func gameInit() {
        team1 = makeTeam()
        team1?.teamInfo()
        team2 = makeTeam()
        team2?.teamInfo()
    }
    ///////////////////////////////////Funtions for managing the fight /////////////////////////////////////////
    
    
    /// Function called to attack a choosen character of the opposite team.Used in func play()
    ///
    /// - Parameters:
    ///   - attacker: Player will choose one of the three characters of his team.This func is in Class Team
    ///   - target: Player will choose one of the three characters of the opposite team to attack.This func is in Class Team
    /// - Returns: Damage points of the attacker.
    func attack(attacker: Character, target: Character) -> Int {
        target.damage(from: attacker)
        print("\(attacker.name) a attaqué \(target.name).Il lui reste \(target.life) hp.")
        return attacker.weapon.damage
    }
    
    /// Function for the Mage.In order to heal teammate.
    ///
    /// - Parameters:
    ///   - healer: Will be the Mage
    ///   - teamMate: Character of the team choosen by player in order to be healed.
    /// - Returns: Health points of the Mage
    func heal (healer: Character, teamMate: Character) -> Int {
        teamMate.health(from: healer)
        print("\(healer.name) a soigné \(teamMate.name) , qui a désormais \(teamMate.life) hp.")
        return healer.weapon.heal
    }
    
    /// Function for the random chest
    ///
    /// - Parameter char: If chest appear for the Mage, new weapon will provide health points instead of damage.
    func chestAppear(char: Character) {
        let hazard = Int(arc4random_uniform(2))
        if hazard == 0 {
            print("")
        } else {
            char.equipeNewWeapon()
            print("Un coffre vient d'apparaitre.\(char.name) l'ouvre est découvre une nouvelle arme nommée \(char.weapon.name) et s'en équipe.")
        }
    }
    
    /// This function will loop till there's a winner.
    
    func play() {
      guard var player1 = team1,
            var player2 = team2
            else { return }
        
        repeat {
            let attacker1 = player1.chooseAttacker()
            chestAppear(char: attacker1)                     //Fait apparaitre le coffre ou pas
            if attacker1.type == .Mage {
                let hurtMate = player1.chooseWhoToHeal()   //Fonction qui permet de choisir quel équipier le mage
                countHealthTeam += heal(healer: attacker1, teamMate: hurtMate)//  va soigner (y compris lui-même)
                player1.countHealth = countHealthTeam
            } else {                                                           // et incremente la func gameStat
                let targetTeam2 = player2.chooseTarget()
                countDamageTeam += attack(attacker: attacker1, target: targetTeam2) //Pour la func gameStat
                player1.countDamage = countDamageTeam
            }
            swap(&player1, &player2)
            countRound += 1
        } while player1.alive() == true && player2.alive() == true
    }
    
    /// Will announce which team has won.
    func announceWinner() {
      guard let player1 = team1,
            let player2 = team2
            else { return }
        if player1.alive() == false {
            print("L'équipe \(player2.name) a gagné!")
        } else {
            print("L'équipe \(player1.name) a gagné!")
        }
    }
    
    /// For the bonus : Stats of the game.How much rounds , damage and health points.
    func gameStat() {
      guard let player1 = team1,
            let player2 = team2
            else { return }
        
        print("La partie a durée \(countRound) rounds.")
        print("L'équipe \(player1.name) a généré \(player1.countDamage) HP de dommage et \(player1.countHealth) HP de soin.")
        print("L'équipe \(player2.name) a généré \(player2.countDamage) HP de dommage et \(player2.countHealth) HP de soin.")
    }
    
    
    
}
