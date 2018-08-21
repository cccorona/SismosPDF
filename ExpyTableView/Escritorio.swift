//
//  Escritorio.swift
//  VBExpand_Tableview
//
//  Created by Cesar Andres Figueroa Mendiola on 28/11/17.
//  Copyright © 2017 Crypton. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Escritorio: UIViewController {
    
    
    @IBOutlet weak var botonSincro: UIButton!
    @IBOutlet weak var botonInforme: UIButton!
    @IBOutlet weak var botonEstado: UIButton!
    @IBOutlet weak var botonPerfil: UIButton!
    @IBOutlet weak var InformacionGeneral: UIButton!
    
    var folio = ""
    var fecha = ""
    var IdFichaConsultada = ""
    
    override func viewDidLoad() {
        CambiarColorBarraNavegacion(Vista: self)
        
        botonSincro.layer.cornerRadius = 5
        botonSincro.layer.borderWidth = 1
        botonSincro.layer.borderColor = UIColor.clear.cgColor
//
//        botonInforme.layer.cornerRadius = 10
//        botonInforme.layer.borderWidth = 1
//        botonInforme.layer.borderColor = UIColor.clear.cgColor
//        
//        botonEstado.layer.cornerRadius = 10
//        botonEstado.layer.borderWidth = 1
//        botonEstado.layer.borderColor = UIColor.clear.cgColor
//        
//        botonPerfil.layer.cornerRadius = 10
//        botonPerfil.layer.borderWidth = 1
//        botonPerfil.layer.borderColor = UIColor.clear.cgColor
    }
    

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    @IBAction func NuevoInforme(_ sender: Any) {
        AvanceFicha = 0.0
        EvaluacionA = 0
        EvaluacionB = 0
        EvaluacionC = 0
        evalucacion8 = ""
        NumEdificios = 0
        TipoInfoGeneral = 0
        idFicha = ""
        idFichaConsultada.removeAll()
        idFichaConsultada.removeAll(keepingCapacity: true)
        evalucacion8 = "Inspeccionado" // se recinia la evaluacion final
        EvaluacionB = 0
        EvaluacionC = 0
        EvaluacionA = 1
        var mensaje = ""
//        if NumEdificios == 0 {
          mensaje = "¿Desea utilizar la última información general guardada en el dispositivo?"
//        } else {
//            mensaje = "¿Desea utilizar la última información general guardada en el dispositivo? \n Número de edificios:" + NumEdificios.description
//        }
        let errorAlert = UIAlertController(title: "Nuevo informe", message: mensaje , preferredStyle: .alert)
        
        errorAlert.addAction(UIAlertAction(title: "Si", style: .default, handler: {
            alert -> Void in
//            NumEdificios = NumEdificios + 1
            
            let alertController = UIAlertController(title: "Nuevo informe", message: "Por favor ingrese el nombre de la ficha de inspección", preferredStyle: .alert)
            alertController.addTextField(configurationHandler: { (textField) -> Void in
                textField.placeholder = "Nombre de la ficha"
                textField.textAlignment = .left
            })
            
            alertController.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: {
                alert -> Void in
                var medida1 = UITextField()
                medida1 = alertController.textFields![0] as UITextField
                NombreFicha = (medida1.text! as NSString).description
                NombreOriginal = (medida1.text! as NSString).description
                
                if NombreFicha.isEmpty {
                    let errorAlert = UIAlertController(title: "Error", message: "Por favor ingrese los datos solicitados", preferredStyle: .alert)
                    errorAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {
                        alert -> Void in
                        self.present(alertController, animated: true, completion: nil)
                    }))
                    self.present(errorAlert, animated: true, completion: nil)
                    
                } else {
                  self.ConsultaFichas ()
                }
                
            }))
            alertController.addAction(UIAlertAction(title: "Cancelar", style: .cancel , handler: {
                alert -> Void in
                
                
            }))
            self.present(alertController, animated: true, completion: nil)
                
