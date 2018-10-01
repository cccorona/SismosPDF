//
//  BasicExampleViewController.swift
//  ExpyTableView
//
//  Created by Okhan on 16/06/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import ExpyTableView
import CoreData
import TCProgressBar
class InformeGeneral: UIViewController {
	
    @IBOutlet weak var Barra: TCProgressBar!
    @IBOutlet weak var VistaBar: UIView!
    @IBOutlet weak var expandableTableView: ExpyTableView!
	var  arraySecciones = ["IDENTIFICACIÓN GEOGRAFICA", "TIPO DE DESASTRE", "DESCRIPCIÓN DE LA EMERGENCIA"]
//    "INMUEBLE PRE-CARGADO", "TIPO DE ESTABLECIMIENTO","NOMBRE ESTABLECIMIENTO", "SERVICIO RESPONSABLE", "COMPETENCIA", "RESPOSNABLE ESTABLECIMIENTO", "DIRECCIÓN ESTABLECIMIENTO","ACCESIBILIDAD ESTABLECIMIENTO","GEOREFERENCIACIÓN"]
    var bandera = 0
    
    @IBOutlet weak var Nombre: UILabel!
    @IBOutlet weak var btnTerminarSeccion: UIButton!
    
	override func viewDidLoad() {
		super.viewDidLoad()
		expandableTableView.dataSource = self
		expandableTableView.delegate = self //Optional. In this example we use didSelectRowAtIndexPath to solve a known problem. Sepearator disapperance.
        
        self.VistaBar.layer.borderWidth = 1
        self.VistaBar.layer.borderColor = UIColor.black.cgColor
        self.VistaBar.layer.borderWidth = 1
        self.VistaBar.layer.borderColor = UIColor.black.cgColor
        
        // Si la informacion general es registrada desde el escritorio
        if TipoInfoGeneral == 0 {
            if let info = dato.object(forKey: "informe1FichaInsPec") as? String {
                informe1 = info
            }
            if let info = dato.object(forKey: "informe2FichaInsPec") as? String {
                informe2 = info
            }
            if let info = dato.object(forKey: "informe3FichaInsPec") as? String {
                informe3 = info
            }
            if let info = dato.object(forKey: "informe4FichaInsPec") as? String {
                informe4 = info
            }
            if let info = dato.object(forKey: "informe5FichaInsPec") as? String {
                informe5 = info
            }
            Barra.isHidden = true
            Nombre.isHidden = true
            btnTerminarSeccion.isHidden = false
        } else {
            Barra.isHidden = false
            Nombre.isHidden = false
            btnTerminarSeccion.isHidden = false
        }
        
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationItem.title = "Basic Example"
        
        if  !idFichaConsultada.isEmpty {
        }
        Barra.value = CGFloat(AvanceFicha)
        Nombre.text = NombreFicha
	}
    
    func EjecutarBtn(_ sender: UIButton) {
        var items = ["Si", "No", "No se", ]
        if sender.tag == 1{
           items = ["Accidente", "Abastecimiento o Suministro", "Acto terrorista", "Aluvión", "Crecida de quebrada", "Climático", "Derrame Químico","Derrumbe", "Emergencia sanitaria", "Erupción Volcánica","Explosión","Falla de materiales","Incedío","Incendío forestal","Maremoto","Terremoto","Otro" ]
        }else if sender.tag == 2{
                items = ["Leve", "Moderado","Grave", "Muy Grave" ]
        
        } else if sender.tag == 3 {
            items = ["Chile" ]
        } else if sender.tag == 4 {
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
        } else if sender.tag == 5 {
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
        
        } else {
           items = [String]()
        }
        
        let params = Parameters(title: "Seleccionar ...", items: items, cancelButton: "Cancelar")
        
        SelectItemController().show(parent: self, params: params) { (index) in
            if let index = index {
                print("selected: \(items[index])")
                sender.setTitle(items[index], for: UIControlState.normal)
                if sender.tag == 1{
                    informe2 = items[index]
                }else if sender.tag == 2{
                    informe3 = items[index]

                
                // *************** IDENTIFICACION GEOGRAFICA  ********************
                } else if sender.tag == 3 {
                    evalucacion57 = items[index]
                } else if sender.tag == 4 {
                    evalucacion58 = items[index]
                } else if sender.tag == 5 {
                    evalucacion59 = items[index]
                }
                
            } else {
                print("cancel")
            }
            
        }
    }
    
