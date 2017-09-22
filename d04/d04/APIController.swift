//
//  APIController.swift
//  d04
//
//  Created by Vladyslav Tymchenko on 23.08.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

import Foundation

class APIController {
    
    weak var delegate: APITwitterDelegate?
    
    let token: String
    
    init(delegate: APITwitterDelegate?, token: String) {
        
        self.delegate = delegate
        self.token = token
    }
    
    func performRequest(withString string: String) {
        
        let req = string.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let url = URL(string: "https://api.twitter.com/1.1/search/tweets.json?q=\(req)&lang=fr&count=100")
        print(url!)
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("Bearer \(self.token)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            //print(response!)
            if let err = error {
                self.delegate?.error(err as NSError)
            } 
            else if let d = data {
                do {
                    if let dic: NSDictionary = try JSONSerialization.jsonObject(with: d, options: .mutableContainers) as? NSDictionary {
                        //print(dic)
                        var twts = [Tweet]()
                        for tweet in (dic["statuses"] as! NSArray) {
                            //print("new tweet")
                            let status = tweet as! NSDictionary
                            //print(status["text"])
                            let user = status["user"] as! NSDictionary
                            //print(user["name"])
                            let tw = Tweet(name: (user["name"] as? String)!, text: (status["text"] as? String)!, date: (status["created_at"] as? String)!)
                            twts.append(tw)
                            //print(tw.description)
                        }
                        DispatchQueue.main.async {
                            self.delegate?.takeTweets(tweets: twts)
                        }
                    }
                }
                catch (let err) {
                    self.delegate?.error(err as NSError)
                }
            }
        })
        task.resume()
    }
    
}
