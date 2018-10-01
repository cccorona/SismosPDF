//
//  EvaluacionEdificio.swift
//  Sismo App_Example
//
//  Created by Cesar Andres Figueroa Mendiola on 05/12/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

//
//  IdentificacionInmueble.swift
//  Sismo App_Example
//
//  Created by Cesar Andres Figueroa Mendiola on 05/12/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import ExpyTableView
import CoreData
import TCProgressBar
import PWSwitch

//detallar recomendación original

class EvaluacionEdificio: UIViewController {
    
    @IBOutlet weak var Barra: TCProgressBar!
    @IBOutlet weak var VistaBar: UIView!
    @IBOutlet weak var expandableTableView: ExpyTableView!
    var  arraySecciones = ["GENERAL","INSPECCION GENERAL","INSTALACIONES", "EVALUCACION ESTRUCTURAL","RESUMEN EVALUACIÓN FINAL","RECOMENDACIONES INICIALES","TOMAR FOTO"]
    var bandera = 0
    var BanderaCambio = 0
    
    @IBOutlet weak var Nombre: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        expandableTableView.dataSource = self
        expandableTableView.delegate = self //Optional. In this example we use didSelectRowAtIndexPath to solve a known problem. Sepearator disapperance.
        self.VistaBar.layer.borderWidth = 1
        self.VistaBar.layer.borderColor = UIColor.black.cgColor
        self.VistaBar.layer.borderWidth = 1
        self.VistaBar.layer.borderColor = UIColor.black.cgColor
        
