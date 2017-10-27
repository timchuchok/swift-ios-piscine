//
//  Article+CoreDataProperties.swift
//  Pods-vtymchen2017_Example
//
//  Created by Vladyslav Tymchenko on 27.10.17.
//
//

import Foundation
import CoreData


extension Article {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article")
    }

    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var language: String?
    @NSManaged public var picture: NSData?
    @NSManaged public var creation_date: NSDate?
    @NSManaged public var modified_date: NSDate?

}
