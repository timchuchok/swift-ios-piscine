//
//  main.swift
//  ex03
//
//  Created by Vlad on 13.07.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

import Foundation

var s = Deck.allCards.mix()
var i = 0
for card in s {
    print(card)
    i += 1
}
print(i)
