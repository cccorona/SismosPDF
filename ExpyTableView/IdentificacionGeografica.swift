//
//  IdentificacionGeografica.swift
//  Sismo App
//
//  Created by Cesar Andres Figueroa Mendiola on 29/11/17.
//  Copyright © 2017 Crypton. All rights reserved.
//

import Foundation
import UIKit

class IdentificacionGeografica: UIView {
    
    @IBOutlet weak var btnSeleccionar: UIButton!
    @IBOutlet weak var btnCargar: UIButton!
    @IBOutlet weak var btnCrear: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    


    @IBAction func CrearInformacion(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
        let vc: EvaluacionSecciones = storyboard.instantiateViewController(withIdentifier: "evaluacion") as! EvaluacionSecciones
        vc.tipoEvaluacion = 5
        let currentController = getCurrentViewController()
        currentController?.present(vc, animated: false, completion: nil)
    }
    

    
}





