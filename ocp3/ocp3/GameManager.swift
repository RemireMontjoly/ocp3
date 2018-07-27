//
//  GameManager.swift
//  ocp3
//
//  Created by pith on 25/07/2018.
//  Copyright © 2018 dino. All rights reserved.
//
import Foundation
////////////////////////////////////////////////////// Les variables utiles au programme
var choice = ""
var name = ""
var nameArray = [String]()
var typeArray = [String]()
var counterPerso = ["premier" , "deuxième", "troisieme"]
var team1 = Team()
var character1 = Character()
var character2 = Character()
var character3 = Character()
/////////////////////////////////////////////////////// Fonction qui recupere ce que entre l'utilisateur
func input() -> String {
    if let str = readLine() {
        return str
    }
    return ""
}
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
////////////////////////////////////////////////////// Fonction pour obtenir le nom de l'équipe
func getTeamName() -> String {
    print("Veuillez choisir le nom de votre équipe")
    if let name = readLine() {
        checkIfExist(name: name)
        return name
    } else {
        return getTeamName()
    }
}
///////////////////////////////////////////////// Fonction pour choisir le type de ses personnages
func chooseType() -> String {
    for index in 0...2 {
        
        let a = index
        repeat {
            print ("Choisissez la classe de votre \(counterPerso[a]) personnage: "
                + "\n1. Combattant"
                + "\n2. Mage"
                + "\n3. Colosse"
                + "\n4. Nain")
            choice = input()
            
        }  while choice < "1" || choice > "4"
        typeArray.append(choice)
    }
    return choice
}
//////////////////////////////////////////////////////// Fonction pour choisir les noms de ses personnages
func chooseName() -> String {
    for type in typeArray{
        
        if type == "1"{
            print("Veuillez choisir le nom du combattant:")
        } else if type == "2"{
            print("Veuillez choisir le nom du mage")
        } else if type == "3"{
            print("Veuillez choisir le nom du colosse")
        } else if type == "4" {
            print("Veuillez choisir le nom du nain")
        } else {
            print("Une erreur est survenue")
        }
        name = input()
        checkIfExist(name: name)
    }
    return name
}
////////////////////////////////////////////////////// Fonction pour créer les équipes
func makeTeam () {
    name = getTeamName()
    team1.name = name
    chooseType()
    character1.type = typeArray[0]
    character2.type = typeArray[1]
    character3.type = typeArray[0]
    chooseName()
    character1.name = nameArray[0]
    character2.name = nameArray[1]
    character3.name = nameArray[2]
    
    
    team1.characters.append(character1)
    team1.characters.append(character2)
    team1.characters.append(character3)
}