//            self.ConsultaFichas ()
        }))
        
        errorAlert.addAction(UIAlertAction(title: "No", style: .cancel, handler: {
            alert -> Void in
            
            let alertController = UIAlertController(title: "Nuevo informe", message: "Por favor ingrese el nombre de la ficha de inspección", preferredStyle: .alert)
            alertController.addTextField(configurationHandler: { (textField) -> Void in
                textField.placeholder = "Nombre de la ficha"
                textField.textAlignment = .left
            })
            
            alertController.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: {
                alert -> Void in
                var medida1 = UITextField()
                medida1 = alertController.textFields![0] as UITextField
                NombreFicha = (medida1.text! as NSString).description
                NombreOriginal = (medida1.text! as NSString).description
                
                if NombreFicha.isEmpty {
                    let errorAlert = UIAlertController(title: "Error", message: "Por favor ingrese los datos solicitados", preferredStyle: .alert)
                    errorAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {
                        alert -> Void in
                        self.present(alertController, animated: true, completion: nil)
                    }))
                    self.present(errorAlert, animated: true, completion: nil)
                    
                } else {
                    self.ConsultaFichasSinDatos ()

                }
                
            }))
            alertController.addAction(UIAlertAction(title: "Cancelar", style: .cancel , handler: {
                alert -> Void in

                
            }))
            self.present(alertController, animated: true, completion: nil)
            

        }))

        self.present(errorAlert, animated: true, completion: nil)
        
    }
    func NombreFichas (){
        let alertController = UIAlertController(title: "Nuevo informe", message: "Por favor ingrese el nombre de la ficha de inspección", preferredStyle: .alert)
        alertController.addTextField(configurationHandler: { (textField) -> Void in
            textField.placeholder = "Nombre de la ficha"
            textField.textAlignment = .left
        })
        
        alertController.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: {
            alert -> Void in
            var medida1 = UITextField()
            medida1 = alertController.textFields![0] as UITextField
            NombreFicha = (medida1.text! as NSString).description
            NombreOriginal = (medida1.text! as NSString).description
            
            if NombreFicha.isEmpty {
                let errorAlert = UIAlertController(title: "Error", message: "Por favor ingrese los datos solicitados", preferredStyle: .alert)
                errorAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {
                    alert -> Void in
                    self.present(alertController, animated: true, completion: nil)
                }))
                self.present(errorAlert, animated: true, completion: nil)

            }
            
        }))
    }
    func ConsultaFichasSinDatos (){
        var BanderaTipoRegistro = 0
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        let managedContext =
            appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Ficha")
        fetchRequest.predicate = NSPredicate(format: "nombre = %@", NombreOriginal )
        
        do {
            idFichaConsultada = try managedContext.fetch(fetchRequest)
            for registro in idFichaConsultada {
                self.IdFichaConsultada = (registro.value(forKeyPath: "idficha") as? String)!
                BanderaTipoRegistro = 1
                break
            }
            
            if BanderaTipoRegistro == 1 {
                let alertController = UIAlertController(title: "Alerta", message: "Se cuenta con una ficha de inspección con el mismo nombre", preferredStyle: .alert)
                
                alertController.addAction(UIAlertAction(title: "Actualizar", style: .default, handler: {
                    alert -> Void in
                    self.RemplazaFichasNueva ()
                    
                }))
                
                alertController.addAction(UIAlertAction(title: "Continuar", style: .cancel, handler: {
                    alert -> Void in
                    if let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "menuinforme") as? MenuInforme {
                        self.present(detailVC, animated:true, completion: nil) // sin barra de navegación
                    }
                    
                }))
                self.present(alertController, animated: true, completion: nil)
                
            } else {
                self.ConsultaFichasNueva ()
            }
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
    }
        
    func ConsultaFichas (){
        var BanderaTipoRegistro = 0
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        let managedContext =
            appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Ficha")
        fetchRequest.predicate = NSPredicate(format: "nombre = %@", NombreOriginal )
        
        //3
        do {
            idFichaConsultada = try managedContext.fetch(fetchRequest)
            for registro in idFichaConsultada {
                self.IdFichaConsultada = (registro.value(forKeyPath: "idficha") as? String)!
                BanderaTipoRegistro = 1
                break
            }
            
            if BanderaTipoRegistro == 1 {
                let alertController = UIAlertController(title: "Alerta", message: "Se cuenta con una ficha de inspección con el mismo nombre", preferredStyle: .alert)
                
                alertController.addAction(UIAlertAction(title: "Actualizar", style: .default, handler: {
                    alert -> Void in
                    self.RemplazaFichasNueva ()
                    
                }))
                
                alertController.addAction(UIAlertAction(title: "Nueva ficha", style: .cancel, handler: {
                    alert -> Void in
                    self.CrearFichaDesdeInformePrevio ()
                    
                }))
                self.present(alertController, animated: true, completion: nil)
                
            } else {
              self.CrearFichaDesdeInformePrevio ()
            }
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }

    }
    func ConsultaFichasNueva (){
        
        idFichaConsultada.removeAll(keepingCapacity: true)
        idFichaConsultada.removeAll()
        let OrdenEstado = NSSortDescriptor(key: "idficha", ascending: true)
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Ficha")
        request.sortDescriptors = [OrdenEstado]
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        var info1 = ""
        var info2 = ""
        var info3 = ""
        var info4 = ""
        var info5 = ""
        var info6 = ""
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
//                print(data.value(forKey: "idficha") as! String)
//                // se optiene la iformacion general de escritorio
//                if let info = dato.object(forKey: "informe1FichaInsPec") as? String {
//                    info1 = info
//                }
//                if let info = dato.object(forKey: "informe2FichaInsPec") as? String {
//                    info2 = info
//                }
//                if let info = dato.object(forKey: "informe3FichaInsPec") as? String {
//                    info3 = info
//                }
//                if let info = dato.object(forKey: "informe4FichaInsPec") as? String {
//                    info4 = info
//                }
//                if let info = dato.object(forKey: "informe5FichaInsPec") as? String {
//                    info5 = info
//                }
                info6 = data.value(forKey: "idficha") as! String
//
            }

            
            
            let dateStringFormatter = DateFormatter()
                dateStringFormatter.locale = Locale(identifier:"es_cl")
                dateStringFormatter.dateFormat = "yyMMdd"
                let date = Date()
            let fecha1 = dateStringFormatter.string(from: date) + "-"
            dateStringFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss-'00:00'" //yyyy-MM-dd'T'HH:mm:ssZZZZ"
            
            
                FechaFormato = dateStringFormatter.string(from: date)
                idFicha = dateStringFormatter.string(from: date) + "-"
                
                
                if let name = dato.object(forKey: "nombrefichains") as? String {
                    let indexStartOfText = name.index(name.startIndex, offsetBy: 0)
                    self.folio = String(name[...indexStartOfText])
                }
                if let name = dato.object(forKey: "AppPatfichains") as? String {
                    let indexStartOfText = name.index(name.startIndex, offsetBy: 0)
                    self.folio = self.folio + String(name[...indexStartOfText])
                }
            
                if let name = dato.object(forKey: "AppMatfichains") as? String {
                    let indexStartOfText = name.index(name.startIndex, offsetBy: 0)
                    self.folio = self.folio + String(name[...indexStartOfText])
                }
                
                if folio.isEmpty {
                    self.folio =  "NA-"
                } else {
                    self.folio = self.folio + "-"
            }
            
            self.folio = fecha1  + folio +  NombreFicha //+ "-"
            NombreFicha = self.folio
