//
//  Deck.swift
//  ex02
//
//  Created by Vlad on 13.07.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

import Foundation

class Deck : NSObject {
    
    static let allSpades: [Card] = Value.allValues.map( {value in
        return Card(color: Color.Spade, value: value)
    })
    
    static let allDiamonds: [Card] = Value.allValues.map({
        return Card(color: Color.Diamond, value: $0)
    })
    
    static let allClubs: [Card] = Value.allValues.map{
        Card(color: Color.Club, value: $0)
    }
    
    static let allHearts: [Card] = Value.allValues.map{
        Card(color: Color.Heart, value: $0)
    }
    
    static let allCards: [Card] = Deck.allSpades + Deck.allDiamonds + Deck.allClubs + Deck.allHearts
}


extension Array {
    func mix() -> Array {
        var newArray: Array = []
        for i in startIndex ..< endIndex {
            let index = Int(arc4random_uniform(UInt32(newArray.count)))
            newArray.insert(self[i], at: index)
        }
        return newArray
    }
}
