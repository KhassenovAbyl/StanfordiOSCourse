//
//  ViewController.swift
//  StanfordiOSCourse
//
//  Created by Abylbek Khassenov on 23.02.2021.
//

import UIKit

class ViewController: UIViewController {

    private lazy var game = Concentration(numberOfPairsOfCards: (cardButttons.count + 1) / 2)
    
    private(set) var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flip: \(flipCount)"
        }
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBOutlet private var cardButttons: [UIButton]!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumeber = cardButttons.firstIndex(of: sender){
            game.chooseCard(at: cardNumeber)
            updateViewFromModel()
        } else {
            print("Card not in cardButton")
        }
    }
    
    @IBAction private func restartButton(_ sender: UIButton) {
        game.restartGame()
        updateViewFromModel()
        flipCount = 0
    }
    
    
    private func updateViewFromModel(){
        for index in cardButttons.indices{
            let button = cardButttons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for : card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
            }
        }
    }
    
    //private var emojiChoises = ["🚗","🎮","🎈","🖤","🔋","❣️","🏄🏾‍♂️","☃️" ,"🍌"]
    private var emojiChoises = "🚗🎮🎈🖤🔋❣️🏄🏾‍♂️☃️🍌"
    
    private var emoji = [Int:String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil , emojiChoises.count > 0{
            let randomStringIndex = emojiChoises.index(emojiChoises.startIndex, offsetBy: emojiChoises.count.arc4random)
            emoji[card.identifier] = String(emojiChoises.remove(at: randomStringIndex))
        }
        return emoji[card.identifier] ?? "?"
    }
}

extension Int{
    var arc4random: Int{
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}

