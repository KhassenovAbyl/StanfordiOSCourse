//
//  Concentration.swift
//  StanfordiOSCourse
//
//  Created by Abylbek Khassenov on 24.02.2021.
//

import Foundation

class Concentration
{
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices{
                if cards[index].isFaceUp{
                    foundIndex = index
                } else {
                    return nil
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int){
        assert(cards.indices.contains(index) , "Concentraition.chooseCard(at: \(index): choosen card is not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard , matchIndex != index {
                if cards[index].identifier == cards[matchIndex].identifier {
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    func restartGame(){
        for card in cards.indices{
            cards[card].isFaceUp = false
            cards[card].isMatched = false
        }
        cards.shuffle()
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0 , "init(numberOfPairsOfCards: \(numberOfPairsOfCards) you must have at least 1 pair of card")
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card , card]
        }
        cards.shuffle()
    }
}
