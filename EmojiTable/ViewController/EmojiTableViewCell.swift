//
//  EmojiTableViewCell.swift
//  EmojiTable
//
//  Created by Yury on 31.01.23.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {

    // MARK: IB Outlets
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emojiLabel: UILabel!
    
    // MARK: Override Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
