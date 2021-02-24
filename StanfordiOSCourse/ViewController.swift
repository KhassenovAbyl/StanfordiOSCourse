//
//  ViewController.swift
//  StanfordiOSCourse
//
//  Created by Abylbek Khassenov on 23.02.2021.
//

import UIKit

class ViewController: UIViewController {

    var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flip: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButttons: [UIButton]!
    
    var emojiChoises = ["🚗","🎮","🎈","🖤"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumeber = cardButttons.firstIndex(of: sender){
            flipCard(withEmoji: emojiChoises[cardNumeber], on: sender)
        } else {
            print("Card not in cardButton")
        }
    }
    
    func flipCard(withEmoji emoji: String , on button: UIButton){
        if button.currentTitle == emoji{
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
}

