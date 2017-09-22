//
//  APITwitterDelegate.swift
//  d04
//
//  Created by Vladyslav Tymchenko on 23.08.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

import Foundation

protocol APITwitterDelegate : class {
    
    func takeTweets(tweets: [Tweet])
    
    func error(error: NSError)
    
}
