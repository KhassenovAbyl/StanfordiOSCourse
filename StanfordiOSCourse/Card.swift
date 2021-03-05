//
//  Card.swift
//  StanfordiOSCourse
//
//  Created by Abylbek Khassenov on 24.02.2021.
//

import Foundation

struct Card
{
    var isMatched = false
    var isFaceUp = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}

