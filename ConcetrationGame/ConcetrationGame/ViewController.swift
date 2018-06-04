//
//  ViewController.swift
//  ConcetrationGame
//
//  Created by Horvath, Leon on 2018. 05. 17..
//  Copyright © 2018. Horvath, Leon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
private lazy var game = Contetration(numberOfPairsOfCards: numberOfPairsOfCards)
    var  numberOfPairsOfCards: Int{
        return (cardButtons.count+1)/2
    }
    
  private(set)  var flipCount = 0 {
        didSet {
            updateFlipCount()
            
    }
        }
    
    private func updateFlipCount() {
    let attributes: [NSAttributedStringKey: Any] = [.strokeWidth : 5.0,
    .strokeColor : UIColor .orange ]
    let attributedString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attributes)
    flipCountLabel.attributedText = attributedString
    }
    
@IBOutlet private weak var flipCountLabel: UILabel!
@IBOutlet private var cardButtons: [UIButton]!
    
@IBAction private func touchCard(_ sender: UIButton)
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
    
private func updateViewFromMOdel() {
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
            button.backgroundColor =  card.isMatched ? #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        }
    }
}
  // private var emojiChoices = ["👻","🎃","☎️","🧛‍♂️","🗝","🥥","🔓","🎀"]
   private var emojiChoices = "👻🎃☎️🧛‍♂️🗝🥥🔓🎀"

   private var emoji = [Card:String] ()
   private func emoji (for card: Card) -> String
    {
        if emoji[card] == nil ,emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy:emojiChoices.count.arc4random )
        emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
        
       return emoji[card] ?? "?"
        
    }
    
}

extension Int{
    var arc4random: Int {
        if self > 0 {
        return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
        return -Int(arc4random_uniform(UInt32(abs(self))))
        }
     else {
    return 0
    }
    }
}
