//
//  ResumenEvalucacion.swift
//  Sismo App_Example
//
//  Created by Cesar Andres Figueroa Mendiola on 09/12/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

class ResumenEvalucacionFinal: UIView {
    @IBOutlet weak var btnSeleccionar: UIButton!
    @IBOutlet weak var lblLetra: UILabel!
    @IBOutlet weak var VistaLetra: UIView!
    @IBOutlet weak var btnEdicion: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        VistaLetra.layer.cl
        VistaLetra.layer.cornerRadius     = VistaLetra.frame.height / 2
        btnEdicion.isHidden = false
        
    }
    @IBAction func Alerta(_ sender: Any) {
        let ac = UIAlertController(title: "Evaluación final", message: "Está seguro de querer modificar la evaluación final", preferredStyle: .alert )
        let actionYes = UIAlertAction(title: "Aceptar", style: .default) { (action:UIAlertAction) in
            self.btnEdicion.isHidden = true
        }
        let actionNo = UIAlertAction(title: "Cancelar", style: .cancel) { (action:UIAlertAction) in
 
        }
        ac.addAction(actionYes)
        ac.addAction(actionNo)
        let currentController = getCurrentViewController()
        currentController?.present(ac, animated: true)
        
        
    }
}
