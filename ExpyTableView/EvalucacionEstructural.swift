//
//  EvaluacionEstructural.swift
//  Sismo App_Example
//
//  Created by Cesar Andres Figueroa Mendiola on 05/12/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//
import Foundation
import UIKit

class EvalucacionEstructural: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func IrSistemaEstructural(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
        let vc: EvaluacionSecciones = storyboard.instantiateViewController(withIdentifier: "evaluacion") as! EvaluacionSecciones
        vc.tipoEvaluacion = 1
        let currentController = getCurrentViewController()
        currentController?.present(vc, animated: false, completion: nil)
    }

    
    @IBAction func IrInspeccion1(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
        let vc: EvaluacionSecciones = storyboard.instantiateViewController(withIdentifier: "evaluacion") as! EvaluacionSecciones
        vc.tipoEvaluacion = 2
        let currentController = getCurrentViewController()
        currentController?.present(vc, animated: false, completion: nil)
    }
    
    @IBAction func IrInsPeccion2(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
        let vc: EvaluacionSecciones = storyboard.instantiateViewController(withIdentifier: "evaluacion") as! EvaluacionSecciones
        vc.tipoEvaluacion = 3
        let currentController = getCurrentViewController()
        currentController?.present(vc, animated: false, completion: nil)
    }
    
    @IBAction func IrInsPeccion3(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
        let vc: EvaluacionSecciones = storyboard.instantiateViewController(withIdentifier: "evaluacion") as! EvaluacionSecciones
        vc.tipoEvaluacion = 4
        let currentController = getCurrentViewController()
        currentController?.present(vc, animated: false, completion: nil)
    }
    
}
