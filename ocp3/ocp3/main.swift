//
//  main.swift
//  ocp3
//
import Foundation
////////////////////////////////////// Fonction qui recupere ce que entre l'utilisateur
func input() -> String {
    if let str = readLine() {
        return str
    }
    return ""
}
////////////////////////////////////// Les variables utiles au programme
var choice: String?
var nameArray = [String]()
var name: String?
var counterPerso = ["premier" , "deuxième", "troisieme"]

////////////////////////////////////// Fonction pour créer les équipes
func makeTeam () {
    
    name = getTeamName()
    checkIfExist(name: name!)
    
    for index in 0...2 {
        var a:Int
        a = index
        repeat {
            print ("Choisissez la classe de votre \(counterPerso[a]) personnage: "
                + "\n1. Combattant"
                + "\n2. Mage"
                + "\n3. Colosse"
                + "\n4. Nain")
            choice = input()
            
        }  while choice! < "1" || choice! > "4"
        
        print("Veuillez choisir le nom du \(counterPerso[a]) perso")
        name = input()
        checkIfExist(name: name!)
    }
}
////////////////////////////////////// Fonction pour obtenir le nom de l'équipe
func getTeamName() -> String {
    print("Veuillez choisir le nom de votre équipe")
    if let name = readLine() {
        return name
    } else {
        print (" Veuillez recommencer")
        return getTeamName()
    }
}
////////////////////////////////////// Fonction qui verifie que le nom entré n'est pas déjà utilisé
func checkIfExist (name: String)  {
    if let index = nameArray.index(of: name){
        print("Veuillez choisir un autre nom car celui-ci est déjà pris")
    }else{
        nameArray.append(name)
    }
}
////////////////////////////////////// Test de bon fonctionnement
makeTeam()  //// equipe 1
makeTeam()  //// equipe 2

print (nameArray)




