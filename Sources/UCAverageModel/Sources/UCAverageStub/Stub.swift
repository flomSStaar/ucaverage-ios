//
//  Stub.swift
//  
//
//  Created by etudiant on 25/05/2023.
//

import Foundation
import UCAverageModel

public func loadCourses() -> [Course] {
    var courses: [Course] = []
    
    let course1 = Course(withName: "Processus de développement", andCoef: 4, andMark: 19.04)
    let course2 = Course(withName: "Programmation Objets", andCoef: 9, andMark: 9.08)
    let course3 = Course(withName: "Qualité de développement", andCoef: 5, andMark: 13)
    let course4 = Course(withName: "Remise à niveau Objets", andCoef: 4, andMark: 12)
    
    courses.append(course1)
    courses.append(course2)
    courses.append(course3)
    courses.append(course4)
    
    return courses
}

public func loadUnits() -> [UCAUnit] {
    var ues: [UCAUnit] = []
    
    let course1 = Course(withName: "Processus de développement", andCoef: 4, andMark: 19.04)
    let course2 = Course(withName: "Programmation Objets", andCoef: 9, andMark: 9.08)
    let course3 = Course(withName: "Qualité de développement", andCoef: 5, andMark: 13)
    let course4 = Course(withName: "Remise à niveau Objets", andCoef: 4, andMark: 12)
    
    var ue1 = UCAUnit(withName: "UE1 Génie Logiciel", andCoef: 6)
    var ue2 = UCAUnit(withName: "UE2 Système et Réseaux", andCoef: 6)
    var ue3 = UCAUnit(withName: "UE3 Insertion professionnelle", andCoef: 6)
    let ue4 = UCAUnit(withName: "UE4 Technologies mobiles 1", andCoef: 9)
    
    ue1.courses.append(course1)
    ue1.courses.append(course2)
    ue1.courses.append(course3)
    ue1.courses.append(course4)
    ues.append(ue1)
    
    ue2.courses.append(course3)
    ue2.courses.append(course4)
    ues.append(ue2)
    
    ue3.courses.append(course1)
    ue3.courses.append(course2)
    ues.append(ue3)
    
    ues.append(ue4)
    
    return ues
}


public func loadBlocks() -> [Block] {
    var blocks: [Block] = []
    
    let course1 = Course(withName: "Processus de développement", andCoef: 4, andMark: 19.04)
    let course2 = Course(withName: "Programmation Objets", andCoef: 9, andMark: 9.08)
    let course3 = Course(withName: "Qualité de développement", andCoef: 5, andMark: 13)
    let course4 = Course(withName: "Remise à niveau Objets", andCoef: 4, andMark: 12)
    
    var ue1 = UCAUnit(withName: "UE1 Génie Logiciel", andCoef: 6)
    var ue2 = UCAUnit(withName: "UE2 Système et Réseaux", andCoef: 6)
    var ue3 = UCAUnit(withName: "UE3 Insertion professionnelle", andCoef: 6)
    let ue4 = UCAUnit(withName: "UE4 Technologies mobiles 1", andCoef: 9)
    
    ue1.courses.append(course1)
    ue1.courses.append(course2)
    ue1.courses.append(course3)
    ue1.courses.append(course4)
    
    ue2.courses.append(course3)
    ue2.courses.append(course4)
    
    ue3.courses.append(course1)
    ue3.courses.append(course2)
    
    var block1 = Block(withName: "Total")
    var block2 = Block(withName: "Projet/Stage")
    
    block1.units.append(ue1)
    block1.units.append(ue2)
    block1.units.append(ue3)
    
    block2.units.append(ue2)
    block2.units.append(ue4)
    
    
    blocks.append(block1)
    blocks.append(block2)
    
    return blocks
}

