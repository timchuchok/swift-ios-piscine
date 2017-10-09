//
//  Model.swift
//  d05
//
//  Created by Vladyslav Tymchenko on 06.10.17.
//  Copyright © 2017 Vladyslav Tymchenko. All rights reserved.
//

import Foundation
import CoreLocation

struct City {
    let title: String
    let subtitle: String
    let location: CLLocation
    
    static var cities =  [City(title: "42", subtitle: "Innovation IT school", location: CLLocation(latitude: 48.896922, longitude: 2.318486)),
                          City(title: "Kyiv", subtitle: "The best city in the world!!", location: CLLocation(latitude: 58.896922, longitude: 2.318486)),
                          City(title: "Paris", subtitle: "42 school", location: CLLocation(latitude: 68.896922, longitude: 2.318486)),
                          City(title: "New York", subtitle: "Usa", location: CLLocation(latitude: 78.896922, longitude: 2.318486)),
                          City(title: "London", subtitle: "Big Ban", location: CLLocation(latitude: 74.896922, longitude: 2.318486)),
                          City(title: "Berlin", subtitle: "City in Germany", location: CLLocation(latitude: 48.896922, longitude: 3.318486))]
}

