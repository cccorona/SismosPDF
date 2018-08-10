//
//  AcecaDe.swift
//  Sismo App_Example
//
//  Created by Cesar Andres Figueroa Mendiola on 09/12/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

class AcercaDe: UIViewController {

    
    @IBOutlet weak var lblVersion: UILabel!
    
//    @IBOutlet weak var VistaBar: UIView!
    
    override func viewDidLoad() {
        
//        self.VistaBar.layer.borderWidth = 1
//        self.VistaBar.layer.borderColor = UIColor.black.cgColor
//        self.VistaBar.layer.borderWidth = 1
//        self.VistaBar.layer.borderColor = UIColor.black.cgColor
        let dictionary = Bundle.main.infoDictionary!
        let version = dictionary["CFBundleShortVersionString"] as! String
        let build = dictionary["CFBundleVersion"] as! String
        
        lblVersion.text = "Versión: " + version + "." + build
        
        
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
}
