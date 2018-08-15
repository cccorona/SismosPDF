//
//  EvaluacionSecciones.swift
//  Sismo App_Example
//
//  Created by Cesar Andres Figueroa Mendiola on 09/12/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import TCProgressBar
import CoreData

class EvaluacionSecciones: UIViewController {
    var tipoEvaluacion = 0
    @IBOutlet weak var tituloSecion: UILabel!
    @IBOutlet weak var vistaContenedora: UIView!
    @IBOutlet weak var VistaMenuBar: UIView!
    var VistaCelda3 = Bundle.main.loadNibNamed("Inspeccion3", owner: self, options: nil)?[0] as! Inspeccion3
    var VistaCelda1 = Bundle.main.loadNibNamed("Inspeccion1", owner: self, options: nil)?[0] as! Inspeccion1
    var VistaCelda2 = Bundle.main.loadNibNamed("Inspeccion2", owner: self, options: nil)?[0] as! Inspeccion2
    
    @IBOutlet weak var Barra: TCProgressBar!
    @IBOutlet weak var Nombre: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        Barra.value = CGFloat(AvanceFicha)
        Nombre.text = NombreFicha
    }
    
    override func viewDidLoad() {
        
        if tipoEvaluacion == 1 {
            tituloSecion.text = "SISTEMA ESTRUCTURAL"
            let VistaCelda = Bundle.main.loadNibNamed("SistemaEstructural", owner: self, options: nil)?[0] as! SistemaEstructural
            VistaCelda.frame.size.width = vistaContenedora.frame.width
            VistaCelda.frame.size.height = vistaContenedora.frame.height
            VistaCelda.btnHormigon.tag = 1
            VistaCelda.btnAlba1.tag = 2
            VistaCelda.btnAlba2.tag = 3
            VistaCelda.btnAcero1.tag = 4
            VistaCelda.btnAcero2.tag = 5
            VistaCelda.btnMadera.tag = 6
            
            VistaCelda.btnHormigon.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
            VistaCelda.btnAlba1.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
            VistaCelda.btnAlba2.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
            VistaCelda.btnAcero1.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
            VistaCelda.btnAcero2.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
            VistaCelda.btnMadera.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
            
            
            if  !idFichaConsultada.isEmpty {
                var a = idFichaConsultada.first?.value(forKeyPath: "evalucacion36") as? String
                if (a != "" && a != nil) {
                    VistaCelda.btnHormigon.setTitle(a, for: UIControlState.normal)
                }
                a = idFichaConsultada.first?.value(forKeyPath: "evalucacion37") as? String
                if (a != "" && a != nil) {
                    VistaCelda.btnAlba1.setTitle(a, for: UIControlState.normal)
                }
                
                a = idFichaConsultada.first?.value(forKeyPath: "evalucacion38") as? String
                if (a != "" && a != nil) {
                    VistaCelda.btnAlba2.setTitle(a, for: UIControlState.normal)
                }
                
                a = idFichaConsultada.first?.value(forKeyPath: "evalucacion39") as? String
                if (a != "" && a != nil) {
                    VistaCelda.btnAcero1.setTitle(a, for: UIControlState.normal)
                }
                
                a = idFichaConsultada.first?.value(forKeyPath: "evalucacion40") as? String
                if (a != "" && a != nil) {
                    VistaCelda.btnAcero2.setTitle(a, for: UIControlState.normal)
                }
                a = idFichaConsultada.first?.value(forKeyPath: "evalucacion41") as? String
                if (a != "" && a != nil) {
                    VistaCelda.btnMadera.setTitle(a, for: UIControlState.normal)
                }
            }
            
            
            vistaContenedora.addSubview(VistaCelda as UIView)
        } else if tipoEvaluacion == 2 {
            tituloSecion.text = "INSPECCIÓN 1"
            VistaCelda1 = Bundle.main.loadNibNamed("Inspeccion1", owner: self, options: nil)?[0] as! Inspeccion1
            VistaCelda1.frame.size.width = vistaContenedora.frame.width
            VistaCelda1.btnSeleccionar.tag = 7
            VistaCelda1.btnSeleccionar.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
            if  !idFichaConsultada.isEmpty {
                var a = idFichaConsultada.first?.value(forKeyPath: "evalucacion43") as? String
                if (a != "" && a != nil) {
                    VistaCelda1.btnSeleccionar.setTitle(a, for: UIControlState.normal)
                }
            }
            vistaContenedora.addSubview(VistaCelda1 as UIView)
        } else if tipoEvaluacion == 3 {
            evalucacion45 = "Columnas"
            tituloSecion.text = "INSPECCIÓN 2"
            VistaCelda2 = Bundle.main.loadNibNamed("Inspeccion2", owner: self, options: nil)?[0] as! Inspeccion2
            VistaCelda2.frame.size.width = vistaContenedora.frame.width
            VistaCelda2.btnSeleccionar.tag = 8
            VistaCelda2.btnSeleccionar.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
            if  !idFichaConsultada.isEmpty {
                
                
                
                var a = idFichaConsultada.first?.value(forKeyPath: "evalucacion45") as? String
                if (a != "" && a != nil) {
                    VistaCelda2.btnSeleccionar.setTitle(a, for: UIControlState.normal)
                }
            }
            
            evalucacion45 = "Columnas"
            
            VistaCelda2.lblNinguno.text = "0"
            VistaCelda2.lblLeve.text = "0"
            VistaCelda2.lblModerado.text = "0"
            VistaCelda2.lblFuerte.text = "0"
            VistaCelda2.lblSevero.text = "0"
            
            
//            self.CambiaInspeccion2()
            vistaContenedora.addSubview(VistaCelda2 as UIView)
        } else if tipoEvaluacion == 4 {
            tituloSecion.text = "INSPECCIÓN 3"
            VistaCelda3 = Bundle.main.loadNibNamed("Inspeccion3", owner: self, options: nil)?[0] as! Inspeccion3
            VistaCelda3.frame.size.width = vistaContenedora.frame.width
            VistaCelda3.btnSeleccionar.tag = 9
            VistaCelda3.btnSeleccionar.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
            
            self.CambiaInspeccion3()

            
            
            //            items = ["Marcos y vidrios de ventana", "Cielos falsos","Escaleras","Muros no estructurales con marcos","Muros no estructurales sin marcos", "Estanques, Antenas, Balcones, Letreros, Maquinaria, etc.","Bienes muebles 1","Bienes muebles 2","Bienes muebles 2","Otro(s) Perligro(s)" ]
            
            
//            if  !idFichaConsultada.isEmpty {
//                var a = idFichaConsultada.first?.value(forKeyPath: "evalucacion51") as? String
//                if (a != "" && a != nil) {
//                    VistaCelda3.btnSeleccionar.setTitle(a, for: UIControlState.normal)
//                }
//            }
            
            vistaContenedora.addSubview(VistaCelda3 as UIView)
        } else if tipoEvaluacion == 5 {
            tituloSecion.text = "INFORMACIÓN GENERAL"
            let VistaCelda5 = Bundle.main.loadNibNamed("NuevaIdentificacionGeografica", owner: self, options: nil)?[0] as! NuevaIdentificacionGeografica
            
            VistaCelda5.frame.size.width = vistaContenedora.frame.width
            VistaCelda5.btnPais.tag = 10
            VistaCelda5.btnPais.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
            VistaCelda5.btnRegion.tag = 11
            VistaCelda5.btnRegion.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
            VistaCelda5.btnProvencia.tag = 12
            VistaCelda5.btnProvencia.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
            vistaContenedora.addSubview(VistaCelda5 as UIView)
        }
        
        
        
        self.VistaMenuBar.layer.borderWidth = 1
        self.VistaMenuBar.layer.borderColor = UIColor.black.cgColor
        self.VistaMenuBar.layer.borderWidth = 1
        self.VistaMenuBar.layer.borderColor = UIColor.black.cgColor
        
        
    }
    func CambiaInspeccion1(){
        if (evalucacion43 == "Colapso")   {
            VistaCelda1.t1.text = "No"
            VistaCelda1.t2.text = "Parcial"
            VistaCelda1.t3.text = "Total "
            
        } else if (evalucacion43 == "Daño producto de Edificaciones Adyacentes o falla del suelo colindante")   {
            VistaCelda1.t1.text = "No"
            VistaCelda1.t2.text = "Incierto"
            VistaCelda1.t3.text = "Si"
        } else if (evalucacion43 == "Asentamiento del Edificio debido a Falla de suelo")   {
            VistaCelda1.t1.text = "< 0.2 m"
            VistaCelda1.t2.text = "Entre 0.2 y 1.0m"
            VistaCelda1.t3.text = "> 1.0m"
        } else if (evalucacion43 == "Inclinación del Edificio completo o una parte debido a asentamiento diferencial")   {
            VistaCelda1.t1.text = "< 1/60 rad"
            VistaCelda1.t2.text = "Entre 1/60 y 1/30 rad (aparentemente inclinado)"
            VistaCelda1.t3.text = "> 1/30 rad (fácil de notar)"
        } else if (evalucacion43 == "Deformación de Estructura de Techo del Edificio total o parcial")   {
            VistaCelda1.t1.text = "< 1/60 rad"
            VistaCelda1.t2.text = "Entre 1/60 y 1/30 rad (aparentemente inclinado)"
            VistaCelda1.t3.text = "> 1/30 rad (fácil de notar o grietas de cordones)"
        }
//            items = ["Colapso Total o Parcial", "Daño producto de Edificaciones Adyacentes o falla del suelo colindante","Asentamiento del Edificio debido a Falla de bsuelo","Inclinación del Edificio completo o una parte debido a asentamiento diferencial", "Deformación de Estructura de Techo del Edificio total o parcial" ]
    }
    func CambiaInspeccion3(){
        if (evalucacion51 == "Cielos falsos")   {
            VistaCelda3.t1.text = "Sin daños"
            VistaCelda3.t2.text = "Se observa daño"
            VistaCelda3.t3.text = "Peligro de caída"
            VistaCelda3.Otro.isHidden = true
            
        } else if (evalucacion51 == "Escaleras") {
            VistaCelda3.t1.text = "Sin o poco daño"
            VistaCelda3.t2.text = "Gran cantidad de grietas pero las barras de refuerzo están ancladas"
            VistaCelda3.t3.text = "Inclinación/Separación de los elementos con que se conecta, barras de anclaje separadas del elemento"
            VistaCelda3.Otro.isHidden = true
            
        } else if (evalucacion51 == "Muros no estructurales con marcos") {
            VistaCelda3.t1.text = "Sin o poco daño"
            VistaCelda3.t2.text = "Se observa grietas sin deformación fuera del plano"
            VistaCelda3.t3.text = "Grietas extensas interconectadas, o deformación fuera del plano"
            VistaCelda3.Otro.isHidden = true
            
        } else if (evalucacion51 == "Muros no estructurales sin marcos") {
            VistaCelda3.t1.text = "Sin daños"
            VistaCelda3.t2.text = "Grietas leves"
            VistaCelda3.t3.text = "Grietas de corte, grietas de esquina"
            VistaCelda3.Otro.isHidden = true
            
        } else if (evalucacion51 == "Estanques, Antenas, Balcones, Letreros, Maquinaria, etc.") {
            VistaCelda3.t1.text = "Sin inclinación"
            VistaCelda3.t2.text = "Un poco inclinado"
            VistaCelda3.t3.text = "Peligro de caída"
            VistaCelda3.Otro.isHidden = true
            
        } else if (evalucacion51 == "Bienes muebles 1") {
            VistaCelda3.t1.text = "Sin inclinación"
            VistaCelda3.t2.text = "Un poco inclinado"
            VistaCelda3.t3.text = "Peligro de caída"
            VistaCelda3.Otro.isHidden = false
            checkOtherValueSelectedFor(value: evalucacion51)
            
        } else if (evalucacion51 == "Bienes muebles 2") {
            VistaCelda3.t1.text = "Sin inclinación"
            VistaCelda3.t2.text = "Un poco inclinado"
            VistaCelda3.t3.text = "Peligro de caída"
            VistaCelda3.Otro.isHidden = false
            VistaCelda3.Otro.text = ""
            checkOtherValueSelectedFor(value: evalucacion51)
            
        } else if (evalucacion51 == "Bienes muebles 3") {
            VistaCelda3.t1.text = "Sin inclinación"
            VistaCelda3.t2.text = "Un poco inclinado"
            VistaCelda3.t3.text = "Peligro de caída"
            VistaCelda3.Otro.isHidden = false
            VistaCelda3.Otro.text = ""
            checkOtherValueSelectedFor(value: evalucacion51)
            
        } else if (evalucacion51 == "Otro(s) Perligro(s)") {
            VistaCelda3.t1.text = "Sin daños"
            VistaCelda3.t2.text = "Se observa daño"
            VistaCelda3.t3.text = "Peligro para la vida"
            VistaCelda3.Otro.isHidden = false
            VistaCelda3.Otro.text = ""
            checkOtherValueSelectedFor(value: evalucacion51)
            
        } else if (evalucacion51 == "Marcos y vidrios de ventana") {
            VistaCelda3.t1.text = "Sin o poco daño"
            VistaCelda3.t2.text = "Deformación visible y/o grietas"
            VistaCelda3.t3.text = "Peligro de caída"
            VistaCelda3.Otro.isHidden = true
        }
        
    }
    
    func checkOtherValueSelectedFor(value:String){
        VistaCelda3.Otro.text = ""
        let managedContext =
            appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Insp3")
        fetchRequest.predicate = NSPredicate(format: "(idficha = %@)", idFicha)
        do {
            let managed = try managedContext.fetch(fetchRequest)
            for registro in managed {
                if ((registro.value(forKeyPath: "respuesta") as! NSString).description == value){
                    VistaCelda3.Otro.text = registro.value(forKeyPath: "otros") as? String
                }
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    
    func CambiaInspeccion2(  ) {

        idFichaListado2.removeAll(keepingCapacity: true)
        idFichaListado2.removeAll()
        let managedContext =
            appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Insp2")
        fetchRequest.predicate = NSPredicate(format: "(idficha = %@) AND (elemento == %@)", idFicha, evalucacion45 )
        
        do {
            idFichaListado2 = try managedContext.fetch(fetchRequest)
            for registro in idFichaListado2 {
                VistaCelda2.lblNinguno.text =  (idFichaListado2.first!.value(forKeyPath: "ele1") as! NSString ).description
                VistaCelda2.lblLeve.text = (idFichaListado2.first?.value(forKeyPath: "ele2") as! NSString ).description
                VistaCelda2.lblModerado.text  = (idFichaListado2.first?.value(forKeyPath: "ele3") as! NSString ).description
                VistaCelda2.lblFuerte.text  = (idFichaListado2.first?.value(forKeyPath: "ele4") as! NSString ).description
                VistaCelda2.lblSevero.text  = (idFichaListado2.first?.value(forKeyPath: "ele5") as! NSString ).description
            }
             if idFichaListado2.isEmpty {
                VistaCelda2.lblNinguno.text = "0"
                VistaCelda2.lblLeve.text = "0"
                VistaCelda2.lblModerado.text = "0"
                VistaCelda2.lblFuerte.text = "0"
                VistaCelda2.lblSevero.text = "0"
            }
            
//            let storyboard: UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
//            let vc: Listado3Elementos = storyboard.instantiateViewController(withIdentifier: "listado3") as! Listado3Elementos
//            let currentController = getCurrentViewController()
//            currentController?.present(vc, animated: false, completion: nil)
            
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    func EjecutarBtn(_ sender: UIButton) {
        var items = ["Si", "No", "No se", ]
       // *************** Sistema Estructural  ********************
        if sender.tag == 1{
            items = ["Marcos", "Muros","Mixto" ]
        }else if sender.tag == 2{
            items = ["Simple","Confinada","Armada","Contrafuerte" ]
        } else if sender.tag == 3 {
            items = ["Fiscal","Cerámico","Hormigon","Adobe","Piedra","Otro" ]
        } else if sender.tag == 4 {
            items = ["Marcos Arriostrados","Marcos Rigidos" ]
        } else if sender.tag == 5 {
            items = ["Soldado","Apernadas", "Mixto" ]
        } else if sender.tag == 6 {
            items = ["Marcos de Madera","Muros de Madera", "Quincha" ]
        // *************** INSPECCION 1  ********************
            
        } else if sender.tag == 7 {
            items = ["Colapso", "Daño producto de Edificaciones Adyacentes o falla del suelo colindante","Asentamiento del Edificio debido a Falla de suelo","Inclinación del Edificio completo o una parte debido a asentamiento diferencial", "Deformación de Estructura de Techo del Edificio total o parcial" ]
            
        // *************** INSPECCION 2  ********************
        } else if sender.tag == 8 {
            items = ["Columnas","Muros", "Vigas", "Uniones o Nudo","Uniones Soldadas","Uniones Apernadas",  "Losas", "Entrepiso de Madera","Techumbre" ]
         // *************** INSPECCION 3  *******************
        } else if sender.tag == 9 {
            items = ["Marcos y vidrios de ventana", "Cielos falsos","Escaleras","Muros no estructurales con marcos","Muros no estructurales sin marcos", "Estanques, Antenas, Balcones, Letreros, Maquinaria, etc.","Bienes muebles 1","Bienes muebles 2","Bienes muebles 3","Otro(s) Perligro(s)" ]
        } else if sender.tag == 10 {
            items = ["Chile" ]
        } else if sender.tag == 11 {
            items = ["Antofagasta",
                "Arica y Parinacota",
                "Atacama",
                "Aysén del Gral. Carlos Ibáñez del Campo",
                "Coquimbo",
                "de la Araucanía",
                "de los Lagos",
                "del Biobío",
                "del Libertador Gral. Bernardo O'higgins",
                "del Maule",
                "Los Ríos",
                "Magallanes",
                "Metropolitana",
                "Tarapaca",
                "Valparaiso", ]
        } else if sender.tag == 12 {
            items = ["Aisen",
                "Antartica Chilena",
                "Antofagasta",
                "Arauco",
                "Arica",
                "Biobio",
                "Cachapoal",
                "Capitan Prat",
                "Cardenal Caro",
                "Cauquenes",
                "Cautin",
                "Chacabuco",
                "Chañaral",
                "Chiloe",
                "Choapa",
                "Coihaique",
                "Colchagua",
                "Concepción",
                "Copiapo",
                "Cordillera",
                "Curicó",
                "El Loa",
                "Elqui",
                "General Carrera",
                "Huasco",
                "Iquique",
                "Isla de Pascua",
                "Limarí",
                "Linares",
                "Llanquihue",
                "Los Andes",
                "Magallanes",
                "Maipo",
                "Malleco",
                "Marga Marga",
                "Melipilla",
                "Ñuble",
                "Osorno",
                "Palena",
                "Parinacota",
                "Petorca",
                "Quillota",
                "Ranco",
                "San Antonio",
                "San Felipe de Aconcagua",
                "Santiago",
                "Talagante",
                "Talca",
                "Tamarugal",
                "Tierra del Fuego",
                "Tocopilla",
                "Ultima Esperanza",
                "Valdivia",
                "Valparaiso", ]
        }
        
        let params = Parameters(title: "Seleccionar ...", items: items, cancelButton: "Cancelar")
        
        SelectItemController().show(parent: self, params: params) { (index) in
            if let index = index {
                print("selected: \(items[index])")
                sender.setTitle(items[index], for: UIControlState.normal)
                // *************** Sistema Estructural  ********************
                if sender.tag == 1{
                    evalucacion36 = items[index]
                }else if sender.tag == 2{
                    evalucacion37 = items[index]
                    if evalucacion38 == ""{
                        evalucacion38 = "Fiscal"
                    }
                } else if sender.tag == 3 {
                    evalucacion38 = items[index]
                } else if sender.tag == 4 {
                    evalucacion39 = items[index]
                    if evalucacion40 == ""{
                        evalucacion40 = "Fiscal"
                    }
                } else if sender.tag == 5 {
                    evalucacion40 = items[index]
                } else if sender.tag == 6 {
                    evalucacion41 = items[index]
// *************** INSPECCION 1  ********************
                } else if sender.tag == 7 {
                    evalucacion43 = items[index]
                    self.CambiaInspeccion1()
// *************** INSPECCION 2  ********************
                } else if sender.tag == 8 {
                    evalucacion45 = items[index]
                    self.CambiaInspeccion2()
// *************** INSPECCION 3  ********************
//            items = ["Marcos y vidrios de ventana", "Terminaciones exteriores","Terminaciones interiores","Cielos falsos","Ductos de ventilación","Escaleras","Muros no estructurales con marcos","Muros no estructurales sin marcos", "Estanques, Antenas, Balcones, Letreros","Cubierta de techo","Lampisteria","Bienes muebles 1","Bienes muebles 2","Otro(s) Perligro(s)" ]
                } else if sender.tag == 9 {
                    evalucacion51 = items[index]
                    self.CambiaInspeccion3()
                    
                    
                    
// *************** IDENTIFICACION GEOGRAFICA  ********************
                } else if sender.tag == 10 {
                    evalucacion51 = items[index]
                } else if sender.tag == 11 {
                    evalucacion51 = items[index]
                } else if sender.tag == 12 {
                    evalucacion51 = items[index]
                }
            } else {
                print("cancel")
            }
            
        }
    }
    
    
    @IBAction func VentanaAtras(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func BotonHome(_ sender: Any) {
       self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func BotonGuardar(_ sender: Any) {
        let alert = UIAlertController(title: TituloAlerta, message: msgGuardar, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default,  handler: { action in
//            self.dismiss(animated: true, completion: nil)
            self.GuardarInformacion()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func GuardarInformacion(){
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
                    managedObject.setValue(evalucacion1, forKey: "evalucacion1")
                    managedObject.setValue(evalucacion2, forKey: "evalucacion2")
                    managedObject.setValue(evalucacion3, forKey: "evalucacion3")
                    managedObject.setValue(evalucacion4, forKey: "evalucacion4")
                    managedObject.setValue(evalucacion5, forKey: "evalucacion5")
                    managedObject.setValue(evalucacion6, forKey: "evalucacion6")
                    managedObject.setValue(evalucacion7, forKey: "evalucacion7")
                    managedObject.setValue(evalucacion8, forKey: "evalucacion8")
                    managedObject.setValue(evalucacion9, forKey: "evalucacion9")
                    managedObject.setValue(evalucacion10, forKey: "evalucacion10")
                    managedObject.setValue(evalucacion11, forKey: "evalucacion11")
                    managedObject.setValue(evalucacion12, forKey: "evalucacion12")
                    managedObject.setValue(evalucacion13, forKey: "evalucacion13")
                    managedObject.setValue(evalucacion14, forKey: "evalucacion14")
                    managedObject.setValue(evalucacion15, forKey: "evalucacion15")
                    managedObject.setValue(evalucacion16, forKey: "evalucacion16")
                    managedObject.setValue(evalucacion17, forKey: "evalucacion17")
                    managedObject.setValue(evalucacion18, forKey: "evalucacion18")
                    managedObject.setValue(evalucacion19, forKey: "evalucacion19")
                    managedObject.setValue(evalucacion20, forKey: "evalucacion20")
                    managedObject.setValue(evalucacion21, forKey: "evalucacion21")
                    managedObject.setValue(evalucacion22, forKey: "evalucacion22")
                    managedObject.setValue(evalucacion23, forKey: "evalucacion23")
                    managedObject.setValue(evalucacion24, forKey: "evalucacion24")
                    managedObject.setValue(evalucacion25, forKey: "evalucacion25")
                    managedObject.setValue(evalucacion26, forKey: "evalucacion26")
                    managedObject.setValue(evalucacion27, forKey: "evalucacion27")
                    managedObject.setValue(evalucacion28, forKey: "evalucacion28")
                    managedObject.setValue(evalucacion29, forKey: "evalucacion29")
                    managedObject.setValue(evalucacion30, forKey: "evalucacion30")
                    managedObject.setValue(evalucacion31, forKey: "evalucacion31")
                    managedObject.setValue(evalucacion32, forKey: "evalucacion32")
                    managedObject.setValue(evalucacion33, forKey: "evalucacion33")
                    managedObject.setValue(evalucacion34, forKey: "evalucacion34")
                    managedObject.setValue(evalucacion35, forKey: "evalucacion35")
                    managedObject.setValue(evalucacion36, forKey: "evalucacion36")
                    managedObject.setValue(evalucacion37, forKey: "evalucacion37")
                    managedObject.setValue(evalucacion38, forKey: "evalucacion38")
                    managedObject.setValue(evalucacion39, forKey: "evalucacion39")
                    managedObject.setValue(evalucacion40, forKey: "evalucacion40")
                    managedObject.setValue(evalucacion41, forKey: "evalucacion41")
                    managedObject.setValue(evalucacion42, forKey: "evalucacion42")
                    managedObject.setValue(evalucacion43, forKey: "evalucacion43")
                    managedObject.setValue(evalucacion44, forKey: "evalucacion44")
                    managedObject.setValue(evalucacion45, forKey: "evalucacion45")
                    managedObject.setValue(evalucacion46, forKey: "evalucacion46")
                    managedObject.setValue(evalucacion47, forKey: "evalucacion47")
                    managedObject.setValue(evalucacion48, forKey: "evalucacion48")
                    managedObject.setValue(evalucacion49, forKey: "evalucacion49")
                    managedObject.setValue(evalucacion50, forKey: "evalucacion50")
                    managedObject.setValue(evalucacion51, forKey: "evalucacion51")
                    managedObject.setValue(evalucacion52, forKey: "evalucacion52")
                    managedObject.setValue(evalucacion53, forKey: "evalucacion53")
                    managedObject.setValue(evalucacion54, forKey: "evalucacion54")
                    managedObject.setValue(evalucacion55, forKey: "evalucacion55")
                    managedObject.setValue(evalucacion56, forKey: "evalucacion56")                                        
                    //identificacion geografica
                    managedObject.setValue(evalucacion57, forKey: "evalucacion57")
                    managedObject.setValue(evalucacion58, forKey: "evalucacion58")
                    managedObject.setValue(evalucacion59, forKey: "evalucacion59")
                    
                    //fin de campos
                    managedObject.setValue(evalucacion60, forKey: "evalucacion60")
                    managedObject.setValue(evalucacion61, forKey: "evalucacion61")
                    managedObject.setValue(evalucacion62, forKey: "evalucacion62")
                    
                    try context.save()
                }
            }
            
        } catch  let error as  NSError {
            print ( "No se pudo recuperar. " )
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
