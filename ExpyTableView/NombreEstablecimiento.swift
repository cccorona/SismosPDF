//
//  NombreEstablecimiento.swift
//  Sismo App_Example
//
//  Created by Cesar Andres Figueroa Mendiola on 03/12/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

class NombreEstablecimiento: UIView, UITextFieldDelegate {
    
    @IBOutlet weak var txtNombreEstablecimiento: UITextField!
    @IBOutlet weak var VistaTexto: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.VistaTexto.layer.borderWidth = 1
        self.VistaTexto.layer.borderColor = UIColor.black.cgColor
        self.VistaTexto.layer.borderWidth = 1
        self.VistaTexto.layer.borderColor = UIColor.black.cgColor
        if  !idFichaConsultada.isEmpty {
            let a = idFichaConsultada.first?.value(forKeyPath: "identificacion3") as? String
            if (a != "" && a != nil) {
                txtNombreEstablecimiento.text = a
            }
        }
        if !identificacion3.isEmpty {
           txtNombreEstablecimiento.text = identificacion3
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == txtNombreEstablecimiento {
            identificacion3 = (txtNombreEstablecimiento.text! as NSString ).description
        }
    }
    
    
}

