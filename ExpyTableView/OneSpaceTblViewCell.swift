//
//  OneSpaceTblViewCell.swift
//  Sismo App_Example
//
//  Created by Luis Fernando Bustos Ramírez on 09/05/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class OneSpaceTblViewCell: UITableViewCell {

    @IBOutlet weak var value1Lbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        value1Lbl.layer.borderWidth = 1
        value1Lbl.layer.borderColor = UIColor.black.cgColor
        // Initialization code
    }
    
    func setData(_ data1:String){
        value1Lbl.text = " \(data1)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
