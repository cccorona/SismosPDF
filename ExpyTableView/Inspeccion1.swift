//
//  Inspeccion1.swift
//  Sismo App_Example
//
//  Created by Cesar Andres Figueroa Mendiola on 09/12/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Inspeccion1: UIView {
    
    @IBOutlet weak var btnSeleccionar: UIButton!
    @IBOutlet weak var checkNo: VKCheckbox!
    @IBOutlet weak var checkNeutro: VKCheckbox!
    @IBOutlet weak var checkSi: VKCheckbox!
    @IBOutlet weak var t1: UILabel!
    @IBOutlet weak var t2: UILabel!
    @IBOutlet weak var t3: UILabel!
    
    
    var bandera = 0
    var a = "0"
    override func awakeFromNib() {
        super.awakeFromNib()
        evalucacion44 = "0"
        checkNo.line             = .thin
        checkNo.bgColorSelected  = UIColor(red: 231/255, green: 46/255, blue: 57/255, alpha: 1)
        //        checkhormigon.bgColor          = UIColor.gray
        checkNo.color            = UIColor.red
        checkNo.borderColor      = UIColor.black
        checkNo.borderWidth      = 1
        checkNo.cornerRadius     = checkNo.frame.height / 2
        
        // Handle custom checkbox callback
        checkNo.checkboxValueChangedBlock = {
            isOn in
            print("Custom checkbox is \(isOn ? "ON" : "OFF")")
            
            
            if self.bandera == 0{
                self.bandera = 1
                //            self.checkNo.setOn(false, animated: true)
                self.checkNeutro.setOn(false, animated: false)
                self.checkSi.setOn(false, animated: false)
                evalucacion44 = "1"
                self.bandera = 0
                self.a = evalucacion44
            }
            
            
        }
        
        
        
        checkNeutro.line             = .thin
        checkNeutro.bgColorSelected  = UIColor(red: 231/255, green: 46/255, blue: 57/255, alpha: 1)
        //        checkhormigon.bgColor          = UIColor.gray
        checkNeutro.color            = UIColor.red
        checkNeutro.borderColor      = UIColor.black
        checkNeutro.borderWidth      = 1
        checkNeutro.cornerRadius     = checkNeutro.frame.height / 2
        // Handle custom checkbox callback
        checkNeutro.checkboxValueChangedBlock = {
            isOn in
            print("Custom checkbox is \(isOn ? "ON" : "OFF")")
            if self.bandera == 0{
                self.bandera = 1
                self.checkNo.setOn(false, animated: false)
//                self.checkNeutro.setOn(false, animated: true)
                self.checkSi.setOn(false, animated: false)
                evalucacion44 = "2"
                self.bandera = 0
                self.a = evalucacion44
            }
        }
        
        
        checkSi.line             = .thin
        checkSi.bgColorSelected  = UIColor(red: 231/255, green: 46/255, blue: 57/255, alpha: 1)
        //        checkhormigon.bgColor          = UIColor.gray
        checkSi.color            = UIColor.red
        checkSi.borderColor      = UIColor.black
        checkSi.borderWidth      = 1
        checkSi.cornerRadius     = checkSi.frame.height / 2
        // Handle custom checkbox callback
        checkSi.checkboxValueChangedBlock = {
            isOn in
            print("Custom checkbox is \(isOn ? "ON" : "OFF")")
            if self.bandera == 0{
                self.bandera = 1
                self.checkNo.setOn(false, animated: false)
                self.checkNeutro.setOn(false, animated: false)
//                self.checkSi.setOn(false, animated: true)
                evalucacion44 = "3"
                self.bandera = 0
                self.a = evalucacion44
            }
        }
        
        
//        if  !idFichaConsultada.isEmpty {
//            if  let b = (idFichaConsultada.first?.value(forKeyPath: "evalucacion44") as? String) {
//                a = b
//                self.bandera = 0
//                if a == "1" {
//                
//                    self.checkNeutro.setOn(false, animated: false)
//                    self.checkSi.setOn(false, animated: false)
//                    self.checkNo.setOn(true, animated: true)
//                    self.bandera = 0
//                } else if a == "2" {
//                    self.checkNo.setOn(false, animated: true)
//                    self.checkSi.setOn(false, animated: false)
//                    self.checkNeutro.setOn(true, animated: false)
//                } else if a == "3" {
//                    self.checkNo.setOn(false, animated: true)
//                    self.checkNeutro.setOn(false, animated: false)
//                    self.checkSi.setOn(true, animated: false)
//                }
//            }
//            
//            
//        }
        
    }
    
    @IBOutlet weak var AgregarListado: UIButton!
    @IBAction func MostraMensajeListado(_ sender: Any) {
        if (btnSeleccionar.titleLabel?.text == "") || (evalucacion44 == "0"){
            
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
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Insp1")
            fetchRequest.predicate = NSPredicate(format: "(idficha = %@) AND (respuesta == %@)", idFicha,(btnSeleccionar.titleLabel?.text as! NSString).description )
            do {
                idFichaListado = try managedContext.fetch(fetchRequest)
                
                if idFichaListado.isEmpty {
                    let entity = NSEntityDescription.entity(forEntityName: "Insp1", in: context)
                    let newUser = NSManagedObject(entity: entity!, insertInto: context)
                    if (evalucacion44 == "1") || ( a == "1") {
                        newUser.setValue( (self.t1.text as! NSString).description , forKey: "elemento")
                    } else  if (evalucacion44 == "2") || ( a == "2"){
                        newUser.setValue( (self.t2.text as! NSString).description , forKey: "elemento")
                    } else  if (evalucacion44 == "3") || ( a == "3"){
                        newUser.setValue( (self.t3.text as! NSString).description , forKey: "elemento")
                    }
                    newUser.setValue( btnSeleccionar.titleLabel?.text , forKey: "respuesta")
                    newUser.setValue( (evalucacion44 as! NSString).intValue , forKey: "num_resp")
                    newUser.setValue(idFicha, forKey: "idficha")
            
                    if (btnSeleccionar.titleLabel?.text == "Colapso")   {
                        newUser.setValue( 1 , forKey: "num_letra")
                        newUser.setValue( "a)" , forKey: "letra")
                        
                    } else if (btnSeleccionar.titleLabel?.text == "Daño producto de Edificaciones Adyacentes o falla del suelo colindante") {
                        newUser.setValue( 2 , forKey: "num_letra")
                        newUser.setValue( "b)" , forKey: "letra")
                        
                    } else if (btnSeleccionar.titleLabel?.text == "Asentamiento del Edificio debido a Falla de suelo") {
                        newUser.setValue( 3 , forKey: "num_letra")
                        newUser.setValue( "c)" , forKey: "letra")
                        
                    } else if (btnSeleccionar.titleLabel?.text == "Inclinación del Edificio completo o una parte debido a asentamiento diferencial") {
                        newUser.setValue( 4 , forKey: "num_letra")
                        newUser.setValue( "d)" , forKey: "letra")
                        
                    } else if (btnSeleccionar.titleLabel?.text == "Deformación de Estructura de Techo del Edificio total o parcial") {
                        newUser.setValue( 5 , forKey: "num_letra")
                        newUser.setValue( "e)" , forKey: "letra")
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
                    
    //            items = ["Colapso Total o Parcial", "Daño producto de Edificaciones Adyacentes o falla del suelo colindante","Asentamiento del Edificio debido a Falla de suelo","Inclinación del Edificio completo o una parte debido a asentamiento diferencial", "Deformación de Estructura de Techo del Edificio total o parcial" ]
                } else {
                    if let fetchResults = try managedContext.fetch(fetchRequest) as? [NSManagedObject] {
                        if fetchResults.count != 0{
                            var managedObject = fetchResults[0]
                            //                        let ele1 = (managedObject.value(forKeyPath: "ele1") as! NSString).intValue + (lblNinguno.text as! NSString).intValue
                            //                        managedObject.setValue(ele1.description, forKey: "ele1")
                            
                            if (evalucacion44 == "1") || ( a == "1") {
                                managedObject.setValue((self.t1.text as! NSString).description, forKey: "elemento")
                            } else  if (evalucacion44 == "2") || ( a == "2"){
                                managedObject.setValue((self.t2.text as! NSString).description, forKey: "elemento")
                            } else  if (evalucacion44 == "3") || ( a == "3"){
                                managedObject.setValue((self.t3.text as! NSString).description, forKey: "elemento")
                            }
                            managedObject.setValue(btnSeleccionar.titleLabel?.text, forKey: "respuesta")
                            managedObject.setValue((a as! NSString).intValue, forKey: "num_resp")
                            
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
            evalucacion44 = "0"
            checkNo.setOn(false)
            checkNeutro.setOn(false)
            checkSi.setOn(false)
        }
    }
    
    @IBAction func VerListado(_ sender: Any) {
        idBanFichaListado = 1
        idFichaListado.removeAll(keepingCapacity: true)
        idFichaListado.removeAll()
        let managedContext =
            appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Insp1")
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
            let vc: Listado1Elementos = storyboard.instantiateViewController(withIdentifier: "listado1") as! Listado1Elementos
            let currentController = getCurrentViewController()
            currentController?.present(vc, animated: false, completion: nil)
            
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
}
