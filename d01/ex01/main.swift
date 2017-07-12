//
//  main.swift
//  ex01
//
//  Created by Vlad on 12.07.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

import Foundation

let card1 = Card(color:Color.Spade, value: Value.Ace)
print(card1)

let card2 = Card(color:Color.Diamond, value:Value.Two)
print(card2)

print(card1 == card2)

let card3 = Card(color:Color.Spade, value: Value.Ace)
print(card3)

let card4 = Card(color:Color.Spade, value:Value.Ace)
print(card4)

print(card3 == card4)
