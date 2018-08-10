//
//  PhotoTableViewCell.swift
//  Sismo App_Example
//
//  Created by Luis Fernando Bustos Ramírez on 5/23/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
