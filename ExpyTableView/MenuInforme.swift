//
//  MenuInforme.swift
//  VBExpand_Tableview
//
//  Created by Cesar Andres Figueroa Mendiola on 29/11/17.
//  Copyright © 2017 Crypton. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import TCProgressBar

class MenuInforme: UIViewController {
    @IBOutlet weak var botonInfoGeneral: UIButton!
    @IBOutlet weak var botonIdentificaInmueble: UIButton!
    @IBOutlet weak var BotonEvaluacion: UIButton!
    @IBOutlet weak var botonAgregarEdificio: UIButton!
    @IBOutlet weak var botonTerminarInforme: UIButton!
    var folio = ""
    var fecha = ""
    
    @IBOutlet weak var VistaBar: UIView!
    @IBOutlet weak var Barra: TCProgressBar!
    @IBOutlet weak var Nombre: UILabel!
    
    
    override func viewDidLoad() {
        
        botonInfoGeneral.layer.cornerRadius = 5
        botonInfoGeneral.layer.borderWidth = 1
        botonInfoGeneral.layer.borderColor = UIColor.clear.cgColor
        
        botonIdentificaInmueble.layer.cornerRadius = 5
        botonIdentificaInmueble.layer.borderWidth = 1
        botonIdentificaInmueble.layer.borderColor = UIColor.clear.cgColor
        
        BotonEvaluacion.layer.cornerRadius = 5
        BotonEvaluacion.layer.borderWidth = 1
        BotonEvaluacion.layer.borderColor = UIColor.clear.cgColor
//        let dateFormatter: DateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        dateFormatter.locale = Locale(identifier:"es_AR")
//        let datecomponents = dateFormatter.date(from: date)
        
        if idFicha.isEmpty && idFichaConsultada.isEmpty {
            idFichaConsultada.removeAll(keepingCapacity: true)
            idFichaConsultada.removeAll()
            var dateStringFormatter = DateFormatter()
            dateStringFormatter.locale = Locale(identifier:"es_cl")
            dateStringFormatter.dateFormat = "yyMMdd"
            let date = Date()
            var fecha1 = dateStringFormatter.string(from: date) + "-"
            dateStringFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss-'00:00'"
            
            FechaFormato = dateStringFormatter.string(from: date)
            idFicha = dateStringFormatter.string(from: date) + "-"
        
        
            if let name = dato.object(forKey: "nombrefichains") as? String {
                var indexStartOfText = name.index(name.startIndex, offsetBy: 0)
                self.folio = String(name[...indexStartOfText])
            }
        
            if let name = dato.object(forKey: "AppPatfichains") as? String {
                var indexStartOfText = name.index(name.startIndex, offsetBy: 0)
                self.folio = self.folio + String(name[...indexStartOfText])
            }
            
            if let name = dato.object(forKey: "AppMatfichains") as? String {
                var indexStartOfText = name.index(name.startIndex, offsetBy: 0)
                self.folio = self.folio + String(name[...indexStartOfText])
            }
            
            if folio.isEmpty {
                self.folio = "NA-"
            } else {
              self.folio = self.folio + "-"
            }
            
            self.folio = fecha1  + folio +  NombreFicha //+ "-"
//            }
            print(folio)
            print(idFicha)
            
            var info1 = ""
            var info2 = ""
            var info3 = ""
            var info4 = ""
            var info5 = ""
            // se optiene la iformacion general de escritorio
            if let info = dato.object(forKey: "informe1FichaInsPec") as? String {
                info1 = info
            }
            if let info = dato.object(forKey: "informe2FichaInsPec") as? String {
                info2 = info
            }
            if let info = dato.object(forKey: "informe3FichaInsPec") as? String {
                info3 = info
            }
            if let info = dato.object(forKey: "informe4FichaInsPec") as? String {
                info4 = info
            }
            if let info = dato.object(forKey: "informe5FichaInsPec") as? String {
                info5 = info
            }
        
            let entity = NSEntityDescription.entity(forEntityName: "Ficha", in: context)
            let newUser = NSManagedObject(entity: entity!, insertInto: context)
            newUser.setValue("1", forKey: "estado")
            newUser.setValue(folio, forKey: "folio")
            newUser.setValue(info1, forKey: "informe1")
            newUser.setValue(info2, forKey: "informe2")
            newUser.setValue(info3, forKey: "informe3")
            newUser.setValue(info4, forKey: "informe4")
            newUser.setValue(info5, forKey: "informe5")
            newUser.setValue(NombreOriginal as String , forKey: "nombre")
            idFichaPrincipal = idFicha
            NombreFicha = self.folio
            newUser.setValue(idFicha, forKey: "idficha")
            newUser.setValue(FechaFormato, forKey: "fecha")
            
            do {
                try context.save()
            } catch {
                print("Failed saving")
            }
        }
//        else {
//            idFicha = (idFichaConsultada.first?.value(forKeyPath: "idficha") as? String)!
//        }
        
        self.VistaBar.layer.borderWidth = 1
        self.VistaBar.layer.borderColor = UIColor.black.cgColor
        self.VistaBar.layer.borderWidth = 1
        self.VistaBar.layer.borderColor = UIColor.black.cgColor
        
        //Ficha General desde escritorio
//        if TipoInfoGeneral == 0 {
//            botonInfoGeneral.isEnabled = false
//            botonInfoGeneral.isHidden = true
//        } else {
            botonInfoGeneral.isEnabled = true
            botonInfoGeneral.isHidden = false
//        }
    }
    override func viewDidAppear(_ animated: Bool) {
        let checkProgress = CheckCoreData()
        checkProgress.checkProgress()
        Barra.value = CGFloat(AvanceFicha)
        Nombre.text = NombreFicha
    }
    