    @IBAction func GuardarInforme(_ sender: Any) {
        let alert = UIAlertController(title: TituloAlerta, message: msgGuardar, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default,  handler: { action in
//            self.dismiss(animated: true, completion: nil)
        }))
        GuardarInformacion()
        self.present(alert, animated: true, completion: nil)
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
    func GuardarInformacion(){
        if TipoInfoGeneral == 1 { // Si se guarda en BD cuando de edita el avance
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
                        if informe1 != ""{
                            managedObject.setValue(informe1, forKey: "informe1")
                        }
                        if informe2 != ""{
                            managedObject.setValue(informe2, forKey: "informe2")
                        }
                        if informe3 != ""{
                            managedObject.setValue(informe3, forKey: "informe3")
                        }
                        if informe4 != ""{
                            managedObject.setValue(informe4, forKey: "informe4")
                        }
                        if informe5 != ""{
                            managedObject.setValue(informe5, forKey: "informe5")
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
                        try context.save()
                    }
                }
            
            } catch  let error as  NSError {
                print ( "No se pudo recuperar. " )
            }
        } else { // Si se guarda la informacion desde escritorio
            dato.set(informe1, forKey: "informe1FichaInsPec")
            dato.set(informe2, forKey: "informe2FichaInsPec")
            dato.set(informe3, forKey: "informe3FichaInsPec")
            dato.set(informe4, forKey: "informe4FichaInsPec")
            dato.set(informe5, forKey: "informe5FichaInsPec")
            dato.set(evalucacion57, forKey: "evalucacion57")
            dato.set(evalucacion58, forKey: "evalucacion58")
            dato.set(evalucacion59, forKey: "evalucacion59")
            dato.synchronize()
        }
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func IrAtrasVista(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

//All you have to do is to implement this method. If you have a current table view which is not expandable, you can turn it into an expandable table view just by copying and pasting the code for first cell from cellForRowAtIndexPath method.

extension InformeGeneral: ExpyTableViewDataSource {
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

extension InformeGeneral {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 3
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
                bandera = 1
                var cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FirstTableViewCell.self)) as! FirstTableViewCell
                cell.labelFirst.text = "Section1: \(indexPath.section) Row: \(indexPath.row)"
                let VistaCelda = Bundle.main.loadNibNamed("NuevaIdentificacionGeografica", owner: self, options: nil)?[0] as! NuevaIdentificacionGeografica
                
                VistaCelda.frame.size.width = cell.contentView.frame.width
                VistaCelda.frame.size.height = cell.contentView.frame.height
                
                VistaCelda.btnPais.tag = 3
                VistaCelda.btnPais.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                VistaCelda.btnRegion.tag = 4
                VistaCelda.btnRegion.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                VistaCelda.btnProvencia.tag = 5
                VistaCelda.btnProvencia.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                if  !idFichaConsultada.isEmpty {
                    var a = idFichaConsultada.first?.value(forKeyPath: "evalucacion57") as? String
//                    if (a != "" && a != nil) {
//                        VistaCelda.btnPais.setTitle(a, for: UIControlState.normal)
//                    }
                    
                    a = idFichaConsultada.first?.value(forKeyPath: "evalucacion58") as? String
                    if (a != "" && a != nil) {
                        VistaCelda.btnRegion.setTitle(a, for: UIControlState.normal)
                    }else{
                        VistaCelda.btnRegion.setTitle("Región", for: UIControlState.normal)
                    }
                    
                    a = idFichaConsultada.first?.value(forKeyPath: "evalucacion59") as? String
                    if (a != "" && a != nil) {
                        VistaCelda.btnProvencia.setTitle(a, for: UIControlState.normal)
                    }else{
                        VistaCelda.btnProvencia.setTitle("Provincia", for: UIControlState.normal)
                    }
                    
                } else {
                    if !evalucacion57.isEmpty {
                        VistaCelda.btnPais.setTitle(evalucacion57, for: UIControlState.normal)
                    }
                    if !evalucacion58.isEmpty {
                        VistaCelda.btnRegion.setTitle(evalucacion58, for: UIControlState.normal)
                    }else{
                        VistaCelda.btnRegion.setTitle("Región", for: UIControlState.normal)
                    }
                    if !evalucacion59.isEmpty {
                        VistaCelda.btnProvencia.setTitle(evalucacion59, for: UIControlState.normal)
                    }else{
                        VistaCelda.btnProvencia.setTitle("Provincia", for: UIControlState.normal)
                    }
                }
                
                cell.contentView.addSubview(VistaCelda)
                return cell
            } else if indexPath.section == 1 {
                
                var cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FirstTableViewCell.self)) as! FirstTableViewCell
                cell.labelFirst.text = "Section1: \(indexPath.section) Row: \(indexPath.row)"
                
                let VistaCelda = Bundle.main.loadNibNamed("TipoDesastre", owner: self, options: nil)?[0] as! TipoDesastre
                VistaCelda.frame.size.width = cell.contentView.frame.width
                VistaCelda.frame.size.height = cell.contentView.frame.height
                VistaCelda.btnSeleccionar.tag = 1
                VistaCelda.btnSeleccionar.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                if  !idFichaConsultada.isEmpty {
                    let a = idFichaConsultada.first?.value(forKeyPath: "informe2") as? String
                    if (a != "" && a != nil) {
                        VistaCelda.btnSeleccionar.setTitle(a, for: UIControlState.normal)
                    }
                } else if !informe2.isEmpty {
                  VistaCelda.btnSeleccionar.setTitle(informe2, for: UIControlState.normal)
                }
                
                cell.contentView.addSubview(VistaCelda as UIView)
                return cell
            } else if indexPath.section == 2 {
                
                var cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FirstTableViewCell.self)) as! FirstTableViewCell
                cell.labelFirst.text = "Section1: \(indexPath.section) Row: \(indexPath.row)"                
                let VistaCelda = Bundle.main.loadNibNamed("DescripcionEmergencia", owner: self, options: nil)?[0] as! DescripcionEmergencia
                VistaCelda.frame.size.width = cell.contentView.frame.width
                VistaCelda.frame.size.height = cell.contentView.frame.height
                VistaCelda.btnSeleccionar.tag = 2
                VistaCelda.btnSeleccionar.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                if  !idFichaConsultada.isEmpty {
                    let a = idFichaConsultada.first?.value(forKeyPath: "informe3") as? String
                    if (a != "" && a != nil) {
                        VistaCelda.btnSeleccionar.setTitle(a, for: UIControlState.normal)
                    }
                } else if !informe3.isEmpty {
                    VistaCelda.btnSeleccionar.setTitle(informe3, for: UIControlState.normal)
                }
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
                        return 130
                    } else if (indexPath.section == 1) {
                        return 70
                    } else if (indexPath.section == 2) {
                        return 277
                    } else if (indexPath.section == 3) {
                        return 294
//                    } else if (indexPath.section == 4) {
//                        return 115
//                    } else if (indexPath.section == 5) {
//                        return 62
//                    } else if (indexPath.section == 6) {
//                        return 62
//                    } else if (indexPath.section == 7) {
//                        return 62
//                    } else if (indexPath.section == 8) {
//                        return 52
//                    } else if (indexPath.section == 9) {
//                        return 190
                    } else {
                        return 107
                    
                }
                
            }

//        } else {
//            return 60
//        }
        
        
        
    }
    
    
    
    
}

extension InformeGeneral: ExpyTableViewDelegate {
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

class FirstTableViewCell: UITableViewCell {
	@IBOutlet weak var labelFirst: UILabel!
}
class SecondTableViewCell: UITableViewCell {
	@IBOutlet weak var labelSecond: UILabel!
}
class ThirdTableViewCell: UITableViewCell {
	@IBOutlet weak var labelThird: UILabel!
}
class HeaderTableViewCell: UITableViewCell {
	@IBOutlet weak var labelHeader: UILabel!
}
