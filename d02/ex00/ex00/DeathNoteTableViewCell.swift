//
//  DeathNoteTableViewCell.swift
//  ex00
//
//  Created by Vlad on 18.07.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

import UIKit

class DeathNoteTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    var deathNote: (String, String)? {
        didSet {
            if let note = deathNote {
                nameLabel?.text = note.0
                detailsLabel?.text = note.1
            }
        }
    }
}
