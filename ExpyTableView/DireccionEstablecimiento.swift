//
//  DireccionEstablecimiento.swift
//  Sismo App_Example
//
//  Created by Cesar Andres Figueroa Mendiola on 05/12/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

class DireccionEstablecimiento: UIView, UITextFieldDelegate {
    
    @IBOutlet weak var btnCiudad: UIButton!
    @IBOutlet weak var btnComuna: UIButton!
    
    @IBOutlet weak var VistaListado: UIView!
    @IBOutlet weak var VistaCalle: UIView!
    @IBOutlet weak var VistaDireccion2: UIView!    
    @IBOutlet weak var VistaDireccion3: UIView!
    
    @IBOutlet weak var txtPueblo: UITextField!
    @IBOutlet weak var txtCalle: UITextField!
    @IBOutlet weak var txtDireccion2: UITextField!
    @IBOutlet weak var txtDireccion3: UITextField!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.VistaListado.layer.borderWidth = 1
        self.VistaListado.layer.borderColor = UIColor.black.cgColor
        self.VistaListado.layer.borderWidth = 1
        self.VistaListado.layer.borderColor = UIColor.black.cgColor
        
        self.VistaCalle.layer.borderWidth = 1
        self.VistaCalle.layer.borderColor = UIColor.black.cgColor
        self.VistaCalle.layer.borderWidth = 1
        self.VistaCalle.layer.borderColor = UIColor.black.cgColor
        
        self.VistaDireccion2.layer.borderWidth = 1
        self.VistaDireccion2.layer.borderColor = UIColor.black.cgColor
        self.VistaDireccion2.layer.borderWidth = 1
        self.VistaDireccion2.layer.borderColor = UIColor.black.cgColor
        
        self.VistaDireccion3.layer.borderWidth = 1
        self.VistaDireccion3.layer.borderColor = UIColor.black.cgColor
        self.VistaDireccion3.layer.borderWidth = 1
        self.VistaDireccion3.layer.borderColor = UIColor.black.cgColor
        
        if  !idFichaConsultada.isEmpty {
            var a = idFichaConsultada.first?.value(forKeyPath: "identificacion10") as? String
            if (a != "" && a != nil) {
                txtPueblo.text = a
            }
            a = idFichaConsultada.first?.value(forKeyPath: "identificacion12") as? String
            if (a != "" && a != nil) {
                txtCalle.text = a
            }
            a = idFichaConsultada.first?.value(forKeyPath: "identificacion13") as? String
            if (a != "" && a != nil) {
                txtDireccion2.text = a
            }
            a = idFichaConsultada.first?.value(forKeyPath: "identificacion14") as? String
            if (a != "" && a != nil) {
                txtDireccion3.text = a
            }
        }
        
        if !identificacion10.isEmpty {
            txtPueblo.text = identificacion10
        }
        if !identificacion12.isEmpty {
            txtCalle.text = identificacion12
        }
        if !identificacion13.isEmpty {
            txtDireccion2.text = identificacion13
        }
        if !identificacion14.isEmpty {
            txtDireccion3.text = identificacion14
        }
        
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == txtPueblo {
            identificacion10 = (txtPueblo.text! as NSString ).description
        } else if textField == txtCalle {
            identificacion12 = (txtCalle.text! as NSString ).description
        } else if textField == txtDireccion2 {
            identificacion13 = (txtDireccion2.text! as NSString ).description
        } else if textField == txtDireccion3 {
            identificacion14 = (txtDireccion3.text! as NSString ).description
        }
    }
    
}
