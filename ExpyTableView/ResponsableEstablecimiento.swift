//
//  ResponsableEstablecimiento.swift
//  Sismo App_Example
//
//  Created by Cesar Andres Figueroa Mendiola on 03/12/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

class ResponsableEstablecimiento: UIView, UITextFieldDelegate {
    
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var VistaNombre: UIView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var VistaEmail: UIView!    
    @IBOutlet weak var txtTelefono: UITextField!
    @IBOutlet weak var VistaTelefono: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.VistaNombre.layer.borderWidth = 1
        self.VistaNombre.layer.borderColor = UIColor.black.cgColor
        self.VistaNombre.layer.borderWidth = 1
        self.VistaNombre.layer.borderColor = UIColor.black.cgColor
        
        self.VistaEmail.layer.borderWidth = 1
        self.VistaEmail.layer.borderColor = UIColor.black.cgColor
        self.VistaEmail.layer.borderWidth = 1
        self.VistaEmail.layer.borderColor = UIColor.black.cgColor
        
        self.VistaTelefono.layer.borderWidth = 1
        self.VistaTelefono.layer.borderColor = UIColor.black.cgColor
        self.VistaTelefono.layer.borderWidth = 1
        self.VistaTelefono.layer.borderColor = UIColor.black.cgColor
        if  !idFichaConsultada.isEmpty {
            var a = idFichaConsultada.first?.value(forKeyPath: "identificacion6") as? String
            if !(a == "") {
                txtNombre.text = a
            }
            
            a = idFichaConsultada.first?.value(forKeyPath: "identificacion7") as? String
            if !(a == "") {
                txtEmail.text = a
            }
            
            a = idFichaConsultada.first?.value(forKeyPath: "identificacion8") as? String
            if !(a == "") {
                txtTelefono.text = a
            }
        }
        if !identificacion6.isEmpty {
            txtNombre.text = identificacion6
        }
        if !identificacion7.isEmpty {
            txtEmail.text = identificacion7
        }
        if !identificacion8.isEmpty {
            txtTelefono.text = identificacion8
        }
        
        
        
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == txtNombre {
            identificacion6 = (txtNombre.text! as NSString ).description
        } else if textField == txtEmail {
            identificacion7 = (txtEmail.text! as NSString ).description
        } else if textField == txtTelefono {
            identificacion8 = (txtTelefono.text! as NSString ).description
        }
    }
    
    
}
