//
//  Card.swift
//  ex01
//
//  Created by Vlad on 12.07.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

import Foundation

class Card : NSObject {
    
    var value: Value
    var color: Color
    
    override var description: String {
        return "\(value.rawValue), \(color)"
    }
    
    init(color: Color, value: Value) {
        self.value = value
        self.color = color
    }
    
    override func isEqual(_ cardToCompare: Any?) -> Bool {
        return (cardToCompare as? Card)?.value == self.value && (cardToCompare as? Card)?.color == self.color
    }
    
    static func == (card1: Card, card2: Card) -> Bool {
        return card1.color == card2.color && card1.value == card2.value
    }
}
