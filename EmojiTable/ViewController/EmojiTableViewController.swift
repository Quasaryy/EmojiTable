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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // Adding leading swipe
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let remove = remove(at: indexPath)
        let favorite = addToFavorites(at: indexPath)
        return UISwipeActionsConfiguration(actions: [remove, favorite])
    }
    
    // MARK: IB Actions
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveSegue" else { return }
        let sourceVC = segue.source as! AddTableViewController
        emojis.append(Emoji(emoji: sourceVC.emojiTF.text!, name: sourceVC.nameTF.text!, description: sourceVC.descriptionTF.text!, favorite: false))
        tableView.reloadData()
    }
    
}

// MARK: Private Methods
extension EmojiTableViewController {
    
    // Remove action for leading swipe
    private func remove(at indexPath: IndexPath) -> UIContextualAction {
        let remove = UIContextualAction(style: .destructive, title: "Remove") { _, _, completion in
            self.emojis.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        
        remove.image = UIImage(systemName: "xmark.circle")
        remove.backgroundColor = .systemRed
        return remove
    }
    
    // Add to favorites action for leading swipe
    private func addToFavorites(at indexPath: IndexPath) -> UIContextualAction {
        let isFavorite = self.emojis[indexPath.row].favorite
        let favorites = UIContextualAction(style: .normal, title: "Favorite") { _, _, completion in
            self.emojis[indexPath.row].favorite = isFavorite ? false : true
            completion(true)
        }
        
        favorites.image = UIImage(systemName: "heart")
        favorites.backgroundColor = isFavorite ? .systemPurple : .systemGray
        return favorites
    }
    
}
