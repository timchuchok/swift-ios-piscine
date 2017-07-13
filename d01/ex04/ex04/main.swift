//
//  main.swift
//  ex04
//
//  Created by Vlad on 13.07.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

import Foundation

var d: Deck = Deck(mix: false)
print(d.description)

var card1 = d.draw()

print(d.outs)
if let c = card1 {
    print(c)
}
else {
    print("Error")
}
if let c = card1 {
    d.fold(card: card1!)
    print(d.discards)
    print(d.outs)
}
else {
    print("Error")
}
