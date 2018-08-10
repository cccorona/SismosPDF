//
//  Listado1Elementos.swift
//  Sismo App_Example
//
//  Created by Cesar Andres Figueroa Mendiola on 06/01/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import CoreData

class Listado1Elementos: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var tabla: UITableView!
//    @IBOutlet weak var r1: VKCheckbox!
//    @IBOutlet weak var r2: VKCheckbox!
//    @IBOutlet weak var r3: VKCheckbox!
    var A = 0
    var B = 0
    var C = 0
    override func viewDidLoad() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.myOrientation = .landscape
    }
    override func viewWillAppear(_ animated: Bool) {
        //        view.removeFromSuperview()
        
//        r1.line             = .thin
//        r1.bgColorSelected  = UIColor(red: 231/255, green: 46/255, blue: 57/255, alpha: 1)
//        r1.color            = UIColor.red
//        r1.borderColor      = UIColor.black
//        r1.borderWidth      = 1
//        r1.cornerRadius     = r1.frame.height / 2
//
//        r2.line             = .thin
//        r2.bgColorSelected  = UIColor(red: 231/255, green: 46/255, blue: 57/255, alpha: 1)
//        r2.color            = UIColor.red
//        r2.borderColor      = UIColor.black
//        r2.borderWidth      = 1
//        r2.cornerRadius     = r2.frame.height / 2
//
//        r3.line             = .thin
//        r3.bgColorSelected  = UIColor(red: 231/255, green: 46/255, blue: 57/255, alpha: 1)
//        r3.color            = UIColor.red
//        r3.borderColor      = UIColor.black
//        r3.borderWidth      = 1
//        r3.cornerRadius     = r3.frame.height / 2
//
//        for registro in idFichaListado {
//            //            ele1 = (registro.value(forKeyPath: "num_letra") as! Int64 )
//            if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 1 {
//                A = A + 1
//            } else if  (registro.value(forKeyPath: "num_resp") as! Int64 ) == 2 {
//                B = B + 1
//            } else if  (registro.value(forKeyPath: "num_resp") as! Int64 ) == 3 {
//                C = C + 1
//            }
//        }
//        //        r1.setOn(false)
//        //        r2.setOn(false)
//        //        r3.setOn(false)
//
//        if ( C == 0) && (B == 0) && (A > 0) {
//            r1.setOn(true)
//        } else  if ( C == 0) && (B >= 1) && (A >= 0) {
//            r2.setOn(true)
//        } else  if ( C >= 1) {
//            r3.setOn(true)
//        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return idFichaListado.count
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        //        if idBanFichaListado == 1 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath as IndexPath) as! Listado1Celda2
        cell.t1.text = (idFichaListado[row].value(forKeyPath: "letra") as! NSString).description + " " + (idFichaListado[row].value(forKeyPath: "respuesta") as! NSString).description
        cell.c1.isUserInteractionEnabled = false
        cell.c2.isUserInteractionEnabled = false
        cell.c3.isUserInteractionEnabled = false
        
        cell.c1.line             = .thin
        cell.c1.bgColorSelected  = UIColor(red: 231/255, green: 46/255, blue: 57/255, alpha: 1)
        cell.c1.color            = UIColor.red
        cell.c1.borderColor      = UIColor.black
        cell.c1.borderWidth      = 1
        cell.c1.cornerRadius     = cell.c1.frame.height / 2
        
        
        cell.c2.line             = .thin
        cell.c2.bgColorSelected  = UIColor(red: 231/255, green: 46/255, blue: 57/255, alpha: 1)
        cell.c2.color            = UIColor.red
        cell.c2.borderColor      = UIColor.black
        cell.c2.borderWidth      = 1
        cell.c2.cornerRadius     = cell.c2.frame.height / 2
        
        
        cell.c3.line             = .thin
        cell.c3.bgColorSelected  = UIColor(red: 231/255, green: 46/255, blue: 57/255, alpha: 1)
        cell.c3.color            = UIColor.red
        cell.c3.borderColor      = UIColor.black
        cell.c3.borderWidth      = 1
        cell.c3.cornerRadius     = cell.c3.frame.height / 2
        
        if (idFichaListado[row].value(forKeyPath: "num_resp") as! Int64 ) == 1 {
            cell.c1.setOn(true)
            cell.c2.setOn(false)
            cell.c3.setOn(false)
        } else if (idFichaListado[row].value(forKeyPath: "num_resp") as! Int64 ) == 2 {
            cell.c1.setOn(false)
            cell.c2.setOn(true)
            cell.c3.setOn(false)
        } else if (idFichaListado[row].value(forKeyPath: "num_resp") as! Int64 ) == 3 {
            cell.c1.setOn(false)
            cell.c2.setOn(false)
            cell.c3.setOn(true)
        }
        
        if ((idFichaListado[row].value(forKeyPath: "respuesta") as! NSString).description == "Colapso")   {
            cell.t2.text = "No"
            cell.t3.text = "Parcial"
            cell.t4.text = "Total"
            
            
        } else if ((idFichaListado[row].value(forKeyPath: "respuesta") as! NSString).description == "Daño producto de Edificaciones Adyacentes o falla del suelo colindante") {
            cell.t2.text = "No"
            cell.t3.text = "Incierto"
            cell.t4.text = "Si"
        } else if ((idFichaListado[row].value(forKeyPath: "respuesta") as! NSString).description == "Asentamiento del Edificio debido a Falla de suelo") {
            cell.t2.text = "< 0.2 m"
            cell.t3.text = "Entre 0.2 y 1.0m"
            cell.t4.text = "> 1.0m"
        } else if ((idFichaListado[row].value(forKeyPath: "respuesta") as! NSString).description == "Inclinación del Edificio completo o una parte debido a asentamiento diferencial") {
            cell.t2.text = "< 1/60 rad"
            cell.t3.text = "Entre 1/60 y 1/30 rad (aparentemente inclinado)"
            cell.t4.text = "> 1/30 rad (fácil de notar)"
        } else if ((idFichaListado[row].value(forKeyPath: "respuesta") as! NSString).description == "Deformación de Estructura de Techo del Edificio total o parcial") {
            cell.t2.text = "< 1/60 rad"
            cell.t3.text = "Entre 1/60 y 1/30 rad (aparentemente inclinado)"
            cell.t4.text = "> 1/30 rad (fácil de notar o grietas de cordones)"
        } 
        
        //            cell.estado.text = (idFichaListado[row].value(forKeyPath: "elemento") as! NSString as String)
        //            cell.elemento.text = (row + 1).description + ".- " +  (idFichaListado[row].value(forKeyPath: "respuesta") as! NSString as String)
        
        return cell
        //        } else {
        //            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath as IndexPath) as! ListadoCelda2
        //            cell.elemento.text = (row + 1).description + ".- " + (idFichaListado[row].value(forKeyPath: "elemento") as! NSString as String)
        //            cell.ninguno.text = "Ninguno: " + (idFichaListado[row].value(forKeyPath: "ele1") as! NSString as String)
        //            cell.leve.text = "Leve: " + (idFichaListado[row].value(forKeyPath: "ele2") as! NSString as String)
        //            cell.moderado.text = "Moderado: " + (idFichaListado[row].value(forKeyPath: "ele3") as! NSString as String)
        //            cell.fuerte.text = "Fuerte: " + (idFichaListado[row].value(forKeyPath: "ele4") as! NSString as String)
        //            cell.severo.text = "Severo: " + (idFichaListado[row].value(forKeyPath: "ele5") as! NSString as String)
        //            //            cell.estado.text = (idFichaListado[0].value(forKeyPath: "elemento") as! NSString as String)
        //
        //            return cell
        //        }
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    @IBAction func Atras(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.myOrientation = .portrait
        self.dismiss(animated: true, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
}