    @IBAction func TerminarInforme(_ sender: Any) {
        idFichaConsultada.removeAll(keepingCapacity: true)
        idFichaConsultada.removeAll()
        let appDelegate = UIApplication .shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest < NSManagedObject > (entityName: "Ficha" )
        fetchRequest.predicate = NSPredicate(format: "idficha = %@", idFicha )
        do {
            var ficha = try managedContext.fetch (fetchRequest)
            
            if let fetchResults = try managedContext.fetch(fetchRequest) as? [NSManagedObject] {
                //appDel.managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [NSManagedObject] {
                if fetchResults.count != 0{
                    var managedObject = fetchResults[0]
                    managedObject.setValue("2", forKey: "estado")
                    idFicha = ""
                    try context.save()
                    
                }
            }
            
            let alert = UIAlertController(title: TituloAlerta, message: msgGuardar, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default,  handler: { action in
//                self.dismiss(animated: true, completion: nil)
                let storyboard: UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
                let vc: Escritorio = storyboard.instantiateViewController(withIdentifier: "menuprincipal") as! Escritorio
                self.present(vc, animated: false, completion: nil)
            }))
//            GuardarInformacion()
            self.present(alert, animated: true, completion: nil)
            
        } catch  let error as  NSError {
            print ( "No se pudo recuperar. " )
        }
    }
    
    func ConsultaFicha() {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        let managedContext =
            appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Ficha")
        
        //3
        do {
            var ficha = try managedContext.fetch(fetchRequest)
            for registro in ficha {
                let a = registro.value(forKeyPath: "folio") as? String
                let b = registro.value(forKeyPath: "estado") as? String
                let c = registro.value(forKeyPath: "idficha") as? String
                print(a , b , c)
            }
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func AgregarEdificio(_ sender: Any) {
        evalucacion8 = "Inspeccionado" // se recinia la evaluacion final
        EvaluacionB = 0
        EvaluacionC = 0
        EvaluacionA = 1
        var mensaje = ""
        TipoInfoGeneral = 0
        if NumEdificios == 0 {
            mensaje = "¿Desea agregar un nuevo edificio?"
        } else {
            mensaje = "¿Desea agregar un nuevo edificio? \n Número de edificios:" + NumEdificios.description
        }
        
        let errorAlert = UIAlertController(title: "Agregar edificio", message: mensaje , preferredStyle: .alert)
        
        errorAlert.addAction(UIAlertAction(title: "Si", style: .default, handler: {
            alert -> Void in
            NumEdificios = NumEdificios + 1
            
            
            var alertController = UIAlertController(title: "Agregar edificio", message: "Por favor ingrese el nombre de la ficha de inspección", preferredStyle: .alert)
            alertController.addTextField(configurationHandler: { (textField) -> Void in
                textField.placeholder = "Nombre de la ficha"
                textField.textAlignment = .left
            })
            
            alertController = UIAlertController(title: "Agregar edificio", message: "Por favor ingrese el nombre de la ficha de inspección", preferredStyle: .alert)
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
                    self.AgregraEdificio ()
                }
                
            }))
            self.present(alertController, animated: true, completion: nil)
            
        }))
        
        errorAlert.addAction(UIAlertAction(title: "No", style: .cancel, handler: {
            alert -> Void in
            NumEdificios = 0
            
            
            
//            var alertController = UIAlertController(title: "Agregar edificio", message: "Por favor ingrese el nombre de la ficha de inspección", preferredStyle: .alert)
//            alertController.addTextField(configurationHandler: { (textField) -> Void in
//                textField.placeholder = "Nombre de la ficha"
//                textField.textAlignment = .left
//            })
//
//            alertController = UIAlertController(title: "Nuevo informe", message: "Por favor ingrese el nombre de la ficha de inspección", preferredStyle: .alert)
//            alertController.addTextField(configurationHandler: { (textField) -> Void in
//                textField.placeholder = "Nombre de la ficha"
//                textField.textAlignment = .left
//            })
//
//            alertController.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: {
//                alert -> Void in
//                var medida1 = UITextField()
//                medida1 = alertController.textFields![0] as UITextField
//                NombreFicha = (medida1.text! as NSString).description
//                NombreOriginal = (medida1.text! as NSString).description
//
//                if NombreFicha.isEmpty {
//                    let errorAlert = UIAlertController(title: "Error", message: "Por favor ingrese los datos solicitados", preferredStyle: .alert)
//                    errorAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {
//                        alert -> Void in
//                        self.present(alertController, animated: true, completion: nil)
//                    }))
//                    self.present(errorAlert, animated: true, completion: nil)
//
//                } else {
//                    self.AgregarEdificioSinInformacionAnterior()
////                    let storyboard: UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
////                    let vc: EvaluacionEdificio = storyboard.instantiateViewController(withIdentifier: "EvaEdi") as! EvaluacionEdificio
////                    self.present(vc, animated: false, completion: nil)
//                }
//
//            }))
//            self.present(alertController, animated: true, completion: nil)
            
            

        }))
        
        //        if let popoverController = errorAlert.popoverPresentationController {
        //            popoverController.sourceView = self.view
        //            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
        //            popoverController.permittedArrowDirections = []
        //        }
        
        self.present(errorAlert, animated: true, completion: nil)
    }
    func AgregraEdificio (){
        
        let OrdenEstado = NSSortDescriptor(key: "idficha", ascending: true)
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Ficha")
        request.sortDescriptors = [OrdenEstado]
        var fichaReference = idFichaPrincipal
        if fichaReference == ""{
            fichaReference = idFicha
        }
        request.predicate = NSPredicate(format: "idficha = %@", fichaReference )
        request.returnsObjectsAsFaults = false
        var info1 = ""
        var info2 = ""
        var info3 = ""
        var info4 = ""
        var info5 = ""
        var info6 = ""
         // idenficacion
        
        var info7 = ""
        var info8 = ""
        var info9 = ""
        var info10 = ""
        var info11 = ""
        var info12 = ""
        var info13 = ""
        var info14 = ""
        var info15 = ""
        var info16 = ""
        var info17 = ""
        var info18 = ""
        var info19 = ""
        var info20 = ""
        var info21 = ""
        var info22 = ""
        var info23 = ""
        var info24 = ""
        var latitud = ""
        var longitud = ""
        var NombreAnterior = ""
        
        var region = ""
        var provincia = ""
        var tipoDesastre = ""
        var tipoEmergencia = ""
        var titular = ""
        var descripcionDesastre = ""
        
        
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "idficha") as! String)
                NombreAnterior = data.value(forKey: "nombre") as! String
                
                if let info = dato.object(forKey: "informe1FichaInsPec") as? String {
                    info1 = info
                }
                if let info = dato.object(forKey: "informe2FichaInsPec") as? String {
                    info2 = info
                }
                if let info = dato.object(forKey: "informe3FichaInsPec") as? String {
                    info3 = info
                }
                if let info = dato.object(forKey: "informe4FichaInsPec") as? String {
                    info4 = info
                }
                if let info = dato.object(forKey: "informe5FichaInsPec") as? String {
                    info5 = info
                }
                info6 = data.value(forKey: "idficha") as! String
                
                // identificacion
                
                if let a = data.value(forKey: "identificacion1") {
                    info7 = data.value(forKey: "identificacion1") as! String
                } else {
                    info7 = ""
                }
                if let a = data.value(forKey: "identificacion2") {
                    info8 = data.value(forKey: "identificacion2") as! String
                } else {
                    info8 = ""
                }
                if let a = data.value(forKey: "identificacion3") {
                    info9 = data.value(forKey: "identificacion3") as! String
                } else {
                    info9 = ""
                }
                if let a = data.value(forKey: "identificacion4") {
                    info10 = data.value(forKey: "identificacion4") as! String
                } else {
                    info10 = ""
                }
                if let a = data.value(forKey: "identificacion5") {
                    info11 = data.value(forKey: "identificacion5") as! String
                } else {
                    info11 = ""
                }
                if let a = data.value(forKey: "identificacion6") {
                    info12 = data.value(forKey: "identificacion6") as! String
                } else {
                    info12 = ""
                }
                if let a = data.value(forKey: "identificacion7") {
                    info13 = data.value(forKey: "identificacion7") as! String
                } else {
                    info13 = ""
                }
                if let a = data.value(forKey: "identificacion8") {
                    info14 = data.value(forKey: "identificacion8") as! String
                } else {
                    info14 = ""
                }
                if let a = data.value(forKey: "identificacion9") {
                    info15 = data.value(forKey: "identificacion9") as! String
                } else {
                    info15 = ""
                }
                if let a = data.value(forKey: "identificacion10") {
                    info16 = data.value(forKey: "identificacion10") as! String
                } else {
                    info16 = ""
                }
                
                
                if let a = data.value(forKey: "identificacion11") {
                    info17 = data.value(forKey: "identificacion11") as! String
                } else {
                    info17 = ""
                }
                
                if let a = data.value(forKey: "identificacion12") {
                    info18 = data.value(forKey: "identificacion12") as! String
                } else {
                    info18 = ""
                }
                
                if let a = data.value(forKey: "identificacion13") {
                    info19 = data.value(forKey: "identificacion13") as! String
                } else {
                    info19 = ""
                }
                
                if let a = data.value(forKey: "identificacion14") {
                    info20 = data.value(forKey: "identificacion14") as! String
                } else {
                    info20 = ""
                }
                
                if let a = data.value(forKey: "identificacion15") {
                    info21 = data.value(forKey: "identificacion15") as! String
                } else {
                    info21 = ""
                }
                
                if let a = data.value(forKey: "identificacion16") {
                    info22 = data.value(forKey: "identificacion16") as! String
                } else {
                    info22 = ""
                }
                
                if let a = data.value(forKey: "identificacion17") {
                    info23 = data.value(forKey: "identificacion17") as! String
                } else {
                    info23 = ""
                }
                
                if let a = data.value(forKey: "identificacion18") {
                    info24 = data.value(forKey: "identificacion18") as! String
                } else {
                    info24 = ""
                }
                
                if let a = data.value(forKey: "latitud") {
                    latitud = data.value(forKey: "latitud") as! String
                } else {
                    latitud = ""
                }
                
                if let a = data.value(forKey: "longitud") {
                    longitud = data.value(forKey: "longitud") as! String
                } else {
                    longitud = ""
                }
                if let a = data.value(forKey: "informe3") {
                    provincia = data.value(forKey: "informe3") as! String
                } else {
                    provincia = ""
                }
                if let a = data.value(forKey: "informe4") {
                    tipoDesastre = data.value(forKey: "informe4") as! String
                } else {
                    tipoDesastre = ""
                }
                if let a = data.value(forKey: "informe5") {
                    tipoEmergencia = data.value(forKey: "informe5") as! String
                } else {
                    tipoEmergencia = ""
                }
                if let a = data.value(forKey: "evalucacion58") {
                    titular = data.value(forKey: "evalucacion58") as! String
                } else {
                    titular = ""
                }
                if let a = data.value(forKey: "evalucacion59") {
                    descripcionDesastre = data.value(forKey: "evalucacion59") as! String
                } else {
                    descripcionDesastre = ""
                }
            }
            //            let Ultimaficha = result[result.count - 1].
            
            
            
            var dateStringFormatter = DateFormatter()
            dateStringFormatter.dateFormat = "yyMMdd"
            let date = Date()
            var fecha1 = dateStringFormatter.string(from: date) + "-"
            dateStringFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss-'00:00'"
            dateStringFormatter.locale = Locale(identifier:"es_cl")
            FechaFormato = dateStringFormatter.string(from: date)
            idFicha = dateStringFormatter.string(from: date) + "-"
            
            
            if let name = dato.object(forKey: "nombrefichains") as? String {
                var indexStartOfText = name.index(name.startIndex, offsetBy: 0)
                self.folio = String(name[...indexStartOfText])
            }
            if let name = dato.object(forKey: "AppPatfichains") as? String {
                var indexStartOfText = name.index(name.startIndex, offsetBy: 0)
                self.folio = self.folio + String(name[...indexStartOfText])
            }
            
            if let name = dato.object(forKey: "AppMatfichains") as? String {
                var indexStartOfText = name.index(name.startIndex, offsetBy: 0)
                self.folio = self.folio + String(name[...indexStartOfText])
            }
            
            if folio.isEmpty {
                self.folio = "NA-"
            } else {
                self.folio = self.folio + "-"
            }
            self.folio = fecha1  +  folio + NombreAnterior + "-" + NombreFicha
            NombreFicha = self.folio