        foto1 = nil
        foto2 = nil
        foto3 = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Basic Example"
        Barra.value = CGFloat(AvanceFicha)
        Nombre.text = NombreFicha
    }
    
    

    
    @IBAction func TerminarSeccion(_ sender: Any) {
        let alert = UIAlertController(title: TituloAlerta, message: msgGuardar, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default,  handler: { action in
            self.dismiss(animated: true, completion: nil)
        }))
        GuardarInformacion()
        let checkProgress = CheckCoreData()
        checkProgress.checkProgress()
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func GuardarInformacion(_ sender: Any) {
        let alert = UIAlertController(title: TituloAlerta, message: msgGuardar, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default,  handler: { action in
//            self.dismiss(animated: true, completion: nil)
        }))
        GuardarInformacion()
        let checkProgress = CheckCoreData()
        checkProgress.checkProgress()
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
                    let managedObject = fetchResults[0]
                    if evalucacion1 != ""{
                        managedObject.setValue(evalucacion1, forKey: "evalucacion1")
                    }
                    if evalucacion2 != ""{
                        managedObject.setValue(evalucacion2, forKey: "evalucacion2")
                    }
                    if evalucacion3 != ""{
                    managedObject.setValue(evalucacion3, forKey: "evalucacion3")
                    }
                    if evalucacion4 != ""{
                    managedObject.setValue(evalucacion4, forKey: "evalucacion4")
                    }
                    if evalucacion5 != ""{
                    managedObject.setValue(evalucacion5, forKey: "evalucacion5")
                    }
                    if evalucacion6 != ""{
                    managedObject.setValue(evalucacion6, forKey: "evalucacion6")
                    }
                    if evalucacion7 != ""{
                    managedObject.setValue(evalucacion7, forKey: "evalucacion7")
                    }
                    if evalucacion8 != ""{
                    managedObject.setValue(evalucacion8, forKey: "evalucacion8")
                    }
                    if evalucacion9 != ""{
                    managedObject.setValue(evalucacion9, forKey: "evalucacion9")
                    }
                    if evalucacion10 != ""{
                    managedObject.setValue(evalucacion10, forKey: "evalucacion10")
                    }
                    if evalucacion11 != ""{
                    managedObject.setValue(evalucacion11, forKey: "evalucacion11")
                    }
                    if evalucacion12 != ""{
                    managedObject.setValue(evalucacion12, forKey: "evalucacion12")
                    }
                    if evalucacion13 != ""{
                    managedObject.setValue(evalucacion13, forKey: "evalucacion13")
                    }
                    if evalucacion14 != ""{
                    managedObject.setValue(evalucacion14, forKey: "evalucacion14")
                    }
                    if evalucacion15 != ""{
                    managedObject.setValue(evalucacion15, forKey: "evalucacion15")
                    }
                    if evalucacion16 != ""{
                    managedObject.setValue(evalucacion16, forKey: "evalucacion16")
                    }
                    if evalucacion17 != ""{
                    managedObject.setValue(evalucacion17, forKey: "evalucacion17")
                    }
                    if evalucacion18 != ""{
                    managedObject.setValue(evalucacion18, forKey: "evalucacion18")
                    }
                    if evalucacion19 != ""{
                    managedObject.setValue(evalucacion19, forKey: "evalucacion19")
                    }
                    if evalucacion20 != ""{
                    managedObject.setValue(evalucacion20, forKey: "evalucacion20")
                    }
                    if evalucacion21 != ""{
                    managedObject.setValue(evalucacion21, forKey: "evalucacion21")
                    }
                    if evalucacion22 != ""{
                    managedObject.setValue(evalucacion22, forKey: "evalucacion22")
                    }
                    if evalucacion23 != ""{
                    managedObject.setValue(evalucacion23, forKey: "evalucacion23")
                    }
                    if evalucacion24 != ""{
                    managedObject.setValue(evalucacion24, forKey: "evalucacion24")
                    }
                    if evalucacion25 != ""{
                    managedObject.setValue(evalucacion25, forKey: "evalucacion25")
                    }
                    if evalucacion26 != ""{
                    managedObject.setValue(evalucacion26, forKey: "evalucacion26")
                    }
                    if evalucacion27 != ""{
                    managedObject.setValue(evalucacion27, forKey: "evalucacion27")
                    }
                    if evalucacion28 != ""{
                    managedObject.setValue(evalucacion28, forKey: "evalucacion28")
                    }
                    if evalucacion29 != ""{
                    managedObject.setValue(evalucacion29, forKey: "evalucacion29")
                    }
                    if evalucacion30 != ""{
                    managedObject.setValue(evalucacion30, forKey: "evalucacion30")
                    }
                    if evalucacion31 != ""{
                    managedObject.setValue(evalucacion31, forKey: "evalucacion31")
                    }
                    if evalucacion32 != ""{
                    managedObject.setValue(evalucacion32, forKey: "evalucacion32")
                    }
                    if evalucacion33 != ""{
                    managedObject.setValue(evalucacion33, forKey: "evalucacion33")
                    }
                    if evalucacion34 != ""{
                    managedObject.setValue(evalucacion34, forKey: "evalucacion34")
                    }
                    if evalucacion35 != ""{
                    managedObject.setValue(evalucacion35, forKey: "evalucacion35")
                    }
                    if evalucacion36 != ""{
                    managedObject.setValue(evalucacion36, forKey: "evalucacion36")
                    }
                    if evalucacion37 != ""{
                    managedObject.setValue(evalucacion37, forKey: "evalucacion37")
                    }
                    if evalucacion38 != ""{
                    managedObject.setValue(evalucacion38, forKey: "evalucacion38")
                    }
                    if evalucacion39 != ""{
                    managedObject.setValue(evalucacion39, forKey: "evalucacion39")
                    }
                    if evalucacion40 != ""{
                    managedObject.setValue(evalucacion40, forKey: "evalucacion40")
                    }
                    if evalucacion41 != ""{
                    managedObject.setValue(evalucacion41, forKey: "evalucacion41")
                    }
                    if evalucacion42 != ""{
                    managedObject.setValue(evalucacion42, forKey: "evalucacion42")
                    }
                    if evalucacion43 != ""{
                    managedObject.setValue(evalucacion43, forKey: "evalucacion43")
                    }
                    if evalucacion44 != ""{
                    managedObject.setValue(evalucacion44, forKey: "evalucacion44")
                    }
                    if evalucacion45 != ""{
                    managedObject.setValue(evalucacion45, forKey: "evalucacion45")
                    }
                    if evalucacion46 != ""{
                    managedObject.setValue(evalucacion46, forKey: "evalucacion46")
                    }
                    if evalucacion47 != ""{
                    managedObject.setValue(evalucacion47, forKey: "evalucacion47")
                    }
                    if evalucacion48 != ""{
                    managedObject.setValue(evalucacion48, forKey: "evalucacion48")
                    }
                    if evalucacion49 != ""{
                    managedObject.setValue(evalucacion49, forKey: "evalucacion49")
                    }
                    if evalucacion50 != ""{
                    managedObject.setValue(evalucacion50, forKey: "evalucacion50")
                    }
                    if evalucacion51 != ""{
                    managedObject.setValue(evalucacion51, forKey: "evalucacion51")
                    }
                    if evalucacion52 != ""{
                    managedObject.setValue(evalucacion52, forKey: "evalucacion52")
                    }
                    if evalucacion53 != ""{
                    managedObject.setValue(evalucacion53, forKey: "evalucacion53")
                    }
                    if evalucacion54 != ""{
                    managedObject.setValue(evalucacion54, forKey: "evalucacion54")
                    }
                    if evalucacion55 != ""{
                    managedObject.setValue(evalucacion55, forKey: "evalucacion55")
                    }
                    if evalucacion56 != ""{
                    managedObject.setValue(evalucacion56, forKey: "evalucacion56")
                    }
                    if evalucacion57 != ""{
                    managedObject.setValue(evalucacion57, forKey: "evalucacion57")
                    }
                    if evalucacion58 != ""{
                    managedObject.setValue(evalucacion58, forKey: "evalucacion58")
                    }
                    if evalucacion59 != ""{
                    managedObject.setValue(evalucacion59, forKey: "evalucacion59")
                    }
                    if evalucacion60 != ""{
                    managedObject.setValue(evalucacion60, forKey: "evalucacion60")
                    }
                    if evalucacion61 != ""{
                    managedObject.setValue(evalucacion61, forKey: "evalucacion61")
                    }
                    if evalucacion62 != ""{
                    managedObject.setValue(evalucacion62, forKey: "evalucacion62")
                    
                    }
                    if foto1 != nil{
                    managedObject.setValue(foto1, forKey: "foto1")
                    }
                    if foto2 != nil{
                    managedObject.setValue(foto2, forKey: "foto2")
                    }
                    if foto3 != nil{
                    managedObject.setValue(foto3, forKey: "foto3")
                    }

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
    
    
    func EjecutarBtn(_ sender: UIButton) {
        var items = ["Si", "No", "No se", ]
        
        if sender.tag == 1 {
            items = ["Aislado", "Pareado", "Mixto"]
        } else if sender.tag == 2 {
           items = ["Normal", "Parcial", "No Operativo"]
        } else if sender.tag == 3 {
            items = ["Visual solo exterior", "Seguro de inspeccionar", "Inseguro de inspeccionar"]
        } else if (sender.tag == 4) || (sender.tag == 6) || (sender.tag == 8) || (sender.tag == 10) || (sender.tag == 12) || (sender.tag == 14) || (sender.tag == 16) || (sender.tag == 18)  {
            items = ["Si", "No"]
        } else     if (sender.tag == 5) || (sender.tag == 7) || (sender.tag == 9) || (sender.tag == 11) || (sender.tag == 13) || (sender.tag == 15) || (sender.tag == 17) || (sender.tag == 19)  {
            items = ["Normal", "Intermitente","No operativo"]
// **************** EVALUACION FINAL *********************
        } else if sender.tag == 20 {
            items = ["Inspeccionado", "Ingreso Limitado", "Inseguro"]
// **************** RECOMENDACIONES *********************
        } else if sender.tag == 21 {
            items = ["Apuntalar","Alzaprimar","Remover Objetos Peligrosos","Acordonar","Protección de Fachade de Lluvia","Remoción de ceniza volcanica","Remoción de barro en superficie","Destapar tuberias Alcantarillado y Limpieza","Corte de suministro(Gas, Electrico, Agua)","Otras" ]
        }
        let params = Parameters(title: "Seleccionar ...", items: items, cancelButton: "Cancelar")
        SelectItemController().show(parent: self, params: params) { (index) in
            if let index = index {
                print("selected: \(items[index])")
                sender.setTitle(items[index], for: UIControlState.normal)
                if sender.tag == 1 { //general
                    evalucacion6 = items[index]
                } else if sender.tag == 2 {
                    evalucacion7 = items[index]
                } else if sender.tag == 3 {
                    evalucacion53 = items[index]
// **************** Instalaciones *********************
                // Instalaciones Si, No
                } else if sender.tag == 4 {
                    evalucacion11 = items[index]
                } else if sender.tag == 6 {
                    evalucacion14 = items[index]
                } else if sender.tag == 8 {
                    evalucacion17 = items[index]
                } else if sender.tag == 10 {
                    evalucacion20 = items[index]
                } else if sender.tag == 12 {
                    evalucacion23 = items[index]
                } else if sender.tag == 14 {
                    evalucacion26 = items[index]
                } else if sender.tag == 16 {
                    evalucacion29 = items[index]
                } else if sender.tag == 18 {
                    evalucacion33 = items[index]
                
                    // Instalaciones Otros
                } else if sender.tag == 5 {
                    evalucacion12 = items[index]
                } else if sender.tag == 7 {
                    evalucacion15 = items[index]
                } else if sender.tag == 9 {
                    evalucacion18 = items[index]
                } else if sender.tag == 11 {
                    evalucacion21 = items[index]
                } else if sender.tag == 13 {
                    evalucacion24 = items[index]
                } else if sender.tag == 15 {
                    evalucacion27 = items[index]
                } else if sender.tag == 17 {
                    evalucacion30 = items[index]
                } else if sender.tag == 19 {
                    evalucacion34 = items[index]
// **************** EVALUACION FINAL *********************
                } else if sender.tag == 20 {
                    evalucacion8 = items[index]
                    let indexPath = IndexPath(item: 2, section: 4)
                    self.BanderaCambio = 1
                    self.expandableTableView.collapse(4)
                    self.expandableTableView.expand(4)
// **************** RECOMENDACIONES *********************
                } else if sender.tag == 21 {
                    evalucacion54 = items[index]
                
                } else {
                    print("cancel")
                }
            
            }
        }
    }
    
    func onSwitchChanged(_ sender: PWSwitch) {
        if (sender.tag == 1) {
            if (sender.on){
                evalucacion10 = "1"
            } else {
                evalucacion10 = "0"
            }
        }
        
        if (sender.tag == 2) {
            if (sender.on){
                evalucacion13 = "1"
            } else {
                evalucacion13 = "0"
            }
        }
        
        if (sender.tag == 3) {
            if (sender.on){
                evalucacion16 = "1"
            } else {
                evalucacion16 = "0"
            }
        }
        
        if (sender.tag == 4) {
            if (sender.on){
                evalucacion19 = "1"
            } else {
                evalucacion19 = "0"
            }
        }
        
        if (sender.tag == 5) {
            if (sender.on){
                evalucacion22 = "1"
            } else {
                evalucacion22 = "0"
            }
        }
        
        if (sender.tag == 6) {
            if (sender.on){
                evalucacion25 = "1"
            } else {
                evalucacion25 = "0"
            }
        }

        if (sender.tag == 7) {
            if (sender.on){
                evalucacion28 = "1"
            } else {
                evalucacion28 = "0"
            }
        }
        
        if (sender.tag == 8) {
            if (sender.on){
                evalucacion31 = "1"
            } else {
                evalucacion31 = "0"
            }
        }

    }
}

