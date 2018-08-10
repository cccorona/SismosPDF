//
//  Georeferenciacion.swift
//  Sismo App_Example
//
//  Created by Cesar Andres Figueroa Mendiola on 05/12/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//
import Foundation
import UIKit

class Georeferenciacion: UIView {
    
    
  
    @IBOutlet var Lat: UILabel!
    @IBOutlet var Long: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Lat.text = "Latitud: " + latitud
        Long.text = "Longitud: " + longitud
        
    }
    
    
    @IBAction func Mapa(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
        let vc: Mapa = storyboard.instantiateViewController(withIdentifier: "mapa") as! Mapa
        let currentController = getCurrentViewController()
        currentController?.present(vc, animated: false, completion: nil)
    }
    
}

