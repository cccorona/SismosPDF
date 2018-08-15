//
//  Instalaciones.swift
//  Sismo App_Example
//
//  Created by Cesar Andres Figueroa Mendiola on 05/12/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import PWSwitch

class Instalaciones: UIView, UITextFieldDelegate {
    @IBOutlet weak var VistaContenedora: Instalaciones!
    @IBOutlet weak var btnAgua2: UIButton!
    @IBOutlet weak var btnAlcantarilla1: UIButton!
    @IBOutlet weak var btnAlcantarilla2: UIButton!
    @IBOutlet weak var btnElec1: UIButton!
    @IBOutlet weak var btnElec2: UIButton!
    @IBOutlet weak var btnlluvia1: UIButton!
    @IBOutlet weak var btnlluvia2: UIButton!
    @IBOutlet weak var btncliema1: UIButton!
    @IBOutlet weak var btnclima2: UIButton!
    @IBOutlet weak var btngas1: UIButton!
    @IBOutlet weak var btngas2: UIButton!
    @IBOutlet weak var btnacensores1: UIButton!
    @IBOutlet weak var btnacensores: UIButton!
    @IBOutlet weak var btnOtro1: UIButton!
    @IBOutlet weak var btnOtro2: UIButton!
    
    @IBOutlet weak var btnAgua1: UIButton!
    @IBOutlet weak var txtOtro: UITextField!
    @IBOutlet weak var VistaOtro: UIView!
    

  
    @IBOutlet var s1: PWSwitch!
    @IBOutlet var s2: PWSwitch!
    @IBOutlet var s3: PWSwitch!
    @IBOutlet var s4: PWSwitch!
    @IBOutlet var s5: PWSwitch!
    @IBOutlet var s6: PWSwitch!
    @IBOutlet var s7: PWSwitch!
    @IBOutlet var s8: PWSwitch!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if  !idFichaConsultada.isEmpty {
//            var a = idFichaConsultada.first?.value(forKeyPath: "evalucacion32") as? String
//            if (a != "" && a != nil) {
//                txtOtro.text = a
//            }
            
            var a = idFichaConsultada.first?.value(forKeyPath: "evalucacion32") as? String
            if (a != "" && a != nil) {
                if txtOtro != nil {
                    txtOtro.text = a?.description
                }
                
            }
            
            
        }

//        s1.addTarget(self, action: #selector(self.onSwitchChanged), for: .valueChanged)
//        s2.addTarget(self, action: #selector(self.onSwitchChanged), for: .valueChanged)
//        s3.addTarget(self, action: #selector(self.onSwitchChanged), for: .valueChanged)
//        s4.addTarget(self, action: #selector(self.onSwitchChanged), for: .valueChanged)
//        s5.addTarget(self, action: #selector(self.onSwitchChanged), for: .valueChanged)
//        s6.addTarget(self, action: #selector(self.onSwitchChanged), for: .valueChanged)
//        s7.addTarget(self, action: #selector(self.onSwitchChanged), for: .valueChanged)
//        s8.addTarget(self, action: #selector(self.onSwitchChanged), for: .valueChanged)
        
//        if (evalucacion10 == "1") {
//            S1.setOn(true, animated: true)
//        }else {
//            S1.setOn(false, animated: true)
//        }
        
        
        evalucacion11 = "Si"
        evalucacion12 = "Normal"
        evalucacion14 = "Si"
        evalucacion15 = "Normal"
        evalucacion17 = "Si"
        evalucacion18 = "Normal"
        evalucacion20 = "Si"
        evalucacion21 = "Normal"
        evalucacion23 = "Si"
        evalucacion24 = "Normal"
        evalucacion26 = "Si"
        evalucacion27 = "Normal"
        evalucacion29 = "Si"
        evalucacion30 = "Normal"
        evalucacion33 = "Si"
        evalucacion34 = "Normal"
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        evalucacion32 = (textField.text as! NSString).description
    }
    
    

    
}
