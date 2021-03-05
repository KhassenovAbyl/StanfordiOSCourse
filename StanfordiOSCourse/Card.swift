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
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}

