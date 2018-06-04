//
//  Concetration.swift
//  ConcetrationGame
//
//  Created by Horvath, Leon on 2018. 05. 17..
//  Copyright © 2018. Horvath, Leon. All rights reserved.
//

import Foundation


struct Contetration
{
    private(set) var cards = [Card]()
    var indexOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices{
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
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
    
    
   mutating func chooseaCard(at Index: Int) {
        assert(cards.indices.contains(Index),"Concetration.Choosecard (at: \(Index)) chosen index is not in the cards ")
        if !cards[Index].isMatched {
            if let matchIndex = indexOneAndOnlyFaceUpCard, matchIndex != Index{
                if cards[matchIndex] == cards[Index]{
                    cards[matchIndex].isMatched = true
                    cards[Index].isMatched = true
                }
                    cards[Index].isFaceUp = true
                } else {
                 
                    indexOneAndOnlyFaceUpCard = Index
            }
            }
        }
    
    init(numberOfPairsOfCards: Int){
        assert(numberOfPairsOfCards > 0,"Concetration.init (at: \(numberOfPairsOfCards)) you must have at least one pair of cards ")
        for _ in 0...numberOfPairsOfCards{
            let card = Card()
            cards.append(card)
            cards.append(card)
        }
    }
    

    
}
