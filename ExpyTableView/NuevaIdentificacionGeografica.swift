//
//  NuevaIdentificacionGeografica.swift
//  Sismo App_Example
//
//  Created by Cesar Andres Figueroa Mendiola on 03/12/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//
import Foundation
import UIKit

class NuevaIdentificacionGeografica: UIView {
    
    @IBOutlet weak var btnPais: UIButton!

    @IBOutlet weak var btnRegion: UIButton!
    
    @IBOutlet weak var btnProvencia: UIButton!
    
    
    override func awakeFromNib() {
        evalucacion57 = "Chile"
        btnPais.setTitle("Chile", for: UIControlState.normal)
        super.awakeFromNib()
    }
    
    

}


