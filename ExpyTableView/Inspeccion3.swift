//
//  Inspeccion3.swift
//  Sismo App_Example
//
//  Created by Cesar Andres Figueroa Mendiola on 09/12/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Inspeccion3: UIView {
    
    @IBOutlet weak var btnSeleccionar: UIButton!
    @IBOutlet weak var checkSin: VKCheckbox!
    @IBOutlet weak var checkDeformacion: VKCheckbox!
    @IBOutlet weak var checkPeligro: VKCheckbox!
    @IBOutlet weak var t1: UILabel!
    @IBOutlet weak var t2: UILabel!
    @IBOutlet weak var t3: UILabel!
    @IBOutlet var Otro: UITextField!
    
    var bandera = 0
    var b = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        evalucacion52 = "0"
        Otro.isHidden = true
        checkSin.line             = .thin
        checkSin.bgColorSelected  = UIColor(red: 231/255, green: 46/255, blue: 57/255, alpha: 1)
        //        checkhormigon.bgColor          = UIColor.gray
        checkSin.color            = UIColor.red
        checkSin.borderColor      = UIColor.black
        checkSin.borderWidth      = 1
        checkSin.cornerRadius     = checkSin.frame.height / 2
        // Handle custom checkbox callback
        checkSin.checkboxValueChangedBlock = {
            isOn in
            print("Custom checkbox is \(isOn ? "ON" : "OFF")")
            if self.bandera == 0{
                self.bandera = 1
//                self.checkNo.setOn(false, animated: false)
                //                self.checkSin.setOn(false, animated: true)
                self.checkDeformacion.setOn(false, animated: false)
                self.checkPeligro.setOn(false, animated: false)
                evalucacion52 = "1"
                self.bandera = 0
                self.b = evalucacion52
            }
        }
        
        checkDeformacion.line             = .thin
        checkDeformacion.bgColorSelected  = UIColor(red: 231/255, green: 46/255, blue: 57/255, alpha: 1)
        //        checkhormigon.bgColor          = UIColor.gray
        checkDeformacion.color            = UIColor.red
        checkDeformacion.borderColor      = UIColor.black
        checkDeformacion.borderWidth      = 1
        checkDeformacion.cornerRadius     = checkDeformacion.frame.height / 2
        // Handle custom checkbox callback
        checkDeformacion.checkboxValueChangedBlock = {
            isOn in
            print("Custom checkbox is \(isOn ? "ON" : "OFF")")
            if self.bandera == 0{
                self.bandera = 1
                self.checkSin.setOn(false, animated: false)
                self.checkSin.setOn(false, animated: true)
//                self.checkDeformacion.setOn(false, animated: false)
                self.checkPeligro.setOn(false, animated: false)
                evalucacion52 = "2"
                self.bandera = 0
                self.b = evalucacion52
            }
        }
        
        
        checkPeligro.line             = .thin
        checkPeligro.bgColorSelected  = UIColor(red: 231/255, green: 46/255, blue: 57/255, alpha: 1)
        //        checkhormigon.bgColor          = UIColor.gray
        checkPeligro.color            = UIColor.red
        checkPeligro.borderColor      = UIColor.black
        checkPeligro.borderWidth      = 1
        checkPeligro.cornerRadius     = checkPeligro.frame.height / 2
        // Handle custom checkbox callback
        checkPeligro.checkboxValueChangedBlock = {
            isOn in
            print("Custom checkbox is \(isOn ? "ON" : "OFF")")
            if self.bandera == 0{
                self.bandera = 1
                self.checkSin.setOn(false, animated: false)
                self.checkSin.setOn(false, animated: true)
                self.checkDeformacion.setOn(false, animated: false)
//                self.checkPeligro.setOn(false, animated: false)
                evalucacion52 = "3"
                self.b = evalucacion52
                self.bandera = 0
            }
        }
        
        
        
//        if  !idFichaConsultada.isEmpty {
//            var a = idFichaConsultada.first?.value(forKeyPath: "evalucacion52") as? String
//            self.bandera = 0
//            if a == "1" {
//                b = a!
//                self.checkDeformacion.setOn(false, animated: false)
//                self.checkPeligro.setOn(false, animated: false)
//                self.checkSin.setOn(true, animated: true)
//            } else if a == "2" {
//                b = a!
//                self.checkSin.setOn(false, animated: true)
//                self.checkPeligro.setOn(false, animated: false)
//                self.checkDeformacion.setOn(true, animated: false)
//            } else if a == "3" {
//                b = a!
//                self.checkSin.setOn(false, animated: true)
//                self.checkDeformacion.setOn(false, animated: false)
//                self.checkPeligro.setOn(true, animated: false)
//            }
//            
//            
//        }
        
    }
    
