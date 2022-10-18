//
//  MessageTableViewCell.swift
//  IGApp
//
//  Created by AndyLin on 2022/10/6.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var messageContentLabel: UILabel!
    @IBOutlet weak var messageTimeLabel: UILabel!
    @IBOutlet weak var messageLikeLabel: UILabel!
    @IBOutlet weak var replyButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var messageStacjView: UIStackView!
    @IBOutlet weak var AllMessageStackView: UIStackView!
    
    @IBOutlet weak var MessageCellStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height/2
        
        MessageCellStackView.setCustomSpacing(10, after: avatarImageView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
