//
//  EmojiTableViewController.swift
//  EmojiTable
//
//  Created by Yury on 31.01.23.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    // MARK: - Properties
    var emojis = Emoji.getEmojis()
    
    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Casting cell as custom cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EmojiTableViewCell
        
        // Configuring the custom cell
        cell.emojiLabel.text = emojis[indexPath.row].emoji
        cell.nameLabel.text = emojis[indexPath.row].name
        cell.descriptionLabel.text = emojis[indexPath.row].description
        
        return cell
    }
    
    // Moving cells
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let removedEmoji = emojis.remove(at: sourceIndexPath.row)
        emojis.insert(removedEmoji, at: destinationIndexPath.row)
    }
    
    
    
    // MARK: IB Actions
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveSegue" else { return }
        let sourceVC = segue.source as! AddTableViewController
            emojis.append(Emoji(emoji: sourceVC.emojiTF.text!, name: sourceVC.nameTF.text!, description: sourceVC.descriptionTF.text!))
            tableView.reloadData()
    }
    
}
