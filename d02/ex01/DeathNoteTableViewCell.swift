//
//  DeathNoteTableViewCell.swift
//  ex01
//
//  Created by Vlad on 18.07.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

import UIKit

class DeathNoteTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionView: UITextView!
    @IBOutlet weak var timeLabel: UILabel!
    
    var deathNote: (String, String, Date)? {
        didSet {
            if let d = deathNote {
                nameLabel.text = d.0
                descriptionView.text = d.1
                descriptionView.isEditable = false
                let formatter = DateFormatter()
                formatter.dateFormat = "dd MMM yyyy HH:mm:ss"
                timeLabel.text = formatter.string(from: d.2)
                descriptionView.backgroundColor = .clear
            }
        }
    }
}
