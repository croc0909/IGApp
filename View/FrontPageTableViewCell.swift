//
//  FrontPageTableViewCell.swift
//  IGApp
//
//  Created by AndyLin on 2022/9/30.
//

import UIKit

class FrontPageTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var moreOptionButton: UIButton!
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var collectButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var moreContentLabel: UIButton!
    @IBOutlet weak var moreCommentsButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var accountStackView: UIStackView!
    @IBOutlet weak var nameStackView: UIStackView!
    @IBOutlet weak var interactionsStackView: UIStackView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUI(){
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.height/2 // 圓角
        
        accountStackView.setCustomSpacing(10, after: avatarImageView)
        
        interactionsStackView.setCustomSpacing(50, after: shareButton)
    }

}