//            }
            print(folio)
            print(idFicha)
            
            let entity = NSEntityDescription.entity(forEntityName: "Ficha", in: context)
            let newUser = NSManagedObject(entity: entity!, insertInto: context)
            newUser.setValue("1", forKey: "estado")
            newUser.setValue(folio, forKey: "folio")
            newUser.setValue(NombreOriginal as String, forKey: "nombre")
            newUser.setValue(FechaFormato, forKey: "fecha")
            NombreFicha = self.folio
            newUser.setValue(idFicha, forKey: "idficha")
            newUser.setValue(info1, forKey: "informe1")
            newUser.setValue(info2, forKey: "informe2")
            newUser.setValue(info3, forKey: "informe3")
            newUser.setValue(info4, forKey: "informe4")
            newUser.setValue(info5, forKey: "informe5")
            // identificacion
            newUser.setValue(info7, forKey: "identificacion1")
            newUser.setValue(info8, forKey: "identificacion2")
            newUser.setValue(info9, forKey: "identificacion3")
            newUser.setValue(info10, forKey: "identificacion4")
            newUser.setValue(info11, forKey: "identificacion5")
            newUser.setValue(info12, forKey: "identificacion6")
            newUser.setValue(info13, forKey: "identificacion7")
            newUser.setValue(info14, forKey: "identificacion8")
            newUser.setValue(info15, forKey: "identificacion9")
            newUser.setValue(info16, forKey: "identificacion10")
            newUser.setValue(info17, forKey: "identificacion11")
            newUser.setValue(info18, forKey: "identificacion12")
            newUser.setValue(info19, forKey: "identificacion13")
            newUser.setValue(info20, forKey: "identificacion14")
            newUser.setValue(info21, forKey: "identificacion15")
            newUser.setValue(info22, forKey: "identificacion16")
            newUser.setValue(info23, forKey: "identificacion17")
            newUser.setValue(info24, forKey: "identificacion18")
            
            newUser.setValue(descripcionDesastre, forKey: "evalucacion59")
            newUser.setValue(titular, forKey: "evalucacion58")
            newUser.setValue(tipoEmergencia, forKey: "informe5")
            newUser.setValue(tipoDesastre, forKey: "informe4")
            newUser.setValue(provincia, forKey: "informe3")
            newUser.setValue(region, forKey: "informe2")
            newUser.setValue(latitud, forKey: "latitud")
            newUser.setValue(longitud, forKey: "longitud")
            
            
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
            for registro in idFichaConsultada {
                idFicha = (registro.value(forKeyPath: "idficha") as? String)!
                //                let a = registro.value(forKeyPath: "folio") as? String
                //                let b = registro.value(forKeyPath: "estado") as? String
                //                let c = registro.value(forKeyPath: "idficha") as? String
                //                print(a , b , c)
            }
            
            let storyboard: UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
            let vc: EvaluacionEdificio = storyboard.instantiateViewController(withIdentifier: "EvaEdi") as! EvaluacionEdificio
            self.present(vc, animated: false, completion: nil)
            
            
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        
    }
    
    func AgregarEdificioSinInformacionAnterior()
    {
//        if idFicha.isEmpty && idFichaConsultada.isEmpty {
            idFichaConsultada.removeAll(keepingCapacity: true)
            idFichaConsultada.removeAll()
            folio = ""
            let dateStringFormatter = DateFormatter()
            dateStringFormatter.dateFormat = "yyMMdd"
            let date = Date()
            let fecha1 = dateStringFormatter.string(from: date) + "-"
            dateStringFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss-'00:00'"
            dateStringFormatter.locale = Locale(identifier:"es_cl")
            FechaFormato = dateStringFormatter.string(from: date)
            idFicha = dateStringFormatter.string(from: date) + "-"
            
            
            if let name = dato.object(forKey: "nombrefichains") as? String {
                var indexStartOfText = name.index(name.startIndex, offsetBy: 0)
                self.folio = String(name[...indexStartOfText])
            }
            if let name = dato.object(forKey: "AppPatfichains") as? String {
                var indexStartOfText = name.index(name.startIndex, offsetBy: 0)
                self.folio = self.folio + String(name[...indexStartOfText])
            }
        
            if let name = dato.object(forKey: "AppMatfichains") as? String {
                var indexStartOfText = name.index(name.startIndex, offsetBy: 0)
                self.folio = self.folio + String(name[...indexStartOfText])
            }
            
            if folio.isEmpty {
                self.folio =  "NA-"
            } else {
               self.folio = self.folio + "-"
            }
            self.folio = fecha1  + folio +  NombreFicha //+ "-"
            //            }
            print(folio)
            print(idFicha)
            
            var info1 = ""
            var info2 = ""
            var info3 = ""
            var info4 = ""
            var info5 = ""
            // se optiene la iformacion general de escritorio
            if let info = dato.object(forKey: "informe1FichaInsPec") as? String {
                info1 = info
            }
            if let info = dato.object(forKey: "informe2FichaInsPec") as? String {
                info2 = info
            }
            if let info = dato.object(forKey: "informe3FichaInsPec") as? String {
                info3 = info
            }
            if let info = dato.object(forKey: "informe4FichaInsPec") as? String {
                info4 = info
            }
            if let info = dato.object(forKey: "informe5FichaInsPec") as? String {
                info5 = info
            }
            
            let entity = NSEntityDescription.entity(forEntityName: "Ficha", in: context)
            let newUser = NSManagedObject(entity: entity!, insertInto: context)
            newUser.setValue("1", forKey: "estado")
            newUser.setValue(folio, forKey: "folio")
            newUser.setValue(info1, forKey: "informe1")
            newUser.setValue(info2, forKey: "informe2")
            newUser.setValue(info3, forKey: "informe3")
            newUser.setValue(info4, forKey: "informe4")
            newUser.setValue(info5, forKey: "informe5")
            NombreFicha = self.folio
            newUser.setValue(idFicha, forKey: "idficha")
            newUser.setValue(FechaFormato, forKey: "fecha")
            do {
                try context.save()
            } catch {
                print("Failed saving")
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

            let storyboard: UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
            let vc: EvaluacionEdificio = storyboard.instantiateViewController(withIdentifier: "EvaEdi") as! EvaluacionEdificio
            self.present(vc, animated: false, completion: nil)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
//        }
    }
    
    @IBAction func Guardar(_ sender: Any) {
        let alert = UIAlertController(title: TituloAlerta, message: msgGuardar, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default,  handler: { action in
            //            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func IrInformacionGeneral(_ sender: Any) {
        TipoInfoGeneral = 1
        let storyboard: UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
        let vc: InformeGeneral = storyboard.instantiateViewController(withIdentifier: "InfoGeneral") as! InformeGeneral
        self.present(vc, animated: false, completion: nil)
    }
    
}
