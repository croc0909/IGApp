//
//  AccountPhotoTableViewCell.swift
//  IGApp
//
//  Created by AndyLin on 2022/10/13.
//

import UIKit

class AccountPhotoTableViewCell: UITableViewCell {
    static let reuseIdentifier = "\(AccountPhotoTableViewCell.self)"
    @IBOutlet weak var accountImageView: UIImageView!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var postContentLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var moreCommentButton: UIButton!
    @IBOutlet weak var postTimeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        accountImageView.layer.cornerRadius = accountImageView.frame.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
