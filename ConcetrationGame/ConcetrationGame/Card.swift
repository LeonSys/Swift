//
//  Card.swift
//  ConcetrationGame
//
//  Created by Horvath, Leon on 2018. 05. 17..
//  Copyright © 2018. Horvath, Leon. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var indentifier: Int
   static  var indentifierFactory = 0
    
    static func getUniqueIndentifier() -> Int {
        Card.indentifierFactory += 1
        return indentifierFactory
    }
    
    init() {
        self.indentifier = Card.getUniqueIndentifier()
    }
}