//All you have to do is to implement this method. If you have a current table view which is not expandable, you can turn it into an expandable table view just by copying and pasting the code for first cell from cellForRowAtIndexPath method.

extension EvaluacionEdificio: ExpyTableViewDataSource {
    func tableView(_ tableView: ExpyTableView, expandableCellForSection section: Int) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HeaderTableViewCell.self)) as! HeaderTableViewCell
        //Make your customizations here.
        cell.labelHeader.text =  arraySecciones[section] //"Section: \(section) Row: 0"
        return cell
    }
    
    func expandableCell(forSection section: Int, inTableView tableView: ExpyTableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HeaderTableViewCell.self)) as! HeaderTableViewCell
        //Make your customizations here.
        cell.labelHeader.text =  arraySecciones[section] //"Section: \(section) Row: 0"
        return cell
    }
}

//MARK: Basic Table View Implementation, no need to write UITableViewDataSource because ExpyTableViewDataSource is forwarding all the delegate methods of UITableView that are not handled by itself.

extension EvaluacionEdificio {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        if indexPath.row == 0 {
        //            bandera = 0
        //        } else {
        
        //        }
        
        switch indexPath.row {
            
            // If you define a cell as expandable and return it from expandingCell data source method,
            // then you will not get callback for IndexPath(row: 0, section: indexPath.section) here in cellForRowAtIndexPath
            //But if you define the same cell as -sometimes not expandable- you will get callbacks for not expandable cells here and you must return a cell for IndexPath(row: 0, section: indexPath.section) in here besides in expandingCell. You can return the same cell from expandingCell method and here.
            
        case 1:
            
            
            
            if indexPath.section == 0 {
                
                var cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FirstTableViewCell.self)) as! FirstTableViewCell
                cell.labelFirst.text = "Section1: \(indexPath.section) Row: \(indexPath.row)"
                let VistaCelda = Bundle.main.loadNibNamed("General", owner: self, options: nil)?[0] as! General
                VistaCelda.frame.size.width = cell.contentView.frame.width
                VistaCelda.frame.size.height = cell.contentView.frame.height
                VistaCelda.btnPareo.tag = 1
                VistaCelda.btnEstado.tag = 2
                VistaCelda.btnPareo.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                VistaCelda.btnEstado.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                if  !idFichaConsultada.isEmpty {
                    var a = idFichaConsultada.first?.value(forKeyPath: "evalucacion6") as? String
                    if (a != "" && a != nil) {
                        VistaCelda.btnPareo.setTitle(a, for: UIControlState.normal)
                        evalucacion6 = (a?.description)!
                    }
                    a = idFichaConsultada.first?.value(forKeyPath: "evalucacion7") as? String
                    if (a != "" && a != nil) {
                        VistaCelda.btnEstado.setTitle(a, for: UIControlState.normal)
                        evalucacion7 = (a?.description)!
                    }
                    
                }
                if !evalucacion6.isEmpty {
                    VistaCelda.btnPareo.setTitle(evalucacion6, for: UIControlState.normal)
                }else{
                    evalucacion6 = VistaCelda.btnPareo.titleLabel?.text ?? ""
                }
                if !evalucacion7.isEmpty {
                    VistaCelda.btnEstado.setTitle(evalucacion7, for: UIControlState.normal)
                }else{
                    evalucacion7 = VistaCelda.btnEstado.titleLabel?.text ?? ""
                }
                