//                }
            print(folio)
            print(idFicha)
            
            let entity = NSEntityDescription.entity(forEntityName: "Ficha", in: context)
            let newUser = NSManagedObject(entity: entity!, insertInto: context)
            newUser.setValue("1", forKey: "estado")
            newUser.setValue(folio, forKey: "folio")
            NombreFicha = self.folio
            newUser.setValue(idFicha, forKey: "idficha")
            newUser.setValue(info1, forKey: "informe1")
            newUser.setValue(info2, forKey: "informe2")
            newUser.setValue(info3, forKey: "informe3")
            newUser.setValue(info4, forKey: "informe4")
            newUser.setValue(info5, forKey: "informe5")
            newUser.setValue(NombreOriginal, forKey: "nombre")
            newUser.setValue(FechaFormato, forKey: "fecha")
            
            idFichaPrincipal = idFicha

                do {
                    try context.save()
                } catch {
                    print("Failed saving")
                }

            

        } catch {
            
            print("Failed")
        }
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        let managedContext =
            appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Ficha")
        fetchRequest.predicate = NSPredicate(format: "idficha = %@", idFicha )
        
        //3
        do {
            idFichaConsultada = try managedContext.fetch(fetchRequest)
//            for registro in idFichaConsultada {
//                idFicha = (registro.value(forKeyPath: "idficha") as? String)!
//                //                let a = registro.value(forKeyPath: "folio") as? String
//                //                let b = registro.value(forKeyPath: "estado") as? String
//                //                let c = registro.value(forKeyPath: "idficha") as? String
//                //                print(a , b , c)
//            }
            
            let storyboard: UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
            let vc: MenuInforme = storyboard.instantiateViewController(withIdentifier: "menuinforme") as! MenuInforme
            self.present(vc, animated: false, completion: nil)
            
            
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
    }
    func CrearFichaDesdeInformePrevio (){
        
        idFichaConsultada.removeAll(keepingCapacity: true)
        idFichaConsultada.removeAll()
        let OrdenEstado = NSSortDescriptor(key: "idficha", ascending: true)
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Ficha")
        request.sortDescriptors = [OrdenEstado]
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        var info1 = ""
        var info2 = ""
        var info3 = ""
        var info4 = ""
        var info5 = ""
        var info6 = ""
        var evaluacion58 = ""
        var evaluacion59 = ""
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                //                print(data.value(forKey: "idficha") as! String)
                //                // se optiene la iformacion general de escritorio
                if let info = data.value(forKey: "informe1") as? String {
                    info1 = info
                }
                if let info = data.value(forKey: "informe2") as? String {
                    info2 = info
                }
                if let info = data.value(forKey: "informe3") as? String {
                    info3 = info
                }
                if let info = data.value(forKey: "informe4") as? String {
                    info4 = info
                }
                if let info = data.value(forKey: "informe5") as? String {
                    info5 = info
                }
                if let info = data.value(forKey: "evalucacion58") as? String {
                    evaluacion58 = info
                }
                if let info = data.value(forKey: "evalucacion59") as? String {
                    evaluacion59 = info
                }
                info6 = data.value(forKey: "idficha") as! String
                //
            }
            
            
            
            let dateStringFormatter = DateFormatter()
            dateStringFormatter.locale = Locale(identifier:"es_cl")
            dateStringFormatter.dateFormat = "yyMMdd"
            let date = Date()
            let fecha1 = dateStringFormatter.string(from: date) + "-"
            dateStringFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss-'00:00'" //yyyy-MM-dd'T'HH:mm:ssZZZZ"
            
            
            FechaFormato = dateStringFormatter.string(from: date)
            idFicha = dateStringFormatter.string(from: date) + "-"
            
            
            if let name = dato.object(forKey: "nombrefichains") as? String {
                let indexStartOfText = name.index(name.startIndex, offsetBy: 0)
                self.folio = String(name[...indexStartOfText])
            }
            if let name = dato.object(forKey: "AppPatfichains") as? String {
                let indexStartOfText = name.index(name.startIndex, offsetBy: 0)
                self.folio = self.folio + String(name[...indexStartOfText])
            }
            
            if let name = dato.object(forKey: "AppMatfichains") as? String {
                let indexStartOfText = name.index(name.startIndex, offsetBy: 0)
                self.folio = self.folio + String(name[...indexStartOfText])
            }
            
            if folio.isEmpty {
                self.folio =  "NA-"
            } else {
                self.folio = self.folio + "-"
            }
            
            self.folio = fecha1  + folio +  NombreFicha //+ "-"
            NombreFicha = self.folio
            //                }
            print(folio)
            print(idFicha)
            
            let entity = NSEntityDescription.entity(forEntityName: "Ficha", in: context)
            let newUser = NSManagedObject(entity: entity!, insertInto: context)
            newUser.setValue("1", forKey: "estado")
            newUser.setValue(folio, forKey: "folio")
            NombreFicha = self.folio
            newUser.setValue(idFicha, forKey: "idficha")
            newUser.setValue(info1, forKey: "informe1")
            newUser.setValue(info2, forKey: "informe2")
            newUser.setValue(info3, forKey: "informe3")
            newUser.setValue(info4, forKey: "informe4")
            newUser.setValue(info5, forKey: "informe5")
            newUser.setValue(evaluacion58, forKey: "evalucacion58")
            newUser.setValue(evaluacion59, forKey: "evalucacion59")
            newUser.setValue(NombreOriginal, forKey: "nombre")
            newUser.setValue(FechaFormato, forKey: "fecha")
            
            idFichaPrincipal = idFicha
            
            do {
                try context.save()
            } catch {
                print("Failed saving")
            }
            
            
            
        } catch {
            
            print("Failed")
        }
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        let managedContext =
            appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Ficha")
        fetchRequest.predicate = NSPredicate(format: "idficha = %@", idFicha )
        
        //3
        do {
            idFichaConsultada = try managedContext.fetch(fetchRequest)
            //            for registro in idFichaConsultada {
            //                idFicha = (registro.value(forKeyPath: "idficha") as? String)!
            //                //                let a = registro.value(forKeyPath: "folio") as? String
            //                //                let b = registro.value(forKeyPath: "estado") as? String
            //                //                let c = registro.value(forKeyPath: "idficha") as? String
            //                //                print(a , b , c)
            //            }
            
            let storyboard: UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
            let vc: MenuInforme = storyboard.instantiateViewController(withIdentifier: "menuinforme") as! MenuInforme
            self.present(vc, animated: false, completion: nil)
            
            
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
    }
    
    
    func RemplazaFichasNueva (){
        
        idFichaConsultada.removeAll(keepingCapacity: true)
        idFichaConsultada.removeAll()
        do {
            let dateStringFormatter = DateFormatter()
            dateStringFormatter.dateFormat = "yyMMdd"
            let date = Date()
            let fecha1 = dateStringFormatter.string(from: date) + "-"
            dateStringFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss-'00:00'"
            dateStringFormatter.locale = Locale(identifier:"es_cl")
            FechaFormato = dateStringFormatter.string(from: date)
            idFicha = dateStringFormatter.string(from: date) + "-"
            
            
            if let name = dato.object(forKey: "nombrefichains") as? String {
                let indexStartOfText = name.index(name.startIndex, offsetBy: 0)
                self.folio = String(name[...indexStartOfText])
            }
            if let name = dato.object(forKey: "AppPatfichains") as? String {
                let indexStartOfText = name.index(name.startIndex, offsetBy: 0)
                self.folio = self.folio + String(name[...indexStartOfText])
            }
            
            if let name = dato.object(forKey: "AppMatfichains") as? String {
                let indexStartOfText = name.index(name.startIndex, offsetBy: 0)
                self.folio = self.folio + String(name[...indexStartOfText])
            }
            
            if folio.isEmpty {
                self.folio =  "NA-"
            } else {
                self.folio = self.folio + "-"
            }
            
            self.folio = fecha1  + folio +  NombreFicha //+ "-"
            NombreFicha = self.folio
            //                }
            print(folio)
            print(idFicha)



        } catch {

            print("Failed")
        }
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        let managedContext =
            appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Ficha")
        fetchRequest.predicate = NSPredicate(format: "idficha = %@", IdFichaConsultada )
        
        //3
        do {
            if let fetchResults = try managedContext.fetch(fetchRequest) as? [NSManagedObject] {
                if fetchResults.count != 0{
                    var managedObject = fetchResults[0]
                    managedObject.setValue(idFicha, forKey: "idficha")
                    managedObject.setValue(NombreOriginal, forKey: "nombre")
                    managedObject.setValue(FechaFormato, forKey: "fecha")
                    try context.save()
                }
            }
            
            idFichaConsultada = try managedContext.fetch(fetchRequest)
            let storyboard: UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
            let vc: MenuInforme = storyboard.instantiateViewController(withIdentifier: "menuinforme") as! MenuInforme
            self.present(vc, animated: false, completion: nil)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        

        
    }
    
    @IBAction func IrInformacionGeneral(_ sender: Any) {
        TipoInfoGeneral = 0
        let storyboard: UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
        let vc: InformeGeneral = storyboard.instantiateViewController(withIdentifier: "InfoGeneral") as! InformeGeneral
        self.present(vc, animated: false, completion: nil)
        
    }
    
    
}
