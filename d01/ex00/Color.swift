//
//  Color.swift
//  ex00
//
//  Created by Vlad on 12.07.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

import Foundation

enum Color: String {
    case Diamonds = "diamonds"
    case Clubs = "clubs"
    case Hearts = "hearts"
    case Spades = "spades"
    
    static let allColors: [Color] = [Diamonds, Clubs, Hearts, Spades]
}
