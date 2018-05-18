//
//  ViewController.swift
//  ConcetrationGame
//
//  Created by Horvath, Leon on 2018. 05. 17..
//  Copyright © 2018. Horvath, Leon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
lazy var game = Contetration(numberOfPairsOfCards: (cardButtons.count+1)/2)
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
@IBOutlet weak var flipCountLabel: UILabel!
@IBOutlet var cardButtons: [UIButton]!
    
@IBAction func touchCard(_ sender: UIButton)
{
        flipCount += 1;
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseaCard(at: cardNumber)
            updateViewFromMOdel()
        
            print("CardNumber: \(cardNumber)")
            }
        else {print("Chosen card was not in the cardButtons")
            
    }
    
}
    
func updateViewFromMOdel() {
    for index in cardButtons.indices {
        let button = cardButtons[index]
        let card = game.cards[index]
        if card.isFaceUp {
            button.setTitle(emoji(for: card), for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
    else
            {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor =  card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        }
    }
}
    var emojiChoices = ["👻","🎃","☎️","🧛‍♂️","🗝","🥥","🔓","🚜"]
    var emoji = [Int:String] ()
    func emoji (for card: Card) -> String
    {
        if emoji[card.indentifier] == nil ,emojiChoices.count > 0 {
        let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
        emoji[card.indentifier] = emojiChoices.remove(at: randomIndex)
        }
        
       return emoji[card.indentifier] ?? "?"
        
    }

}
