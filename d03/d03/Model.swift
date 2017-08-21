//
//  Model.swift
//  d03
//
//  Created by Vlad on 11.08.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

import Foundation

struct MyData {
    static let urls: [(String, String)] = [("First image", "https://www.nasa.gov/sites/default/files/thumbnails/image/ic10_optical_xray.jpg"),
                                           ("Second image", "https://www.nasa.gov/sites/default/files/thumbnails/image/iss052e008757_lrg.jpg"),
                                           ("Third image", "https://www.nasa.gov/sites/default/files/thumbnails/image/iss052e027076.jpg"),
                                           ("Fourth image", "ttps://www.nasa.gov/sites/default/files/thumbnails/image/pia21340-1041.jpg")]
    
    static var imagesDownloaded = 0
}
