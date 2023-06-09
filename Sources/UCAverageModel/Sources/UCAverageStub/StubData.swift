//
//  File.swift
//  
//
//  Created by etudiant on 06/06/2023.
//

import Foundation
import UCAverageModel

/// =============================== Units ===============================

// UE1
var unit1 = UCAUnit(withName: "UE 1 : Génie Logiciel", andCoef: 6, andCourses: [
    Course(withName: "Processus de développement", andCoef: 4, andMark: 10),
    Course(withName: "Programmation Objets", andCoef: 9, andMark: 10),
    Course(withName: "Qualité de développement", andCoef: 5, andMark: 10),
    Course(withName: "Remise à niveau Objets", andCoef: 4, andMark: 10)
])

// UE2
var unit2 = UCAUnit(withName: "UE 2 : Systèmes et réseaux", andCoef: 6, andCourses: [
    Course(withName: "Internet des Objets", andCoef: 4, andMark: 10),
    Course(withName: "Réseaux", andCoef: 4, andMark: 10),
    Course(withName: "Services Mobiles", andCoef: 4, andMark: 10),
    Course(withName: "Système", andCoef: 5, andMark: 10)
])

// UE3
var unit3 = UCAUnit(withName: "UE 3 : Insertion Professionnelle", andCoef: 6, andCourses: [
    Course(withName: "Anglais", andCoef: 5, andMark: 10),
    Course(withName: "Economie", andCoef: 4, andMark: 10),
    Course(withName: "Gestion", andCoef: 3, andMark: 10),
    Course(withName: "Communication", andCoef: 4, andMark: 10)
])

// UE4
var unit4 = UCAUnit(withName: "UE 4 : Technologies Mobiles 1", andCoef: 9, andCourses: [
    Course(withName: "Android", andCoef: 6, andMark: 10),
    Course(withName: "Architecture de projets C# .NET (1)", andCoef: 5, andMark: 10),
    Course(withName: "C++", andCoef: 4, andMark: 10),
    Course(withName: "Swift", andCoef: 5, andMark: 10)
])

// UE5
var unit5 = UCAUnit(withName: "UE 5 : Technologies Mobiles 2", andCoef: 9, andCourses: [
    Course(withName: "Architecture de projets C# .NET (2)", andCoef: 4, andMark: 10),
    Course(withName: "Client/Serveur", andCoef: 4, andMark: 10),
    Course(withName: "iOS", andCoef: 5, andMark: 10),
    Course(withName: "Multiplateformes", andCoef: 3, andMark: 10),
    Course(withName: "QT Quick", andCoef: 5, andMark: 10),
    Course(withName: "Xamarin", andCoef: 5, andMark: 10)
])

// UE6
var unit6 = UCAUnit(withName: "UE 6 : Projet", andCoef: 1, andCourses: [
    Course(withName: "Projet", andCoef: 1, andMark: 10)
])

// UE7
var unit7 = UCAUnit(withName: "UE 7 : Stage", andCoef: 1, andCourses: [
    Course(withName: "Stage", andCoef: 1, andMark: 10)
])

/// =============================== Blocks ===============================

// Block Total
var block1 = Block(withName: "Total", andUnits: [
    unit1, unit2, unit3, unit4, unit5, unit6, unit7
])

// Block Stage
var block2 = Block(withName: "Projet/Stage", andUnits: [
    unit6, unit7
])
