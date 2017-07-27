//
//  ViewController.swift
//  ex01
//
//  Created by Vlad on 18.07.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Data.deathNotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! DeathNoteTableViewCell
        cell.deathNote = Data.deathNotes[indexPath.section]
        let image = UIImage.init(named: "image.jpg")
        cell.backgroundView = UIImageView(image: image)
        tableView.backgroundColor = .clear
        tableView.separatorColor = .clear
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }

    @objc(tableView:viewForHeaderInSection:) func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = .white
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("dsd")
    }
    
    @IBAction func unWindSegue(segueForBack: UIStoryboardSegue) {
        print("Unwind")
    }
}

