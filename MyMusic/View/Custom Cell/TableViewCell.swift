//
//  TableViewCell.swift
//  MyMusic
//
//  Created by Rajat Kumar on 31/10/18.
//  Copyright © 2018 Rajat Kumar. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var albumImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        trackName.isUserInteractionEnabled = false
        artistName.isUserInteractionEnabled = false
        albumImage.isUserInteractionEnabled = false
        
        
    }
    
    @IBAction func playAndPauseButton(_ sender: Any) {
    
    }
    
}
