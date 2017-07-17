//
//  ViewController.swift
//  ex00
//
//  Created by Vlad on 17.07.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! DeathNoteTableViewCell
        cell.deathNote = Data.notes[indexPath.row]
        return cell
    }
}

