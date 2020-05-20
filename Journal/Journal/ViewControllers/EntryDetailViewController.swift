//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Stephanie Ballard on 5/20/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    @IBOutlet weak var entryTitleTextField: UITextField!
    @IBOutlet weak var moodSegmentedControl: UISegmentedControl!
    @IBOutlet weak var entryBodyTextView: UITextView!
    
    var entry: Entry?
    var wasEdited: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = editButtonItem
        updateViews()
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        wasEdited = true
        
        entryTitleTextField.isUserInteractionEnabled = editing
        entryBodyTextView.isUserInteractionEnabled = editing
        moodSegmentedControl.isUserInteractionEnabled = editing
        
        navigationItem.hidesBackButton = editing

    }
    func updateViews() {
        guard let entry = entry else { return }
        
        guard let entryMood = entry.mood,
            let mood = Mood(rawValue: entryMood),
            let moodIndex = Mood.allCases.firstIndex(of: mood) else { return }
        
        entryTitleTextField.text = entry.title
        entryBodyTextView.text = entry.bodyText
        moodSegmentedControl.selectedSegmentIndex = moodIndex
        
        entryTitleTextField.isUserInteractionEnabled = isEditing
        entryBodyTextView.isUserInteractionEnabled = isEditing
        moodSegmentedControl.isUserInteractionEnabled = isEditing
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}