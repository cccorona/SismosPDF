//
//  SevenSpaceTblViewCell.swift
//  Sismo App_Example
//
//  Created by Luis Fernando Bustos Ramírez on 09/05/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class SevenSpaceTblViewCell: UITableViewCell {

    @IBOutlet weak var value1Lbl: UILabel!
    @IBOutlet weak var value2Lbl: UILabel!
    @IBOutlet weak var value3Lbl: UILabel!
    @IBOutlet weak var value4Lbl: UILabel!
    @IBOutlet weak var value5Lbl: UILabel!
    @IBOutlet weak var value6Lbl: UILabel!
    @IBOutlet weak var value7Lbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        value1Lbl.layer.borderWidth = 1
        value1Lbl.layer.borderColor = UIColor.black.cgColor
        value2Lbl.layer.borderWidth = 1
        value2Lbl.layer.borderColor = UIColor.black.cgColor
        value3Lbl.layer.borderWidth = 1
        value3Lbl.layer.borderColor = UIColor.black.cgColor
        value4Lbl.layer.borderWidth = 1
        value4Lbl.layer.borderColor = UIColor.black.cgColor
        value5Lbl.layer.borderWidth = 1
        value5Lbl.layer.borderColor = UIColor.black.cgColor
        value6Lbl.layer.borderWidth = 1
        value6Lbl.layer.borderColor = UIColor.black.cgColor
        value7Lbl.layer.borderWidth = 1
        value7Lbl.layer.borderColor = UIColor.black.cgColor
    }

    func setData(_ data1:String, data2:String, data3:String, data4:String, data5:String, data6:String, data7:String){
        value1Lbl.text = " \(data1)"
        value2Lbl.text = " \(data2)"
        value3Lbl.text = " \(data3)"
        value4Lbl.text = " \(data4)"
        value5Lbl.text = " \(data5)"
        value6Lbl.text = " \(data6)"
        value7Lbl.text = " \(data7)"
    }
    
    func setBold(label:Int, size:CGFloat? = 14){
        let font = UIFont(name: "Calibri-Bold", size: size!) ?? UIFont.systemFont(ofSize: size!)
        switch(label){
        case 1:
            value1Lbl.font = font
            break;
        case 2:
            value2Lbl.font = font
            break;
        case 3:
            value3Lbl.font = font
            break;
        case 4:
            value4Lbl.font = font
            break;
        case 5:
            value5Lbl.font = font
            break;
        case 6:
            value6Lbl.font = font
            break;
        case 7:
            value7Lbl.font = font
            break;
        default:
            value1Lbl.font = font
            break;
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
