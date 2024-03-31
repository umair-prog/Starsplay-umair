//
//  EpisodeListTableViewCell.swift
//  STARZPLAY
//
//  Created by umair on 29/03/2024.
//

import UIKit


class EpisodeListTableViewCell: UITableViewCell {
    
    static let cellHeight = 120
    static let ID = "EpisodeListTableViewCell"
    
    // MARK: - Outlets
    @IBOutlet weak var episodeNameLable: UILabel!
    @IBOutlet weak var episodeImage: UIImageView!

    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    // MARK: - Actions
    @IBAction func playButton(sender: UIButton) {
        
    }
    
}
