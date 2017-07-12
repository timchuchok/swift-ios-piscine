//
//  main.swift
//  ex00
//
//  Created by Vlad on 12.07.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

import Foundation

let colors: [Color] = Color.allColors

for color in colors {
    print(color.rawValue)
}

for value in Value.allValues {
    print("\(value) value is \(value.rawValue)")
}
