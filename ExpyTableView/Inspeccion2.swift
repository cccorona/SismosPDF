//
//  Inspeccion2.swift
//  Sismo App_Example
//
//  Created by Cesar Andres Figueroa Mendiola on 09/12/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Inspeccion2: UIView {
    
    @IBOutlet weak var btnSeleccionar: UIButton!
    @IBOutlet weak var lblNinguno: UILabel!
    @IBOutlet weak var lblLeve: UILabel!
    @IBOutlet weak var lblModerado: UILabel!
    @IBOutlet weak var lblFuerte: UILabel!
    @IBOutlet weak var lblSevero: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if  !idFichaConsultada.isEmpty {
            
            var a = ""
            if let b = idFichaConsultada.first?.value(forKeyPath: "evalucacion46") as? String {
               a = b
            } else {
                a = ""
            }
            if !(a  == "") {
                lblNinguno.text = a
            } else {
               lblNinguno.text = "0"
            }
            
            if let b = idFichaConsultada.first?.value(forKeyPath: "evalucacion47") as? String {
                a = b
            } else {
                a = ""
            }
//            a = idFichaConsultada.first?.value(forKeyPath: "evalucacion47") as? String
            if !(a == "") {
                lblLeve.text = a
            } else {
                lblLeve.text = "0"
            }
            
            if let b = idFichaConsultada.first?.value(forKeyPath: "evalucacion48") as? String {
                a = b
            } else {
                a = ""
            }
//            a = idFichaConsultada.first?.value(forKeyPath: "evalucacion48") as? String
            if !(a == "") {
                lblModerado.text = a
            } else {
                lblModerado.text = "0"
            }
            
            if let b = idFichaConsultada.first?.value(forKeyPath: "evalucacion49") as? String {
                a = b
            } else {
                a = ""
            }
//            a = idFichaConsultada.first?.value(forKeyPath: "evalucacion49") as? String
            if !(a == "") {
                lblFuerte.text = a
            } else {
                lblFuerte.text = "0"
            }
            
            if let b = idFichaConsultada.first?.value(forKeyPath: "evalucacion50") as? String {
                a = b
            } else {
                a = ""
            }
//            a = idFichaConsultada.first?.value(forKeyPath: "evalucacion50") as? String
            if !(a == "") {
                lblSevero.text = a
            } else {
                lblSevero.text = "0"
            }
            

            
        }
        
    }
    
    @IBAction func RestarNinguno(_ sender: Any) {
        var a = (lblNinguno.text as! NSString).intValue
        if a > 0 {
            a = a - 1
        } else  {
            a = 0
        }
        lblNinguno.text = a.description
        evalucacion46 = a.description
    }
    
    @IBAction func SumarNinguno(_ sender: Any) {
        var a = (lblNinguno.text as! NSString).intValue
        a = a + 1
        lblNinguno.text = a.description
        evalucacion46 = a.description
    }
    
    @IBAction func RestarLeve(_ sender: Any) {
        var a = (lblLeve.text as! NSString).intValue
        if a > 0 {
            a = a - 1
        } else  {
            a = 0
        }
        lblLeve.text = a.description
        evalucacion47 = a.description
    }
    
    @IBAction func SumarLeve(_ sender: Any) {
        var a = (lblLeve.text as! NSString).intValue
        a = a + 1
        lblLeve.text = a.description
        evalucacion47 = a.description
    }
    @IBAction func RestarModerado(_ sender: Any) {
        var a = (lblModerado.text as! NSString).intValue
        if a > 0 {
            a = a - 1
        } else  {
            a = 0
        }
        lblModerado.text = a.description
        evalucacion48 = a.description
    }
    
    @IBAction func SumarModerado(_ sender: Any) {
        var a = (lblModerado.text as! NSString).intValue
        a = a + 1
        lblModerado.text = a.description
        evalucacion48 = a.description
    }
    
    @IBAction func Restarfuerte(_ sender: Any) {
        var a = (lblFuerte.text as! NSString).intValue
        if a > 0 {
            a = a - 1
        } else  {
            a = 0
        }
        lblFuerte.text = a.description
        evalucacion49 = a.description
    }
    @IBAction func SumarFuerte(_ sender: Any) {
        var a = (lblFuerte.text as! NSString).intValue
        a = a + 1
        lblFuerte.text = a.description
        evalucacion49 = a.description
    }
    
    @IBAction func RestarSevero(_ sender: Any) {
        var a = (lblSevero.text as! NSString).intValue
        if a > 0 {
            a = a - 1
        } else  {
            a = 0
        }
        lblSevero.text = a.description
        evalucacion50 = a.description
    }
    
    @IBAction func SumarServero(_ sender: Any) {
        var a = (lblSevero.text as! NSString).intValue
        a = a + 1
        lblSevero.text = a.description
        evalucacion50 = a.description
    }
    
    @IBAction func Agregar(_ sender: Any) {
        if ((evalucacion46 == "") && (evalucacion47 == "") && (evalucacion48 == "") && (evalucacion49 == "") && (evalucacion50 == "") ) || (btnSeleccionar.titleLabel?.text == ""){
            
            let alert2 = UIAlertController(title: "Inspección", message: "Debe de ingresar alguno de los datos solicitados", preferredStyle: UIAlertControllerStyle.alert)
            alert2.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default,  handler: { action in
                
            }))
            let currentController = getCurrentViewController()
            currentController?.present(alert2, animated: true)
        } else {
            
            idFichaListado2.removeAll(keepingCapacity: true)
            idFichaListado2.removeAll()
            let managedContext =
                appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Insp2")
            if (idFicha == "" || btnSeleccionar.titleLabel?.text == nil || btnSeleccionar.titleLabel?.text == ""){
                let alert2 = UIAlertController(title: "Error", message: "Debes seleccionar un elemento primero", preferredStyle: UIAlertControllerStyle.alert)
                alert2.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default,  handler: { action in
                }))
                let currentController = getCurrentViewController()
                currentController?.present(alert2, animated: true)
                return
            }
            fetchRequest.predicate = NSPredicate(format: "(idficha = %@) AND (elemento == %@)", idFicha,(btnSeleccionar.titleLabel?.text as! NSString).description )
            
            do {
                idFichaListado2 = try managedContext.fetch(fetchRequest)

                if idFichaListado2.isEmpty {
                    let entity = NSEntityDescription.entity(forEntityName: "Insp2", in: context)
                    let newUser = NSManagedObject(entity: entity!, insertInto: context)
                    newUser.setValue( (lblNinguno.text as! NSString).description , forKey: "ele1")
                    newUser.setValue( (lblLeve.text as! NSString).description , forKey: "ele2")
                    newUser.setValue( (lblModerado.text as! NSString).description , forKey: "ele3")
                    newUser.setValue( (lblFuerte.text as! NSString).description , forKey: "ele4")
                    newUser.setValue( (lblSevero.text as! NSString).description , forKey: "ele5")
                    newUser.setValue( btnSeleccionar.titleLabel?.text , forKey: "elemento")
                    newUser.setValue(idFicha, forKey: "idficha")
                    
                    let ele1 = (lblNinguno.text as! NSString).intValue
                    let ele2 = (lblLeve.text as! NSString).intValue
                    let ele3 = (lblModerado.text as! NSString).intValue
                    let ele4 = (lblFuerte.text as! NSString).intValue
                    let ele5 = (lblSevero.text as! NSString).intValue
                    let ele6 = ele1 + ele2 + ele3 + ele4 + ele5
                    newUser.setValue(ele6.description, forKey: "total")

                    
                    
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
                        print("Failed saving")
                    }
                    CambiaInspeccion2(  )
                } else {
                    if let fetchResults = try managedContext.fetch(fetchRequest) as? [NSManagedObject] {
                        if fetchResults.count != 0{
                            var managedObject = fetchResults[0]
//                            let ele1 = (managedObject.value(forKeyPath: "ele1") as! NSString).intValue //+ (lblNinguno.text as! NSString).intValue
//                            managedObject.setValue(ele1.description, forKey: "ele1")
                            
                            let ele1 = (lblNinguno.text as! NSString).intValue
                            managedObject.setValue(ele1.description, forKey: "ele1")
                            
                            let ele2 = (lblLeve.text as! NSString).intValue
                            managedObject.setValue(ele2.description, forKey: "ele2")
                            
                            let ele3 =  (lblModerado.text as! NSString).intValue
                            managedObject.setValue(ele3.description, forKey: "ele3")
                            
                            let ele4 =  (lblFuerte.text as! NSString).intValue
                            managedObject.setValue(ele4.description, forKey: "ele4")
                            
                            let ele5 =  (lblSevero.text as! NSString).intValue
                            managedObject.setValue(ele5.description, forKey: "ele5")
                            
                            let ele6 = ele1 + ele2 + ele3 + ele4 + ele5
                            managedObject.setValue(ele6.description, forKey: "total")
                            
                            try context.save()
                            let alert = UIAlertController(title: "Guardar", message: "Elemento agregado correctamente", preferredStyle: UIAlertControllerStyle.alert)
                            alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default,  handler: { action in
                                //            self.dismiss(animated: true, completion: nil)
                            }))
                            
                            //                    self.present(alert, animated: true, completion: nil)
                            let currentController = getCurrentViewController()
                            currentController?.present(alert, animated: true)
                            
                        }
                    }
                    
                }
                lblNinguno.text = "0"
                lblLeve.text = "0"
                lblModerado.text = "0"
                lblFuerte.text = "0"
                lblSevero.text = "0"
                CambiaInspeccion2(  )
                
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
        }
        
    }
    
    @IBAction func Verlistado(_ sender: Any) {
        idBanFichaListado = 2
        idFichaListado.removeAll(keepingCapacity: true)
        idFichaListado.removeAll()
        let managedContext =
            appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Insp2")
        fetchRequest.predicate = NSPredicate(format: "idficha = %@", idFicha )

        do {
            idFichaListado = try managedContext.fetch(fetchRequest)
            for registro in idFichaListado {
            }
            
            let storyboard: UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
            let vc: Listado3Elementos = storyboard.instantiateViewController(withIdentifier: "listado3") as! Listado3Elementos
            let currentController = getCurrentViewController()
            currentController?.present(vc, animated: false, completion: nil)
            
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func CambiaInspeccion2(  ) {
        idBanFichaListado = 2
        idFichaListado2.removeAll(keepingCapacity: true)
        idFichaListado2.removeAll()
        let managedContext =
            appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Insp2")
        fetchRequest.predicate = NSPredicate(format: "(idficha = %@) AND (elemento == %@)", idFicha,(btnSeleccionar.titleLabel?.text as! NSString).description )
        
        do {
            idFichaListado2 = try managedContext.fetch(fetchRequest)
            for registro in idFichaListado2 {
                lblNinguno.text =  (idFichaListado2.first!.value(forKeyPath: "ele1") as! NSString ).description
                lblLeve.text = (idFichaListado2.first?.value(forKeyPath: "ele2") as! NSString ).description
                lblModerado.text  = (idFichaListado2.first?.value(forKeyPath: "ele3") as! NSString ).description
                lblFuerte.text  = (idFichaListado2.first?.value(forKeyPath: "ele4") as! NSString ).description
                lblSevero.text  = (idFichaListado2.first?.value(forKeyPath: "ele5") as! NSString ).description
            }
            
            //            let storyboard: UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
            //            let vc: Listado3Elementos = storyboard.instantiateViewController(withIdentifier: "listado3") as! Listado3Elementos
            //            let currentController = getCurrentViewController()
            //            currentController?.present(vc, animated: false, completion: nil)
            
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
}
