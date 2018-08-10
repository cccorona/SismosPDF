//
//  DescripcionEmergencia.swift
//  Sismo App_Example
//
//  Created by Cesar Andres Figueroa Mendiola on 03/12/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

class DescripcionEmergencia: UIView, UITextFieldDelegate, UITextViewDelegate {
    
    @IBOutlet weak var btnSeleccionar: UIButton!
    @IBOutlet weak var txtTitulor: UITextField!
    @IBOutlet weak var Descripcion: UITextField!
    @IBOutlet var DescripcionDetallada: UITextView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        txtTitulor.delegate = self
        DescripcionDetallada.delegate = self
//        Descripcion.autocapitalizationType = .words

        if  !idFichaConsultada.isEmpty {
            txtTitulor.text =  idFichaConsultada.first?.value(forKeyPath: "informe4") as? String
            DescripcionDetallada.text =  idFichaConsultada.first?.value(forKeyPath: "informe5") as? String
        }
        
        if !informe4.isEmpty {
            txtTitulor.text = informe4
        }
        if !informe5.isEmpty {
            DescripcionDetallada.text = informe5
        }
        DescripcionDetallada.layer.borderWidth = 1
        DescripcionDetallada.layer.borderColor = UIColor.black.cgColor
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == txtTitulor {
            informe4 = (txtTitulor.text! as NSString ).description
        }
        else if textField == Descripcion  {
            informe5 = (Descripcion.text! as NSString ).description
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView == Descripcion  {
            informe5 = (Descripcion.text! as NSString ).description
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView == DescripcionDetallada{
            informe5 = Descripcion.text!
        }
    }
    
}
