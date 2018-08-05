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
    var nameArray = [String]()
    //    var typeArray = [String]()
    var team1: Team?
    var team2: Team?
    
    /////////////////////////////////////////////////////// Fonction qui verifie que le nom entré n'est pas déjà utilisé
    func checkIfExist (name: String)  {
        if let index = nameArray.index(of: name){
            print("Veuillez choisir un autre nom car celui-ci est déjà pris")
            if let name = readLine() {
                checkIfExist(name: name)
            }
        }else{
            nameArray.append(name)
        }
    }
    ////////////////////////////////////////////////////////////////// Fonction pour obtenir le nom de l'équipe
    func getTeamName() -> String {
        print("Veuillez choisir le nom de votre équipe")
        if let name = readLine() {
            checkIfExist(name: name)
            return name
        } else {
            return getTeamName()
        }
    }
    /////////////////////////////////////////////////////////////// Fonction pour choisir le type des personnages
    func getCharacterType() -> String {
        print ("Choisissez la classe de votre personnage: "
            + "\n1. Combattant"
            + "\n2. Mage"
            + "\n3. Colosse"
            + "\n4. Nain")
        if let choice = readLine(){
            if choice < "1" || choice > "4" {
                print("Veuillez choisir entre 1 et 4 ")
                return  getCharacterType()
            }
            return choice
        } else {
            return getCharacterType()
        }
    }
    //////////////////////////////////////////////////////////////// Fonction pour choisir les noms des personnages
    func getCharacterName() -> String {
        print("Choisissez son nom: ")
        if let name = readLine(){
            checkIfExist(name: name)
            return name
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
        // team2 = makeTeam()
        
    }
    
}



