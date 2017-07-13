//
//  Color.swift
//  ex00
//
//  Created by Vlad on 12.07.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

import Foundation

enum Color: String {
    case Diamond = "diamond"
    case Club = "club"
    case Heart = "heart"
    case Spade = "spade"
    
    static let allColors: [Color] = [Diamond, Club, Heart, Spade]
}
