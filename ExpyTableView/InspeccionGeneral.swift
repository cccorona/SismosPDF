//
//  InspeccionGeneral.swift
//  Sismo App_Example
//
//  Created by Cesar Andres Figueroa Mendiola on 05/12/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

class InspeccionGeneral: UIView, UITextFieldDelegate, UITextViewDelegate {
    
    @IBOutlet weak var btnSelecionar: UIButton!
    
    @IBOutlet weak var VistaComentario: UIView!
//    @IBOutlet weak var txtComentario: UITextField!
    
    @IBOutlet var txtComentario: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if  !idFichaConsultada.isEmpty {
            var a = idFichaConsultada.first?.value(forKeyPath: "evalucacion9") as? String
            if (a != "" && a != nil) {
                txtComentario.text = a
                evalucacion9 = a!
            }
            
        }
        txtComentario.delegate = self
        VistaComentario.layer.borderColor = UIColor.black.cgColor
        VistaComentario.layer.borderWidth = 1
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        evalucacion9 = (textField.text as! NSString).description
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        evalucacion9 = (textView.text as! NSString).description
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        evalucacion9 = (textView.text as! NSString).description
        return true
    }
    
}
