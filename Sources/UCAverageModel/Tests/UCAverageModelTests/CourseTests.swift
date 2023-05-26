//
//  CourseTests.swift
//  
//
//  Created by etudiant on 26/05/2023.
//

import XCTest
import UCAverageModel

final class CourseTests: XCTestCase {
    func testInitWithId() throws {
        
        func expect(withId id: UUID, andName name: String, andCoef coef: Int, andMark mark: Float) {
            let course = Course(withId: id, andName: name, andCoef: coef, andMark: mark)
            
            XCTAssertNotNil(course)
            
            XCTAssertEqual(id, course.id)
            XCTAssertEqual(name, course.name)
            XCTAssertEqual(coef, course.coef)
            XCTAssertEqual(mark, course.mark)
        }
        
        
        expect(withId: UUID(), andName: "Programmation Objets", andCoef: 9, andMark: 13.6)
        expect(withId: UUID(), andName: "Qualité de développpement", andCoef: 6, andMark: 3.9)
    }
}