//    var EvaluacionA = 0
//    var EvaluacionB = 0
//    var EvaluacionC = 0
//    ["Marcos y vidrios de ventana", "Terminaciones exteriores","Terminaciones interiores","Cielos falsos","Ductos de ventilación","Escaleras","Muros no estructurales con marcos","Muros no estructurales sin marcos", "Estanques, Antenas, Balcones, Letreros","Cubierta de techo","Lampisteria","Bienes muebles 1","Bienes muebles 2","Otro(s) Perligro(s)" ]
    
    @IBAction func Agregar(_ sender: Any) {
        
        if (btnSeleccionar.titleLabel?.text == "") || (evalucacion52 == "0"){
            
            let alert2 = UIAlertController(title: "Inspección", message: "Debe de ingresar los datos solicitados", preferredStyle: UIAlertControllerStyle.alert)
            alert2.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default,  handler: { action in
                
            }))
            let currentController = getCurrentViewController()
            currentController?.present(alert2, animated: true)
        } else {
        
            idFichaListado.removeAll(keepingCapacity: true)
            idFichaListado.removeAll()
            let managedContext =
                appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Insp3")
            fetchRequest.predicate = NSPredicate(format: "(idficha = %@) AND (respuesta == %@)", idFicha,(btnSeleccionar.titleLabel?.text as! NSString).description )
            do {
                idFichaListado = try managedContext.fetch(fetchRequest)
                
                if idFichaListado.isEmpty {
                    let entity = NSEntityDescription.entity(forEntityName: "Insp3", in: context)
                    let newUser = NSManagedObject(entity: entity!, insertInto: context)
                    if (evalucacion52 == "1") || ( b == "1") {
                        newUser.setValue( (self.t1.text as! NSString).description , forKey: "elemento")
                        EvaluacionA = EvaluacionA + 1
                    } else  if (evalucacion52 == "2") || ( b == "2"){
                        newUser.setValue( (self.t2.text as! NSString).description , forKey: "elemento")
                        EvaluacionB = EvaluacionB + 1
                    } else  if (evalucacion52 == "3") || ( b == "3"){
                        newUser.setValue( (self.t3.text as! NSString).description , forKey: "elemento")
                        EvaluacionC = EvaluacionC + 1
                    }
                    newUser.setValue( btnSeleccionar.titleLabel?.text , forKey: "respuesta")
                    newUser.setValue( (b as! NSString).intValue , forKey: "num_resp")
                    newUser.setValue(idFicha, forKey: "idficha")
                    newUser.setValue( (self.Otro.text as! NSString).description, forKey: "otros")
                    
                    if (evalucacion51 == "Cielos falsos")   {
                        newUser.setValue( 1 , forKey: "num_letra")
                        newUser.setValue( "f)" , forKey: "letra")
                        
                    } else if (btnSeleccionar.titleLabel?.text == "Escaleras") {
                        newUser.setValue( 2 , forKey: "num_letra")
                        newUser.setValue( "g)" , forKey: "letra")
                    } else if (btnSeleccionar.titleLabel?.text == "Muros no estructurales con marcos") {
                        newUser.setValue( 3 , forKey: "num_letra")
                        newUser.setValue( "h)" , forKey: "letra")
                    } else if (btnSeleccionar.titleLabel?.text == "Muros no estructurales sin marcos") {
                        newUser.setValue( 4 , forKey: "num_letra")
                        newUser.setValue( "i)" , forKey: "letra")
                    } else if (btnSeleccionar.titleLabel?.text == "Estanques, Antenas, Balcones, Letreros, Maquinaria, etc.") {
                        newUser.setValue( 5 , forKey: "num_letra")
                        newUser.setValue( "j)" , forKey: "letra")
                    } else if (btnSeleccionar.titleLabel?.text == "Bienes muebles 1") {
                        newUser.setValue( 6 , forKey: "num_letra")
                        newUser.setValue( "k1)" , forKey: "letra")
                    } else if (btnSeleccionar.titleLabel?.text == "Bienes muebles 2") {
                        newUser.setValue( 7 , forKey: "num_letra")
                        newUser.setValue( "k2)" , forKey: "letra")
                    } else if (btnSeleccionar.titleLabel?.text == "Bienes muebles 3") {
                        newUser.setValue( 8 , forKey: "num_letra")
                        newUser.setValue( "k3)" , forKey: "letra")
                    } else if (btnSeleccionar.titleLabel?.text == "Otro(s) Perligro(s)") {
                        newUser.setValue( 9 , forKey: "num_letra")
                        newUser.setValue( "l)" , forKey: "letra")
                    } else if (btnSeleccionar.titleLabel?.text == "Marcos y vidrios de ventana") {
                        newUser.setValue( 10 , forKey: "num_letra")
                        newUser.setValue( "m)" , forKey: "letra")
                    }
                    do {
                        try context.save()
                        let alert = UIAlertController(title: "Guardar", message: "Elemento agregado correctamente", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default,  handler: { action in
                            //            self.dismiss(animated: true, completion: nil)
                        }))
                        
                        //                    self.present(alert, animated: true, completion: nil)
                        let currentController = getCurrentViewController()
                        currentController?.present(alert, animated: true)
                    } catch {
                        print("Failed saving1")
                    }
                } else {
                    if let fetchResults = try managedContext.fetch(fetchRequest) as? [NSManagedObject] {
                        if fetchResults.count != 0{
                            var managedObject = fetchResults[0]
                            managedObject.setValue((self.Otro.text as! NSString).description, forKey: "otros")
                            if (evalucacion52 == "1") || ( b == "1") {
                                managedObject.setValue((self.t1.text as! NSString).description, forKey: "elemento")
                                EvaluacionA = EvaluacionA + 1
                            } else  if (evalucacion52 == "2") || ( b == "2"){
                                managedObject.setValue((self.t2.text as! NSString).description, forKey: "elemento")
                                EvaluacionB = EvaluacionB + 1
                            } else  if (evalucacion52 == "3") || ( b == "3"){
                                managedObject.setValue((self.t3.text as! NSString).description, forKey: "elemento")
                                EvaluacionC = EvaluacionC + 1
                            }
                            managedObject.setValue(btnSeleccionar.titleLabel?.text, forKey: "respuesta")
                            managedObject.setValue((b as! NSString).intValue, forKey: "num_resp")
                            
                            do {
                                try context.save()
                                let alert = UIAlertController(title: "Guardar", message: "Elemento agregado correctamente", preferredStyle: UIAlertControllerStyle.alert)
                                alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default,  handler: { action in
                                    //            self.dismiss(animated: true, completion: nil)
                                }))
                                
                                //                    self.present(alert, animated: true, completion: nil)
                                let currentController = getCurrentViewController()
                                currentController?.present(alert, animated: true)
                            } catch {
                                print("Failed saving2")
                            }
                            
                        }
                    }
                }
            } catch {
                print("Failed saving")
            }
            checkSin.setOn(false)
            checkDeformacion.setOn(false)
            checkPeligro.setOn(false)
            evalucacion52 = "0"
        }
    }
    
    @IBAction func MostrarListado(_ sender: Any) {
        idBanFichaListado = 1
        idFichaListado.removeAll(keepingCapacity: true)
        idFichaListado.removeAll()
        let managedContext =
            appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Insp3")
        fetchRequest.predicate = NSPredicate(format: "idficha = %@", idFicha )
        let OrdenEstado = NSSortDescriptor(key: "num_letra", ascending: true)
        fetchRequest.sortDescriptors = [OrdenEstado]
        
        
        
        //3
        do {
            idFichaListado = try managedContext.fetch(fetchRequest)
            for registro in idFichaListado {
                //                print(registro.value(forKeyPath: "idficha") )
                //                print(registro.value(forKeyPath: "elemento") )
                //                print(registro.value(forKeyPath: "respuesta") )
            }
            
            let storyboard: UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
            let vc: Listado2Elementos = storyboard.instantiateViewController(withIdentifier: "listado2") as! Listado2Elementos
            let currentController = getCurrentViewController()
            currentController?.present(vc, animated: false, completion: nil)
            
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    
}
