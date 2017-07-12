//
//  Value.swift
//  ex00
//
//  Created by Vlad on 12.07.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

import Foundation

enum Value: Int {
    case  Ace = 1, Two, Three, Four, Five, Six, Seven, Eigth, Nine, Ten, Jack, Queen, King
    
    static let allValues: [Value] = [Two, Three, Four, Five, Six, Seven, Eigth, Nine, Ten, Jack, Queen, King, Ace]
}
