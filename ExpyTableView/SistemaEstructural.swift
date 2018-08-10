//
//  SistemaEstructural.swift
//  Sismo App_Example
//
//  Created by Cesar Andres Figueroa Mendiola on 09/12/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

class SistemaEstructural: UIView, UITextFieldDelegate, UITextViewDelegate {
    
    @IBOutlet weak var checkhormigon: VKCheckbox!
    @IBOutlet weak var checkAlba: VKCheckbox!
    @IBOutlet weak var checkAcero: VKCheckbox!
    @IBOutlet weak var checkMadera: VKCheckbox!
    var bandera = 0
    
//    @IBOutlet weak var VistaComentarios: UIView!
    
    @IBOutlet weak var btnHormigon: UIButton!
    @IBOutlet weak var btnAlba1: UIButton!
    @IBOutlet weak var btnAlba2: UIButton!
    @IBOutlet weak var btnAcero1: UIButton!
    @IBOutlet weak var btnAcero2: UIButton!
    @IBOutlet weak var btnMadera: UIButton!
    
//    @IBOutlet weak var comentarios: UITextField!

    @IBOutlet var comentarios: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Customized checkbox
        checkhormigon.line             = .thin
        checkhormigon.bgColorSelected  = UIColor(red: 231/255, green: 46/255, blue: 57/255, alpha: 1)
//        checkhormigon.bgColor          = UIColor.gray
        checkhormigon.color            = UIColor.red
        checkhormigon.borderColor      = UIColor.black
        checkhormigon.borderWidth      = 1
        checkhormigon.cornerRadius     = checkhormigon.frame.height / 2
        

        
        
        
        // Handle custom checkbox callback
        checkhormigon.checkboxValueChangedBlock = {
            isOn in
            print("Custom checkbox is \(isOn ? "ON" : "OFF")")
            
            
            if self.bandera == 0{
                self.bandera = 1
//            self.checkhormigon.setOn(false, animated: true)
                self.checkAlba.setOn(false, animated: true)
                self.checkAcero.setOn(false, animated: true)
                self.checkMadera.setOn(false, animated: true)
                evalucacion35 = "1"
                self.bandera = 0
            }
            
            
        }
        
        
        
        checkAlba.line             = .thin
        checkAlba.bgColorSelected  = UIColor(red: 231/255, green: 46/255, blue: 57/255, alpha: 1)
        checkAlba.color            = UIColor.red
        checkAlba.borderColor      = UIColor.black
        checkAlba.borderWidth      = 1
        checkAlba.cornerRadius     = checkAlba.frame.height / 2
        
        // Handle custom checkbox callback
        checkAlba.checkboxValueChangedBlock = {
            isOn in
            print("Custom checkbox is \(isOn ? "ON" : "OFF")")
            if self.bandera == 0{
                self.bandera = 1
            self.checkhormigon.setOn(false, animated: true)
//            self.checkAlba.setOn(false, animated: true)
            self.checkAcero.setOn(false, animated: true)
            self.checkMadera.setOn(false, animated: true)
                evalucacion35 = "2"
                self.bandera = 0
            }
        }
        
        checkAcero.line             = .thin
        checkAcero.bgColorSelected  = UIColor(red: 231/255, green: 46/255, blue: 57/255, alpha: 1)
        checkAcero.color            = UIColor.red
        checkAcero.borderColor      = UIColor.black
        checkAcero.borderWidth      = 1
        checkAcero.cornerRadius     = checkAcero.frame.height / 2
        
        // Handle custom checkbox callback
        checkAcero.checkboxValueChangedBlock = {
            isOn in
            print("Custom checkbox is \(isOn ? "ON" : "OFF")")
            if self.bandera == 0{
                self.bandera = 1
            self.checkhormigon.setOn(false, animated: true)
            self.checkAlba.setOn(false, animated: true)
//            self.checkAcero.setOn(false, animated: true)
            self.checkMadera.setOn(false, animated: true)
                evalucacion35 = "3"
                self.bandera = 0
            }
        }
        
        checkMadera.line             = .thin
        checkMadera.bgColorSelected  = UIColor(red: 231/255, green: 46/255, blue: 57/255, alpha: 1)
        checkMadera.color            = UIColor.red
        checkMadera.borderColor      = UIColor.black
        checkMadera.borderWidth      = 1
        checkMadera.cornerRadius     = checkMadera.frame.height / 2
        
        // Handle custom checkbox callback
        checkMadera.checkboxValueChangedBlock = {
            isOn in
            print("Custom checkbox is \(isOn ? "ON" : "OFF")")
            if self.bandera == 0{
                self.bandera = 1
            self.checkhormigon.setOn(false, animated: true)
            self.checkAlba.setOn(false, animated: true)
            self.checkAcero.setOn(false, animated: true)
//            self.checkMadera.setOn(false, animated: true)
                evalucacion35 = "4"
                self.bandera = 0
            }
            
        }
        
//        self.comentarios.layer.borderWidth = 1
//        self.comentarios.layer.borderColor = UIColor.black.cgColor

        
        
        if  !idFichaConsultada.isEmpty {
            var a = idFichaConsultada.first?.value(forKeyPath: "evalucacion42") as? String
            if !(a == "") {
                comentarios.text = a
            }
        }
        
        if  !idFichaConsultada.isEmpty {
            var a = idFichaConsultada.first?.value(forKeyPath: "evalucacion35") as? String
            self.bandera = 0
            if a == "1" {
                
                self.checkAlba.setOn(false, animated: true)
                self.checkAcero.setOn(false, animated: true)
                self.checkMadera.setOn(false, animated: true)
                self.checkhormigon.setOn(true, animated: true)
            } else if a == "2" {
                self.checkhormigon.setOn(false, animated: true)
                
                self.checkAcero.setOn(false, animated: true)
                self.checkMadera.setOn(false, animated: true)
                self.checkAlba.setOn(true, animated: true)
            } else if a == "3" {
                self.checkhormigon.setOn(false, animated: true)
                self.checkAlba.setOn(false, animated: true)
                
                self.checkMadera.setOn(false, animated: true)
                self.checkAcero.setOn(true, animated: true)
            } else if a == "4" {
                self.checkhormigon.setOn(false, animated: true)
                self.checkAlba.setOn(false, animated: true)
                self.checkAcero.setOn(false, animated: true)
                self.checkMadera.setOn(true, animated: true)
            }
            
            
        }
        
        comentarios.delegate = self
//        if comentarios.text == "" {
//            comentarios.text = "Escriba aquí"
//            comentarios.textColor = UIColor.lightGray
//        } else {
//            comentarios.textColor = UIColor.black
//        }
        
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
//        evalucacion42 = (textField.text as! NSString).description
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        evalucacion42 = (textView.text as! NSString).description
//
//        
//        if comentarios.text == "Escriba aquí" {
//            comentarios.text = "Escriba aquí"
//            comentarios.textColor = UIColor.lightGray
//        } else {
//          comentarios.textColor = UIColor.black
//        }
    }
    
}
