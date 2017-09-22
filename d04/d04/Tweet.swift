//
//  Tweet.swift
//  d04
//
//  Created by Vladyslav Tymchenko on 23.08.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

import Foundation

struct Tweet : CustomStringConvertible {
    
    let name: String
    
    let text: String
    
    let date: String
    
    var description: String {
        get {
            return "name: \(name), text: \(text), date: \(date)"
        }
    }
}
