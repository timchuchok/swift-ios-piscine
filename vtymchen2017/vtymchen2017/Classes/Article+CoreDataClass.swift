//
//  Article+CoreDataClass.swift
//  Pods-vtymchen2017_Example
//
//  Created by Vladyslav Tymchenko on 27.10.17.
//
//

import Foundation
import CoreData

@objc(Article)
public class Article: NSManagedObject {

    override public var description: String {
        return "content - \(String(describing: self.content)) \ntitle - \(String(describing: self.title))\n" + "created - \(String(describing: self.creation_date))\n lang - \(String(describing: self.language))\n"
    }
}
