//
//  ArticleManager.swift
//  Pods-vtymchen2017_Example
//
//  Created by Vladyslav Tymchenko on 27.10.17.
//

import Foundation
import CoreData

public class ArticleManager {
    
    public init() {}
    
    //public static let instance = ArticleManager()
    
    public lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "article", bundle: Bundle(for: Article.self))
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    public func save() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    public func newArticle() -> Article {
        let entityDesc = NSEntityDescription.entity(forEntityName: "Article", in: self.persistentContainer.viewContext)
        let article = Article(entity: entityDesc!, insertInto: self.persistentContainer.viewContext)
        return article
    }
    
    public func getAllArticles() -> [Article] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
        do {
            let articls: [Article] = try persistentContainer.viewContext.fetch(fetchRequest) as! [Article]
            return articls
        } catch {
            print(error)
            return []
        }
    }
    
    public func getArticles(withLang lang: String) -> [Article] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
        do {
            let res: [Article] = try persistentContainer.viewContext.fetch(fetchRequest) as! [Article]
            var articls: [Article] = []
            for article in res {
                if article.language == lang {
                    articls.append(article)
                }
            }
            return articls
        } catch {
            print(error)
            return []
        }
    }
    
    public func getArticles(containString str: String) -> [Article] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
        do {
            let res: [Article] = try persistentContainer.viewContext.fetch(fetchRequest) as! [Article]
            var articls: [Article] = []
            for article in res {
                if (article.content?.contains(str))! || (article.title?.contains(str))! {
                    articls.append(article)
                }
            }
            return articls
        } catch {
            print(error)
            return []
        }
    }
    
    public func deleteArticle(article: Article) {
        self.persistentContainer.viewContext.delete(article)
        save()
    }
    
}

extension NSPersistentContainer {
    
    public convenience init(name: String, bundle: Bundle) {
        guard let modelURL = bundle.url(forResource: name, withExtension: "momd"),
            let mom = NSManagedObjectModel(contentsOf: modelURL)
            else {
                fatalError("Unable to located Core Data model")
        }
        self.init(name: name, managedObjectModel: mom)
    }
}
