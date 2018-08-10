//
//  AccesibliadadEstablecimiento.swift
//  Sismo App_Example
//
//  Created by Cesar Andres Figueroa Mendiola on 05/12/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

class AccesibilidadEstablecimiento: UIView,UITextFieldDelegate {
    @IBOutlet weak var btnAccesibilidad: UIButton!
   
    @IBOutlet weak var VistaOtro: UIView!
    @IBOutlet weak var txtOtro: UITextField!
    @IBOutlet weak var btnCondiciones: UIButton!
    @IBOutlet weak var VistaOtro2: UIView!
    @IBOutlet weak var txtOtro2: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.VistaOtro.layer.borderWidth = 1
        self.VistaOtro.layer.borderColor = UIColor.black.cgColor
        self.VistaOtro.layer.borderWidth = 1
        self.VistaOtro.layer.borderColor = UIColor.black.cgColor
        
        self.VistaOtro2.layer.borderWidth = 1
        self.VistaOtro2.layer.borderColor = UIColor.black.cgColor
        self.VistaOtro2.layer.borderWidth = 1
        self.VistaOtro2.layer.borderColor = UIColor.black.cgColor
        if  !idFichaConsultada.isEmpty {
            var a = idFichaConsultada.first?.value(forKeyPath: "identificacion16") as? String
            if !(a == "") {
                txtOtro.text = a
            }
            
            a = idFichaConsultada.first?.value(forKeyPath: "identificacion18") as? String
            if !(a == "") {
                txtOtro2.text = a
            }
            
            
            
        }
        if !identificacion16.isEmpty {
            txtOtro.text = identificacion16
        }
        if !identificacion18.isEmpty {
            txtOtro2.text = identificacion18
        }
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == txtOtro {
            identificacion16 = (txtOtro.text! as NSString ).description
        } else if textField == txtOtro2 {
            identificacion18 = (txtOtro2.text! as NSString ).description
        }
    }
    
}



