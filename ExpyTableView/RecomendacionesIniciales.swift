//
//  RecomendacionesIniciales.swift
//  Sismo App_Example
//
//  Created by Cesar Andres Figueroa Mendiola on 09/12/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

class RecomendacionesIniciales: UIView, UITextFieldDelegate, UITextViewDelegate {
    
    @IBOutlet var VistaVisual: UIView!
    @IBOutlet weak var btnSeleccionar: UIButton!
//    @IBOutlet weak var txtCoordenadas: UITextField!
    @IBOutlet weak var txtArea: UITextField!
    @IBOutlet var Recomendaciones: UIView!
    
    @IBOutlet var txtCoordenadas: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        txtCoordenadas.delegate = self
        if  !idFichaConsultada.isEmpty {
            var a = idFichaConsultada.first?.value(forKeyPath: "evalucacion55") as? String
            if !(a == "") {
                txtCoordenadas.text = a
            }
            a = idFichaConsultada.first?.value(forKeyPath: "evalucacion56") as? String
            if !(a == "") {
                txtArea.text = a
            }
        }
        VistaVisual.layer.borderWidth = 1
        VistaVisual.layer.borderColor = UIColor.black.cgColor

        Recomendaciones.layer.borderWidth = 1
        Recomendaciones.layer.borderColor = UIColor.black.cgColor
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
//        if textField == txtCoordenadas{ // RECOMENDACIONES recomendaciones
//            evalucacion55 = (textField.text as! NSString).description
//        } else {
            evalucacion56 = (textField.text as! NSString).description
//        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        evalucacion55 = (textView.text as! NSString).description // RECOMENDACIONES recomendaciones
    }
}
