//
//  ViewController.swift
//  d07
//
//  Created by Vladyslav Tymchenko on 20.10.17.
//  Copyright © 2017 Vladyslav Tymchenko. All rights reserved.
//

import UIKit
import RecastAI
import ForecastIO

fileprivate let recastToken = "514f7fc3d2885886cbfbad61c668d172"
fileprivate let lang = "en"
fileprivate let forecastToken = "d83c132df8b79d880e0f4e9621b27cc0"

class ViewController: UIViewController {

    @IBOutlet weak var responseLabel: UILabel!
    
    @IBOutlet weak var requestTextField: UITextField!
    
    var bot: RecastAIClient?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bot = RecastAIClient(token: recastToken, language: lang)
    }

    @IBAction func didTapSendRequestButton(_ sender: Any) {
        var location: [String : Any]?

        if self.requestTextField.text != "" {
            bot?.textRequest(self.requestTextField.text!, successHandler: { response in location = response.get(entity: "location"); self.getForecast(location: location) }, failureHandle: {error in self.responseLabel.text = "Error"} )
        } else {
            self.responseLabel.text = "Enter text"
        }
    }
    
    func getForecast(location: [String : Any]? ) {
        if location != nil {
            let lat = location!["lat"] as! Double
            let lng = location!["lng"] as! Double
            let forecastClient = DarkSkyClient(apiKey: forecastToken)
            forecastClient.getForecast(latitude: lat, longitude: lng) {
                result in
                switch result {
                case .success(let value, _):
                    DispatchQueue.main.async {
                        self.responseLabel.text = "In " + (location!["raw"] as! String) + " is " +
                            (value.currently?.temperature?.description)! + " ℉"
                    }
                case .failure(let err):
                    self.responseLabel.text = err.localizedDescription
                }
            }
        } else {
            self.responseLabel.text = "Unknown location"
        }
    }
}

