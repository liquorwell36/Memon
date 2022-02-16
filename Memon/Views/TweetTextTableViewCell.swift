//
//  TweetTextTableViewCell.swift
//  Memon
//
//  Created by kosuke sakai on 2022/02/16.
//

import UIKit

class TweetTextTableViewCell: UITableViewCell {
    
    @IBOutlet weak var displayChatTextView: UITextView!
    @IBOutlet weak var timeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }

    private func setupUI() {
        displayChatTextView.layer.borderWidth = 1.0
        displayChatTextView.layer.cornerRadius = 20
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
