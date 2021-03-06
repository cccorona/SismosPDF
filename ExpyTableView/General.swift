//
//  General.swift
//  Sismo App_Example
//
//  Created by Cesar Andres Figueroa Mendiola on 05/12/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

class General: UIView, UITextFieldDelegate {
    
    
    @IBOutlet weak var VistaEdificio: UIView!
    @IBOutlet weak var VistaTipo: UIView!
    @IBOutlet weak var VistaAnio: UIView!
    @IBOutlet weak var VistaPisos: UIView!
    @IBOutlet weak var VistaSubterraneo: UIView!
    
    @IBOutlet weak var txtNumero: UITextField!
    @IBOutlet weak var txtTipo: UITextField!
    @IBOutlet weak var txtAnio: UITextField!
    @IBOutlet weak var txtPisos: UITextField!
    @IBOutlet weak var txtSubterraneo: UITextField!
    
    @IBOutlet weak var btnPareo: UIButton!
    @IBOutlet weak var btnEstado: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if  !idFichaConsultada.isEmpty {
            var a = idFichaConsultada.first?.value(forKeyPath: "evalucacion1") as? String
            if (a != "" && a != nil) {
                if txtNumero != nil {
                    txtNumero.text = a?.description
                    evalucacion1 = a!
                }
            }
            a = idFichaConsultada.first?.value(forKeyPath: "evalucacion2") as? String
            if (a != "" && a != nil) {
                if txtTipo != nil {
                    txtTipo.text = a?.description
                    evalucacion2 = (a?.description)!
                }
            }
            a = idFichaConsultada.first?.value(forKeyPath: "evalucacion3") as? String
            if (a != "" && a != nil) {
                if txtAnio != nil {
                    txtAnio.text = a?.description
                    evalucacion3 = (a?.description)!
                }
                
            }
            a = idFichaConsultada.first?.value(forKeyPath: "evalucacion4") as? String
            if (a != "" && a != nil) {
                if txtPisos != nil {
                    txtPisos.text = a?.description
                    evalucacion4 = (a?.description)!
                }
                
            }
            a = idFichaConsultada.first?.value(forKeyPath: "evalucacion5") as? String
            if (a != "" && a != nil) {
                if txtSubterraneo != nil {
                    txtSubterraneo.text = a?.description
                    evalucacion5 = (a?.description)!
                }

            }
            
            
        }
        
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField ==  txtNumero{
            evalucacion1 = (txtNumero.text as! NSString).description
        } else if textField ==  txtTipo{
            evalucacion2 = (txtTipo.text as! NSString).description
        } else if textField ==  txtAnio{
            evalucacion3 = (txtAnio.text as! NSString).description
        } else if textField ==  txtPisos{
            evalucacion4 = (txtPisos.text as! NSString).description
        } else if textField ==  txtSubterraneo{
            evalucacion5 = (txtSubterraneo.text as! NSString).description
        }
    }
    
 
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField ==  txtNumero{
            evalucacion1 = (txtNumero.text as! NSString).description
        } else if textField ==  txtTipo{
            evalucacion2 = (txtTipo.text as! NSString).description
        } else if textField ==  txtAnio{
            evalucacion3 = (txtAnio.text as! NSString).description
        } else if textField ==  txtPisos{
            evalucacion4 = (txtPisos.text as! NSString).description
        } else if textField ==  txtSubterraneo{
            evalucacion5 = (txtSubterraneo.text as! NSString).description
        }
        return true
    }
    
    
    
    
}
