//
//  ViewController.swift
//  vtymchen2017
//
//  Created by timchuchok on 10/27/2017.
//  Copyright (c) 2017 timchuchok. All rights reserved.
//

import UIKit
import vtymchen2017

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let articleManager = ArticleManager()
        
        let article1 = articleManager.newArticle()
        article1.content = "content1"
        article1.title = "title1"
        article1.language = "en"
        article1.creation_date = NSDate()
        article1.modified_date = NSDate()
        
        let article2 = articleManager.newArticle()
        article2.content = "content3"
        article2.title = "test contain string"
        article2.language = "fr"
        article2.creation_date = NSDate()
        article2.modified_date = NSDate()
        print(article1.description)
        
        articleManager.deleteArticle(article: article2)
        let a = articleManager.getAllArticles()
        print(a)
        articleManager.save()
    }

}