                cell.contentView.addSubview(VistaCelda as UIView)
                return cell
                
            } else if indexPath.section == 1 {
                
                var cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FirstTableViewCell.self)) as! FirstTableViewCell
                cell.labelFirst.text = "Section1: \(indexPath.section) Row: \(indexPath.row)"
                let VistaCelda = Bundle.main.loadNibNamed("InspeccionGeneral", owner: self, options: nil)?[0] as! InspeccionGeneral
                VistaCelda.frame.size.width = cell.contentView.frame.width
                VistaCelda.frame.size.height = cell.contentView.frame.height
                VistaCelda.btnSelecionar.tag = 3
                VistaCelda.btnSelecionar.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                if  !idFichaConsultada.isEmpty {
                    var a = idFichaConsultada.first?.value(forKeyPath: "evalucacion53") as? String
                    if (a != "" && a != nil) {
                        VistaCelda.btnSelecionar.setTitle(a, for: UIControlState.normal)
                        evalucacion53 = (a?.description)!
                    }
                    
                }
                if !evalucacion53.isEmpty {
                    VistaCelda.btnSelecionar.setTitle(evalucacion53, for: UIControlState.normal)
                }else{
                    evalucacion53 = VistaCelda.btnSelecionar.titleLabel?.text ?? ""
                }
                
                
                
                
                cell.contentView.addSubview(VistaCelda as UIView)
                return cell
                
            } else if indexPath.section == 2 {
                
                var cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FirstTableViewCell.self)) as! FirstTableViewCell
                cell.labelFirst.text = "Section1: \(indexPath.section) Row: \(indexPath.row)"
                let VistaCelda = Bundle.main.loadNibNamed("Instalaciones", owner: self, options: nil)?[0] as! Instalaciones
                VistaCelda.frame.size.width = cell.contentView.frame.width
                VistaCelda.frame.size.height = cell.contentView.frame.height
                VistaCelda.btnAgua1.tag = 4
                VistaCelda.btnAgua2.tag = 5
                VistaCelda.btnAlcantarilla1.tag = 6
                VistaCelda.btnAlcantarilla2.tag = 7
                VistaCelda.btnElec1.tag = 8
                VistaCelda.btnElec2.tag = 9
                VistaCelda.btnlluvia1.tag = 10
                VistaCelda.btnlluvia2.tag = 11
                VistaCelda.btncliema1.tag = 12
                VistaCelda.btnclima2.tag = 13
                VistaCelda.btngas1.tag = 14
                VistaCelda.btngas2.tag = 15
                VistaCelda.btnacensores1.tag = 16
                VistaCelda.btnacensores.tag = 17
                VistaCelda.btnOtro1.tag = 18
                VistaCelda.btnOtro2.tag = 19
                
                
                
                
                VistaCelda.btnAgua1.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                VistaCelda.btnAgua2.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                
                VistaCelda.btnAlcantarilla1.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                VistaCelda.btnAlcantarilla2.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                
                VistaCelda.btnElec1.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                VistaCelda.btnElec2.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                
                VistaCelda.btnlluvia1.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                VistaCelda.btnlluvia2.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                
                VistaCelda.btncliema1.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                VistaCelda.btnclima2.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                
                VistaCelda.btngas1.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                VistaCelda.btngas2.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                
                VistaCelda.btnacensores1.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                VistaCelda.btnacensores.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                
                VistaCelda.btnOtro1.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                VistaCelda.btnOtro2.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                
                VistaCelda.s1.addTarget(self, action: #selector(self.onSwitchChanged(_:)), for: .valueChanged)
                VistaCelda.s2.addTarget(self, action: #selector(self.onSwitchChanged), for: .valueChanged)
                VistaCelda.s3.addTarget(self, action: #selector(self.onSwitchChanged), for: .valueChanged)
                VistaCelda.s4.addTarget(self, action: #selector(self.onSwitchChanged), for: .valueChanged)
                VistaCelda.s5.addTarget(self, action: #selector(self.onSwitchChanged), for: .valueChanged)
                VistaCelda.s6.addTarget(self, action: #selector(self.onSwitchChanged), for: .valueChanged)
                VistaCelda.s7.addTarget(self, action: #selector(self.onSwitchChanged), for: .valueChanged)
                VistaCelda.s8.addTarget(self, action: #selector(self.onSwitchChanged), for: .valueChanged)

                
                VistaCelda.btnAgua1.setTitle("", for: UIControlState.normal)
                VistaCelda.btnAgua2.setTitle("", for: UIControlState.normal)
                VistaCelda.btnAlcantarilla1.setTitle("", for: UIControlState.normal)
                VistaCelda.btnAlcantarilla2.setTitle("", for: UIControlState.normal)
                VistaCelda.btnElec1.setTitle("", for: UIControlState.normal)
                VistaCelda.btnElec2.setTitle("", for: UIControlState.normal)
                VistaCelda.btnlluvia1.setTitle("", for: UIControlState.normal)
                VistaCelda.btnlluvia2.setTitle("", for: UIControlState.normal)
                VistaCelda.btncliema1.setTitle("", for: UIControlState.normal)
                VistaCelda.btnclima2.setTitle("", for: UIControlState.normal)
                VistaCelda.btngas1.setTitle("", for: UIControlState.normal)
                VistaCelda.btngas2.setTitle("", for: UIControlState.normal)
                VistaCelda.btnacensores1.setTitle("", for: UIControlState.normal)
                VistaCelda.btnacensores.setTitle("", for: UIControlState.normal)
                VistaCelda.btnOtro1.setTitle("", for: UIControlState.normal)
                VistaCelda.btnOtro2.setTitle("", for: UIControlState.normal)
                
                if  !idFichaConsultada.isEmpty {
                    var a = idFichaConsultada.first?.value(forKeyPath: "evalucacion11") as? String
                    if (a != "" && a != nil) {
                        VistaCelda.btnAgua1.setTitle(a, for: UIControlState.normal)
                        evalucacion11 = (a?.description)!
                    }
                    a = idFichaConsultada.first?.value(forKeyPath: "evalucacion12") as? String
                    if (a != "" && a != nil) {
                        VistaCelda.btnAgua2.setTitle(a, for: UIControlState.normal)
                        evalucacion12 = (a?.description)!
                    }
                    
                    a = idFichaConsultada.first?.value(forKeyPath: "evalucacion10") as? String
                    if (a != "" && a != nil) {
                        evalucacion10 = (a?.description)!
                    }
                    if (a == "1") {
                        VistaCelda.s1.setOn(true, animated: true)
                    }else {
                        VistaCelda.s1.setOn(false, animated: true)
                    }
                    
                    a = idFichaConsultada.first?.value(forKeyPath: "evalucacion14") as? String
                    if (a != "" && a != nil) {
                        VistaCelda.btnAlcantarilla1.setTitle(a, for: UIControlState.normal)
                        evalucacion14 = (a?.description)!
                    }
                    a = idFichaConsultada.first?.value(forKeyPath: "evalucacion15") as? String
                    if (a != "" && a != nil) {
                        VistaCelda.btnAlcantarilla2.setTitle(a, for: UIControlState.normal)
                        evalucacion15 = (a?.description)!
                    }
                    a = idFichaConsultada.first?.value(forKeyPath: "evalucacion13") as? String
                    if (a != "" && a != nil) {
                        evalucacion13 = (a?.description)!
                    }
                    if (a == "1") {
                        VistaCelda.s2.setOn(true, animated: true)
                    }else {
                        VistaCelda.s2.setOn(false, animated: true)
                    }
                    
                    
                    a = idFichaConsultada.first?.value(forKeyPath: "evalucacion17") as? String
                    if (a != "" && a != nil) {
                        VistaCelda.btnElec1.setTitle(a, for: UIControlState.normal)
                        evalucacion17 = (a?.description)!
                    }
                    a = idFichaConsultada.first?.value(forKeyPath: "evalucacion18") as? String
                    if (a != "" && a != nil) {
                        VistaCelda.btnElec2.setTitle(a, for: UIControlState.normal)
                        evalucacion18 = (a?.description)!
                    }
                    a = idFichaConsultada.first?.value(forKeyPath: "evalucacion16") as? String
                    if (a != "" && a != nil) {
                        evalucacion16 = (a?.description)!
                    }
                    if (a == "1") {
                        VistaCelda.s3.setOn(true, animated: true)
                    }else {
                        VistaCelda.s3.setOn(false, animated: true)
                    }
                    
                    
                    a = idFichaConsultada.first?.value(forKeyPath: "evalucacion20") as? String
                    if (a != "" && a != nil) {
                        VistaCelda.btnlluvia1.setTitle(a, for: UIControlState.normal)
                        evalucacion20 = (a?.description)!
                    }
                    a = idFichaConsultada.first?.value(forKeyPath: "evalucacion21") as? String
                    if (a != "" && a != nil) {
                        VistaCelda.btnlluvia2.setTitle(a, for: UIControlState.normal)
                        evalucacion21 = (a?.description)!
                    }
                    a = idFichaConsultada.first?.value(forKeyPath: "evalucacion19") as? String
                    if (a != "" && a != nil) {
                        evalucacion19 = (a?.description)!
                    }
                    if (a == "1") {
                        VistaCelda.s4.setOn(true, animated: true)
                    }else {
                        VistaCelda.s4.setOn(false, animated: true)
                    }
                    
                   
                    a = idFichaConsultada.first?.value(forKeyPath: "evalucacion23") as? String
                    if (a != "" && a != nil) {
                        VistaCelda.btncliema1.setTitle(a, for: UIControlState.normal)
                        evalucacion23 = (a?.description)!
                    }
                    a = idFichaConsultada.first?.value(forKeyPath: "evalucacion24") as? String
                    if (a != "" && a != nil) {
                        VistaCelda.btnclima2.setTitle(a, for: UIControlState.normal)
                        evalucacion24 = (a?.description)!
                    }
                    a = idFichaConsultada.first?.value(forKeyPath: "evalucacion22") as? String
                    if (a != "" && a != nil) {
                        evalucacion22 = (a?.description)!
                    }
                    if (a == "1") {
                        VistaCelda.s5.setOn(true, animated: true)
                    }else {
                        VistaCelda.s5.setOn(false, animated: true)
                    }
                    
                    
                    a = idFichaConsultada.first?.value(forKeyPath: "evalucacion26") as? String
                    if (a != "" && a != nil) {
                        VistaCelda.btngas1.setTitle(a, for: UIControlState.normal)
                        evalucacion26 = (a?.description)!
                    }
                    a = idFichaConsultada.first?.value(forKeyPath: "evalucacion27") as? String
                    if (a != "" && a != nil) {
                        VistaCelda.btngas2.setTitle(a, for: UIControlState.normal)
                        evalucacion27 = (a?.description)!
                    }
                    a = idFichaConsultada.first?.value(forKeyPath: "evalucacion25") as? String
                    if (a != "" && a != nil) {
                        evalucacion25 = (a?.description)!
                    }
                    if (a == "1") {
                        VistaCelda.s6.setOn(true, animated: true)
                    }else {
                        VistaCelda.s6.setOn(false, animated: true)
                    }
                    
                    
                    
                    a = idFichaConsultada.first?.value(forKeyPath: "evalucacion29") as? String
                    if (a != "" && a != nil) {
                        VistaCelda.btnacensores1.setTitle(a, for: UIControlState.normal)
                        evalucacion29 = (a?.description)!
                    }
                    a = idFichaConsultada.first?.value(forKeyPath: "evalucacion30") as? String
                    if (a != "" && a != nil) {
                        VistaCelda.btnacensores.setTitle(a, for: UIControlState.normal)
                        evalucacion30 = (a?.description)!
                    }
                    
                    a = idFichaConsultada.first?.value(forKeyPath: "evalucacion28") as? String
                    if (a != "" && a != nil) {
                        evalucacion28 = (a?.description)!
                    }
                    if (a == "1") {
                        VistaCelda.s7.setOn(true, animated: true)
                    }else {
                        VistaCelda.s7.setOn(false, animated: true)
                    }
                    
                    
                    
                    a = idFichaConsultada.first?.value(forKeyPath: "evalucacion33") as? String
                    if (a != "" && a != nil) {
                        VistaCelda.btnOtro1.setTitle(a, for: UIControlState.normal)
                        evalucacion33 = (a?.description)!
                    }
                    a = idFichaConsultada.first?.value(forKeyPath: "evalucacion34") as? String
                    if (a != "" && a != nil) {
                        VistaCelda.btnOtro2.setTitle(a, for: UIControlState.normal)
                        evalucacion34 = (a?.description)!
                    }
                    a = idFichaConsultada.first?.value(forKeyPath: "evalucacion31") as? String
                    if (a != "" && a != nil) {
                        evalucacion31 = (a?.description)!
                    }
                    if (a == "1") {
                        VistaCelda.s8.setOn(true, animated: true)
                    }else {
                        VistaCelda.s8.setOn(false, animated: true)
                    }
                    
                    

                    
                }
                
                if !(evalucacion11 == "") {
                    VistaCelda.btnAgua1.setTitle(evalucacion11, for: UIControlState.normal)
                }

                if !(evalucacion12 == "") {
                    VistaCelda.btnAgua2.setTitle(evalucacion12, for: UIControlState.normal)
                }

                if !(evalucacion14 == "") {
                    VistaCelda.btnAlcantarilla1.setTitle(evalucacion14, for: UIControlState.normal)
                }

                if !(evalucacion15 == "") {
                    VistaCelda.btnAlcantarilla2.setTitle(evalucacion15, for: UIControlState.normal)
                }

                if !(evalucacion17 == "") {
                    VistaCelda.btnElec1.setTitle(evalucacion17, for: UIControlState.normal)
                }

                if !(evalucacion18 == "") {
                    VistaCelda.btnElec2.setTitle(evalucacion18, for: UIControlState.normal)
                }
                
                if !(evalucacion20 == "") {
                    VistaCelda.btnlluvia1.setTitle(evalucacion20, for: UIControlState.normal)
                }

                if !(evalucacion21 == "") {
                    VistaCelda.btnlluvia2.setTitle(evalucacion21, for: UIControlState.normal)
                }
                

                if !(evalucacion23 == "") {
                    VistaCelda.btncliema1.setTitle(evalucacion23, for: UIControlState.normal)
                }

                if !(evalucacion24 == "") {
                    VistaCelda.btnclima2.setTitle(evalucacion24, for: UIControlState.normal)
                }
                
                if !(evalucacion26 == "") {
                    VistaCelda.btngas1.setTitle(evalucacion26, for: UIControlState.normal)
                }

                if !(evalucacion27 == "") {
                    VistaCelda.btngas2.setTitle(evalucacion27, for: UIControlState.normal)
                }
                
                if !(evalucacion29 == "") {
                    VistaCelda.btnacensores1.setTitle(evalucacion29, for: UIControlState.normal)
                }
                if !(evalucacion30 == "") {
                    VistaCelda.btnacensores.setTitle(evalucacion30, for: UIControlState.normal)
                }
                
                if !(evalucacion33 == "") {
                    VistaCelda.btnOtro1.setTitle(evalucacion33, for: UIControlState.normal)
                }
                if !(evalucacion34 == "") {
                    VistaCelda.btnOtro2.setTitle(evalucacion34, for: UIControlState.normal)
                }
                
                cell.contentView.addSubview(VistaCelda as UIView)
                return cell
                
            } else if indexPath.section == 3 {
                
                var cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FirstTableViewCell.self)) as! FirstTableViewCell
                cell.labelFirst.text = "Section1: \(indexPath.section) Row: \(indexPath.row)"
                let VistaCelda = Bundle.main.loadNibNamed("EvalucacionEstructural", owner: self, options: nil)?[0] as! EvalucacionEstructural
                VistaCelda.frame.size.width = cell.contentView.frame.width
                VistaCelda.frame.size.height = cell.contentView.frame.height
                //                VistaCelda.btnSeleccionar.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                cell.contentView.addSubview(VistaCelda as UIView)
                return cell
                
            } else if indexPath.section == 4 {
                
                var cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FirstTableViewCell.self)) as! FirstTableViewCell
                cell.labelFirst.text = "Section1: \(indexPath.section) Row: \(indexPath.row)"
                let VistaCelda = Bundle.main.loadNibNamed("ResumenEvalucacionFinal", owner: self, options: nil)?[0] as! ResumenEvalucacionFinal
                VistaCelda.frame.size.width = cell.contentView.frame.width
                VistaCelda.frame.size.height = cell.contentView.frame.height
                VistaCelda.btnSeleccionar.tag = 20
                VistaCelda.btnSeleccionar.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                
                
                //    var EvaluacionA = 0
                //    var EvaluacionB = 0
                //    var EvaluacionC = 0
                if BanderaCambio == 1 {
                    if (evalucacion8 == "Inseguro") {
                        VistaCelda.btnSeleccionar.setTitle("Inseguro", for: UIControlState.normal)
                        VistaCelda.btnEdicion.setTitle("Inseguro", for: UIControlState.normal)
                        VistaCelda.VistaLetra.backgroundColor = UIColor.red
                        VistaCelda.lblLetra.text = "C"
                    } else if (evalucacion8 == "Ingreso Limitado") {
                        evalucacion8 = "Ingreso Limitado"
                        VistaCelda.btnSeleccionar.setTitle("Ingreso Limitado", for: UIControlState.normal)
                        VistaCelda.btnEdicion.setTitle("Ingreso Limitado", for: UIControlState.normal)
                        VistaCelda.VistaLetra.backgroundColor = UIColor.yellow
                        VistaCelda.lblLetra.text = "B"
                    } else if (evalucacion8 == "Inspeccionado") {
                        evalucacion8 = "Inspeccionado"
                        VistaCelda.btnSeleccionar.setTitle("Inspeccionado", for: UIControlState.normal)
                        VistaCelda.btnEdicion.setTitle("Inspeccionado", for: UIControlState.normal)
                        VistaCelda.VistaLetra.backgroundColor = UIColor.green
                        VistaCelda.lblLetra.text = "A"
                    } else{
                        evalucacion8 = "Inspeccionado"
                        VistaCelda.btnSeleccionar.setTitle("Inspeccionado", for: UIControlState.normal)
                        VistaCelda.btnEdicion.setTitle("Inspeccionado", for: UIControlState.normal)
                        VistaCelda.VistaLetra.backgroundColor = UIColor.green
                        VistaCelda.lblLetra.text = "A"
                    }
                    BanderaCambio = 0
                } else{
                    if  !idFichaConsultada.isEmpty {
                        var a = idFichaConsultada.first?.value(forKeyPath: "evalucacion8") as? String
                        if (a != "" && a != nil) {
                            VistaCelda.btnSeleccionar.setTitle(a, for: UIControlState.normal)
                            VistaCelda.btnEdicion.setTitle(a, for: UIControlState.normal)
                            evalucacion8 = a!
                        }
                        
                    }
                    if ((evalucacion8 == "Inseguro")  ||  EvaluacionC > 0) {
                        evalucacion8 = "Inseguro"
                        VistaCelda.btnSeleccionar.setTitle("Inseguro de inspeccionar", for: UIControlState.normal)
                        VistaCelda.btnEdicion.setTitle("Inseguro de inspeccionar", for: UIControlState.normal)
                        VistaCelda.VistaLetra.backgroundColor = UIColor.red
                        VistaCelda.lblLetra.text = "C"
                    } else if (evalucacion8 == "Ingreso Limitado") || EvaluacionB > 0 {
                        evalucacion8 = "Ingreso Limitado"
                        VistaCelda.btnEdicion.setTitle("Ingreso Limitado", for: UIControlState.normal)
                        VistaCelda.btnSeleccionar.setTitle("Ingreso Limitado", for: UIControlState.normal)
                        VistaCelda.VistaLetra.backgroundColor = UIColor.yellow
                        VistaCelda.lblLetra.text = "B"
                    } else if (evalucacion8 == "Inspeccionado") || EvaluacionA >= 1 {
                        evalucacion8 = "Inspeccionado"
                        VistaCelda.btnSeleccionar.setTitle("Inspeccionado", for: UIControlState.normal)
                        VistaCelda.btnEdicion.setTitle("Inspeccionado", for: UIControlState.normal)
                        VistaCelda.VistaLetra.backgroundColor = UIColor.green
                        VistaCelda.lblLetra.text = "A"
                    }else{
                        evalucacion8 = "Inspeccionado"
                        VistaCelda.btnSeleccionar.setTitle("Inspeccionado", for: UIControlState.normal)
                        VistaCelda.btnEdicion.setTitle("Inspeccionado", for: UIControlState.normal)
                        VistaCelda.VistaLetra.backgroundColor = UIColor.green
                        VistaCelda.lblLetra.text = "A"
                    }
                }
                cell.contentView.addSubview(VistaCelda as UIView)
                return cell
            } else if indexPath.section == 5 {
                var cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FirstTableViewCell.self)) as! FirstTableViewCell
                cell.labelFirst.text = "Section1: \(indexPath.section) Row: \(indexPath.row)"
                let VistaCelda = Bundle.main.loadNibNamed("RecomendacionesIniciales", owner: self, options: nil)?[0] as! RecomendacionesIniciales
                VistaCelda.frame.size.width = cell.contentView.frame.width
                VistaCelda.frame.size.height = cell.contentView.frame.height
                VistaCelda.btnSeleccionar.tag = 21
                VistaCelda.btnSeleccionar.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                if  !idFichaConsultada.isEmpty {
                    var a = idFichaConsultada.first?.value(forKeyPath: "evalucacion54") as? String
                    if (a != "" && a != nil) {
                        VistaCelda.btnSeleccionar.setTitle(a, for: UIControlState.normal)
                        evalucacion54 = a!
                    }
                    
                }
                if !evalucacion54.isEmpty {
                    VistaCelda.btnSeleccionar.setTitle(evalucacion54, for: UIControlState.normal)
                }else{
                    evalucacion54 = VistaCelda.btnSeleccionar.titleLabel?.text ?? ""
                }
                cell.contentView.addSubview(VistaCelda as UIView)
                return cell
            } else if indexPath.section == 6 {
                
                var cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FirstTableViewCell.self)) as! FirstTableViewCell
                var a = idFichaConsultada.first?.value(forKeyPath: "foto1") as? NSData
                if !(a == nil) {
                    foto1 = a
                }
                a = idFichaConsultada.first?.value(forKeyPath: "foto2") as? NSData
                if !(a == nil) {
                    foto2 = a
                }
                a = idFichaConsultada.first?.value(forKeyPath: "foto3") as? NSData
                if !(a == nil) {
                    foto3 = a
                }
                
                
                cell.labelFirst.text = "Section1: \(indexPath.section) Row: \(indexPath.row)"
                let VistaCelda = Bundle.main.loadNibNamed("TomarFoto", owner: self, options: nil)?[0] as! TomarFoto
                VistaCelda.frame.size.width = cell.contentView.frame.width
                VistaCelda.frame.size.height = cell.contentView.frame.height
                //                VistaCelda.btnSeleccionar.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                
                
                
                cell.contentView.addSubview(VistaCelda as UIView)
                return cell
                
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SecondTableViewCell.self)) as! SecondTableViewCell
                cell.labelSecond.text = "Section2: \(indexPath.section) Row: \(indexPath.row)"
                return cell
            }
            
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SecondTableViewCell.self)) as! SecondTableViewCell
            cell.labelSecond.text = "Section2: \(indexPath.section) Row: \(indexPath.row)"
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ThirdTableViewCell.self)) as! ThirdTableViewCell
            cell.labelThird.text = "Section3: \(indexPath.section) Row: \(indexPath.row)"
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //        print( indexPath  )
        
        //        if bandera == 1 {
        if (indexPath.section == 0 && indexPath.row == 0 ) || (indexPath.section == 1 && indexPath.row == 0 ) || (indexPath.section == 2 && indexPath.row == 0 ) || (indexPath.section == 3 && indexPath.row == 0 ) || (indexPath.section == 4 && indexPath.row == 0 ) || (indexPath.section == 5 && indexPath.row == 0 ) || (indexPath.section == 6 && indexPath.row == 0 ) || (indexPath.section == 7 && indexPath.row == 0 ) || (indexPath.section == 8 && indexPath.row == 0 ) || (indexPath.section == 9 && indexPath.row == 0 ) || (indexPath.section == 10 && indexPath.row == 0 ) || (indexPath.section == 11 && indexPath.row == 0 ) || (indexPath.section == 12 && indexPath.row == 0 )
        {
            return 40
        } else {
            if (indexPath.section == 0) {
                return 397
            } else if (indexPath.section == 1) {
//                if evalucacion8 == "3" {
//                    return 0
//                } else {
                    return 175
//                }
            } else if (indexPath.section == 2) {
                if evalucacion8 == "Inseguro de inspeccionar" {
                    return 0
                } else {
                    return 828
                }
                
            } else if (indexPath.section == 3) {
                if evalucacion8 == "Inseguro de inspeccionar" {
                    return 0
                } else {
                    return 212
                }
//                return 212
            } else if (indexPath.section == 4) {
                return 212
            } else if (indexPath.section == 5) {
                return 220
            } else if (indexPath.section == 6) {
                return 655
            } else {
                return 107
                
            }
            
        }
        
        //        } else {
        //            return 60
        //        }
        
        
        
    }
    
    
}

extension EvaluacionEdificio: ExpyTableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //If you don't deselect the row here, seperator of the above cell of the selected cell disappears.
        //Check here for detail: https://stackoverflow.com/questions/18924589/uitableviewcell-separator-disappearing-in-ios7
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        //This solution obviously has side effects, you can implement your own solution from the given link.
        //This is not a bug of ExpyTableView hence, I think, you should solve it with the proper way for your implementation.
        //If you have a generic solution for this, please submit a pull request or open an issue.
        
        print("DID SELECT row: \(indexPath.row), section: \(indexPath.section)")
        if indexPath.row == 0 {
            bandera = 0
        } else {
            bandera = 1
        }
    }
}

//class FirstTableViewCell: UITableViewCell {
//    @IBOutlet weak var labelFirst: UILabel!
//}
//class SecondTableViewCell: UITableViewCell {
//    @IBOutlet weak var labelSecond: UILabel!
//}
//class ThirdTableViewCell: UITableViewCell {
//    @IBOutlet weak var labelThird: UILabel!
//}
//class HeaderTableViewCell: UITableViewCell {
//    @IBOutlet weak var labelHeader: UILabel!
//}


