//
//  FirstCommentTableViewCell.swift
//  IGApp
//
//  Created by AndyLin on 2022/10/7.
//

import UIKit

class FirstCommentTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var messageContentLabel: UILabel!
    @IBOutlet weak var messageTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
