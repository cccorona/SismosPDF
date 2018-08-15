//
//  ServicioResponsable.swift
//  Sismo App_Example
//
//  Created by Cesar Andres Figueroa Mendiola on 03/12/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

class ServicioResponsable: UIView, UITextFieldDelegate {
    

    @IBOutlet weak var txtServicioResponsable: UITextField!
    @IBOutlet weak var VistaTexto: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.VistaTexto.layer.borderWidth = 1
        self.VistaTexto.layer.borderColor = UIColor.black.cgColor
        self.VistaTexto.layer.borderWidth = 1
        self.VistaTexto.layer.borderColor = UIColor.black.cgColor
        if  !idFichaConsultada.isEmpty {
            let a = idFichaConsultada.first?.value(forKeyPath: "identificacion4") as? String
            if (a != "" && a != nil) {
                txtServicioResponsable.text = a
            }
        }
        
        if !identificacion4.isEmpty {
            txtServicioResponsable.text = identificacion4
        }
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == txtServicioResponsable {
            identificacion4 = (txtServicioResponsable.text! as NSString ).description
        }
    }
    
    
}
