//
//  AddNoteViewController.swift
//  ex01
//
//  Created by Vlad on 20.07.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

import UIKit

class AddNoteViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Add a Person"
        let rightButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(AddNoteViewController.doneButtonClicked))
        self.navigationItem.rightBarButtonItem = rightButtonItem
        self.view.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "pexels-photo-235985.jpeg")!)
        textView.backgroundColor = .clear
        textView.text = ""
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.black.cgColor
        datePicker.minimumDate = Date()
    }

    
    func doneButtonClicked() {
        print("df")
        if nameTextField.text != "" && textView.text != "" {
            Data.deathNotes.append((nameTextField.text!, textView.text + "\n", datePicker.date))
            performSegue(withIdentifier: "backToDeathNote", sender: nil)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backToDeathNote" {
                if let dest = segue.destination as? ViewController {
                    dest.tableView.reloadData()
                    print("data prepared")
            }
        }
    }
}
