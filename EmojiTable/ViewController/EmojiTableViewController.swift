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
    
    // MARK: IB Actions
    @IBAction func unwindSegue(for unwindSegue: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationVC = segue.destination as! UINavigationController
        let AddTVC = navigationVC.topViewController as! AddTableViewController
        AddTVC.delegate = self
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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension EmojiTableViewController: AddTableViewControllerDelegate {
    func addNewEmoji(emoji: String, name: String, description: String) {
        emojis.append(Emoji(emoji: emoji, name: name, description: description))
        tableView.reloadData()
    }
    

}
