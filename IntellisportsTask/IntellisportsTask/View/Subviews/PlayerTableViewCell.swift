//
//  PlayerTableViewCell.swift
//  IntellisportsTask
//
//  Created by ijaz ahmad on 2021-06-07.
//

import UIKit
import SDWebImage

class PlayerTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var category: UILabel!
    
    var player: Player? {
        didSet {
            guard let player = player else { fatalError("player not found") }
            name.text = player.name
            category.text = player.category.rawValue
            category.textColor = player.category.color()
            profileImageView.border(width: 5.0, color: player.category.color())
            profileImageView.sd_setImage(with: URL(string: player.profileImage), placeholderImage: nil, options: .highPriority, completed: nil)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.parentView.roundCorners(radius: 15.0)
        self.parentView.shadow()
        //self.parentView.border(width: 5.0, color: .red)
        profileImageView.roundCorners()
        profileImageView.backgroundColor = UIColor.black
        profileImageView.border(width: 2.0, color: .brown)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
