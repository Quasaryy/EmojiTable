//
//  AddTableViewController.swift
//  EmojiTable
//
//  Created by Yury on 31.01.23.
//

import UIKit

class AddTableViewController: UITableViewController {
    
    // MARK: IB Outlets
    @IBOutlet var emojiTF: UITextField!
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var descriptionTF: UITextField!
    
    // MARK: - Properties
    // Getting emoji from source table view controller if segue performed from the cell
    var emoji: Emoji?
    
    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Getting data for text fields if segue performed from the cell
        emojiTF.text = emoji?.emoji ?? ""
        nameTF.text = emoji?.name ?? ""
        descriptionTF.text = emoji?.description ?? ""
        
        // Updating save button state
        updateSaveButton()
    }
    
    
    // MARK: IB Actions
    // Enable save button if all text fields are not empty and have been edited
    @IBAction func editingChangedTF(_ sender: UITextField) {
        updateSaveButton()
    }
    
}

// MARK: Private Methods
extension AddTableViewController {
    
    // Enable save button if all text fields are not empty
    private func updateSaveButton() {
        let emoji = emojiTF.text ?? ""
        let name = nameTF.text ?? ""
        let description = descriptionTF.text ?? ""
        
        navigationItem.rightBarButtonItem?.isEnabled = !emoji.isEmpty && !name.isEmpty && !description.isEmpty
    }
    
}
