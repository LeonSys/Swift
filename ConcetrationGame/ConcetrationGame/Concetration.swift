//
//  Concetration.swift
//  ConcetrationGame
//
//  Created by Horvath, Leon on 2018. 05. 17..
//  Copyright © 2018. Horvath, Leon. All rights reserved.
//

import Foundation


class Contetration
{
    var cards = [Card]()
    var indexOneAndOnlyFaceUpCard: Int?
    
    
    func chooseaCard(at Index: Int) {
        if !cards[Index].isMatched {
            if let matchIndex = indexOneAndOnlyFaceUpCard, matchIndex != Index{
                if cards[matchIndex].indentifier == cards[Index].indentifier{
                    cards[matchIndex].isMatched = true
                    cards[Index].isMatched = true
                }
                    cards[Index].isFaceUp = true
                    indexOneAndOnlyFaceUpCard = nil
                } else {
                    for flipDownIndex in cards.indices {
                        cards[flipDownIndex].isFaceUp = false
                    }
                    cards[Index].isFaceUp = true
                    indexOneAndOnlyFaceUpCard = Index
            }
            }
        }
    
    init(numberOfPairsOfCards: Int){
        for _ in 0...numberOfPairsOfCards{
            let card = Card()
            cards.append(card)
            cards.append(card)
        }
    }

}
