//
//  SecondViewController.swift
//  d05
//
//  Created by Vladyslav Tymchenko on 06.10.17.
//  Copyright © 2017 Vladyslav Tymchenko. All rights reserved.
//

import UIKit

fileprivate let cellId = "cell"

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var delegate: MapViewDelegate?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return City.cities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! CityTableViewCell
        cell.textLabel?.text = City.cities[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate = tabBarController?.viewControllers![0] as? MapViewController
        delegate?.getCity(location: City.cities[indexPath.row].location)
        tabBarController?.selectedIndex = 0
    }
    
}

