//
//  main.swift
//  ocp3
//
//  Created by pith on 21/07/2018.
//  Copyright © 2018 dino. All rights reserved.
//
// commentaire
import Foundation

// Fonction permettant de demander à l'utilisateur d'entrer un choix (de type String)

func input() -> String {
    let str = readLine()
    return str!
}

//Presentation du menu pour constituer les équipes

print("Equipe 1: ")

func fabEquipe () {                              //Fonction pour creer une equipe
    
    print("Choisissez le nom de votre équipe: ")   //Les variables necessaires pour constituer l'équipe
    var nomEquipe = input()
    var choice: String
    var counter = 0
    var counterPerso: String?
    while counter < 3 {
        if counter == 0 {counterPerso = "premier"         //Pour changer la phrase afin quelle corresponde à l'ordre
        }                                                 // des personnages.
        if counter == 1 { counterPerso = "deuxième"
        }
        else if counter == 2 {counterPerso = "troisième"
        }
        
        repeat {
            print ("Choisissez la classe de votre \(counterPerso!) personnage: "
                + "\n1. Combattant"
                + "\n2. Mage"
                + "\n3. Colosse"
                + "\n4. Nain")
            choice = input()
        }  while choice < "1" || choice > "4"
        
        print("Choisissez son nom: ")
        var nomPerso = input()
        counter += 1
    }
}
fabEquipe()                                       //Appel de la fonction pour creer la premiere equipe
print("Equipe 2: ")
fabEquipe()                                       //Appel de la fonction pour creer la deuxieme equipe





