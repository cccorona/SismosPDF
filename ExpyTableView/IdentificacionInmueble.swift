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

class IdentificacionInmueble: UIViewController {
    
    @IBOutlet weak var Barra: TCProgressBar!
    @IBOutlet weak var VistaBar: UIView!
    @IBOutlet weak var expandableTableView: ExpyTableView!
    var  arraySecciones = ["TIPO DE ESTABLECIMIENTO","NOMBRE ESTABLECIMIENTO", "SERVICIO RESPONSABLE", "COMPETENCIA", "RESPONSABLE ESTABLECIMIENTO", "DIRECCIÓN ESTABLECIMIENTO","ACCESIBILIDAD ESTABLECIMIENTO","GEOREFERENCIACIÓN"]
    var bandera = 0
    var BanderaOtro = 0
    
    @IBOutlet weak var Nombre: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        expandableTableView.dataSource = self
        expandableTableView.delegate = self //Optional. In this example we use didSelectRowAtIndexPath to solve a known problem. Sepearator disapperance.
        
        self.VistaBar.layer.borderWidth = 1
        self.VistaBar.layer.borderColor = UIColor.black.cgColor
        self.VistaBar.layer.borderWidth = 1
        self.VistaBar.layer.borderColor = UIColor.black.cgColor
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Basic Example"
        Barra.value = CGFloat(AvanceFicha)
        Nombre.text = NombreFicha
        
        expandableTableView.reloadData()
        
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
                    var managedObject = fetchResults[0]
                    managedObject.setValue(identificacion1, forKey: "identificacion1")
                    managedObject.setValue(identificacion2, forKey: "identificacion2")
                    managedObject.setValue(identificacion3, forKey: "identificacion3")
                    managedObject.setValue(identificacion4, forKey: "identificacion4")
                    managedObject.setValue(identificacion5, forKey: "identificacion5")
                    managedObject.setValue(identificacion6, forKey: "identificacion6")
                    managedObject.setValue(identificacion7, forKey: "identificacion7")
                    managedObject.setValue(identificacion8, forKey: "identificacion8")
                    managedObject.setValue(identificacion9, forKey: "identificacion9")
                    managedObject.setValue(identificacion10, forKey: "identificacion10")
                    managedObject.setValue(identificacion11, forKey: "identificacion11")
                    managedObject.setValue(identificacion12, forKey: "identificacion12")
                    managedObject.setValue(identificacion13, forKey: "identificacion13")
                    managedObject.setValue(identificacion14, forKey: "identificacion14")
                    managedObject.setValue(identificacion15, forKey: "identificacion15")
                    managedObject.setValue(identificacion16, forKey: "identificacion16")
                    managedObject.setValue(identificacion17, forKey: "identificacion17")
                    managedObject.setValue(identificacion18, forKey: "identificacion18")                    
                    managedObject.setValue(latitud, forKey: "latitud")
                    managedObject.setValue(longitud, forKey: "longitud")
                    

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
        
        if sender.tag == 0{
           items = [String]()
        } else if sender.tag == 1 {
            items = ["Biblioteca",
                "Bomberos",
                "Carabineros",
                "Cárcel",
                "Centro Comunitario de Salud",
                "Centro Cultural",
                "Centro Educación Integrado de Adultos",
                "CESFAM",
                "Clínica",
                "Colegio",
                "Congreso",
                "Consultorio",
                "Corp. Asistencia Judicial",
                "Defensoría",
                "Edificio MOP",
                "Edificio patrimonial",
                "Escuela",
                "Estadio",
                "Fiscalía",
                "Gendarmería",
                "Gimnasio",
                "Gobernación",
                "Hogar de Menores",
                "Hospital",
                "Iglesia",
                "Inmueble Administración y Gobierno Interior",
                "Inmueble cultural",
                "Inmueble defensa y seguridad",
                "Inmueble deportivo",
                "Inmueble educacional",
                "Inmueble Justicia",
                "Inmueble Salud",
                "Instituto",
                "Intendencia",
                "Liceo",
                "Militar",
                "Ministerio",
                "Municipio",
                "Museo",
                "Parvulario",
                "Paso fronterizo",
                "PDI",
                "Piscina pública",
                "Posta",
                "PRAIS",
                "Registro Civil",
                "SAPU",
                "SENAME",
                "Seremi",
                "Servicio de Alta Resolutividad",
                "Servicio Médico Legal",
                "Tribunales justicia",
                "Universidad",
                "Vacunatorio", "Otros"]
        } else if sender.tag == 4 {
            items = ["Si","No","Solo técnico"]
        } else if sender.tag == 61 {
            items = [
                "Arica",
                "Iquique",
                "Antofagasta",
                "Copiapó",
                "La Serena",
                "ValparaÌso",
                "Viña del Mar",
                "Santiago",
                "Rancagua",
                "Talca",
                "Concepción",
                "Temuco",
                "Valdivia",
                "Puerto Montt",
                "Coyhaique",
                "Punta Arenas",
                "Otro"
            ]
        } else if sender.tag == 62 {
            items = [
                "Aysén",
                "Algarrobo",
                "Alhué",
                "Alto Biobío",
                "Alto del Carmen",
                "Alto Hospicio",
                "Ancud",
                "Andacollo",
                "Angol",
                "Antofagasta",
                "Antuco",
                "Arauco",
                "Arica ",
                "Buin",
                "Bulnes",
                "Cabildo",
                "Cabo de Hornos",
                "Cabrero",
                "Calama",
                "Calbuco",
                "Caldera",
                "Calera",
                "Calera de Tango",
                "Calle Larga",
                "Camarones",
                "Camiña",
                "Canela",
                "Cañete",
                "Carahue",
                "Cartagena",
                "Casablanca",
                "Castro",
                "Catemu",
                "Cauquenes",
                "Cerrillos",
                "Cerro Navia",
                "Chaitén",
                "Chanco",
                "Chañaral",
                "Chépica",
                "Chiguayante",
                "Chile Chico",
                "Chillán",
                "Chillán Viejo",
                "Chimbarongo",
                "Cholchol",
                "Chonchi",
                "Cisnes",
                "Cobquecura",
                "Cochamó",
                "Cochrane",
                "Codegua",
                "Coelemu",
                "Coihaique",
                "Coihueco",
                "Coinco",
                "Colbún",
                "Colchane",
                "Colina",
                "Collipulli",
                "Coltauco",
                "Combarbalá",
                "Concepción",
                "Conchalí",
                "Concón",
                "Constitución",
                "Contulmo",
                "Copiapó",
                "Coquimbo",
                "Coronel",
                "Corral",
                "Cunco",
                "Curacautín",
                "Curacaví",
                "Curaco de Vélez",
                "Curanilahue",
                "Curarrehue",
                "Curepto",
                "Curicó",
                "Dalcahue",
                "Diego de Almagro",
                "Doñihue",
                "El Bosque",
                "El Carmen",
                "El Monte",
                "El Quisco",
                "El Tabo",
                "Empedrado",
                "Ercilla",
                "Estación Central",
                "Florida",
                "Freire",
                "Freirina",
                "Fresia",
                "Frutillar",
                "Futaleufú",
                "Futrono",
                "Galvarino",
                "General Lagos",
                "Gorbea",
                "Graneros",
                "Guaitecas",
                "Hijuelas",
                "Hualaihue",
                "Hualañé",
                "Hualpén",
                "Hualqui",
                "Huara",
                "Huasco",
                "Huechuraba",
                "Illapel",
                "Independencia",
                "Iquique",
                "Isla de Maipo",
                "Isla de Pascua",
                "Juan Fernández",
                "La Cisterna",
                "La Cruz",
                "La Estrella",
                "La Florida",
                "La Granja",
                "La Higuera",
                "La Ligua",
                "La Pintana",
                "La Reina",
                "La Serena",
                "La Unión",
                "Lago Ranco",
                "Lago Verde",
                "Laguna Blanca",
                "Laja",
                "Lampa",
                "Lanco",
                "Las Cabras",
                "Las Condes",
                "Lautaro",
                "Lebu",
                "Licantén",
                "Limache",
                "Linares",
                "Litueche",
                "Llaillay",
                "Llanquihue",
                "Lo Barnechea",
                "Lo Espejo",
                "Lo Prado",
                "Lolol",
                "Loncoche",
                "Longaví",
                "Lonquimay",
                "Los Alamos",
                "Los Andes",
                "Los Angeles",
                "Los Lagos",
                "Los Muermos",
                "Los Sauces",
                "Los Vilos",
                "Lota",
                "Lumaco",
                "Machalí",
                "Macul",
                "Máfil",
                "Maipú",
                "Malloa",
                "Marchihue",
                "María Elena",
                "María Pinto",
                "Mariquina",
                "Maule",
                "Maullín",
                "Mejillones",
                "Melipeuco",
                "Melipilla",
                "Molina",
                "Monte Patria",
                "Mostazal",
                "Mulchén",
                "Nacimiento",
                "Nancagua",
                "Natales",
                "Navidad",
                "Negrete",
                "Ninhue",
                "Nogales",
                "Nueva Imperial",
                "Ñiquén",
                "Ñuñoa",
                "Ohiggins",
                "Olivar",
                "Ollagüe",
                "Olmué",
                "Osorno",
                "Ovalle",
                "Padre Hurtado",
                "Padre Las Casas",
                "Paihuano",
                "Paillaco",
                "Paine",
                "Palena",
                "Palmilla",
                "Panguipulli",
                "Papudo",
                "Paredones",
                "Parral",
                "Pedro Aguirre Cerda",
                "Pelarco",
                "Pelluhue",
                "Pemuco",
                "Pencahue",
                "Penco",
                "Peñaflor",
                "Peñalolen",
                "Peralillo",
                "Perquenco",
                "Petorca",
                "Peumo",
                "Pica",
                "Pichidegua",
                "Pichulemu",
                "Pinto",
                "Pirque",
                "Pitrufquén",
                "Placilla",
                "Portezuelo",
                "Porvenir",
                "Pozo Almonte",
                "Primavera",
                "Providencia",
                "Puchuncaví",
                "Pucón",
                "Pudahuel",
                "Puente Alto",
                "Puerto Montt",
                "Puerto Octay",
                "Puerto Varas",
                "Pumanque",
                "Punitaqui",
                "Punta Arenas",
                "Puqueldón",
                "Purén",
                "Purranque",
                "Putaendo",
                "Putre",
                "Puyehue",
                "Queilén",
                "Quellón",
                "Quemchi",
                "Quilaco",
                "Quilicura",
                "Quilleco",
                "Quillón",
                "Quillota",
                "Quilpué",
                "Quinchao",
                "Quinta de Tilcoco",
                "Quinta Normal",
                "Quintero",
                "Quirihue",
                "Rancagua",
                "Ranquil",
                "Rauco",
                "Recoleta",
                "Renaico",
                "Renca",
                "Rengo",
                "Requinoa",
                "Retiro",
                "Rinconada",
                "Río Bueno",
                "Río Claro",
                "Río Hurtado",
                "Río Ibañez",
                "Río Negro",
                "Río Verde",
                "Romeral",
                "Saavedra",
                "Sagrada Familia",
                "Salamanca",
                "San Antonio",
                "San Bernardo",
                "San Carlos",
                "San Clemente",
                "San Esteban",
                "San Fabián",
                "San Felipe",
                "San Fernando",
                "San Gregorio",
                "San Ignacio",
                "San Javier",
                "San Joaquín",
                "San José de Maipo",
                "San Juan de la Costa",
                "San Miguel",
                "San Nicolás",
                "San Pablo",
                "San Pedro",
                "San Pedro de Atacama",
                "San Pedro de La Paz",
                "San Rafael",
                "San Ramón",
                "San Rosendo",
                "San Vicente",
                "Santa Bárbara",
                "Santa Cruz",
                "Santa Juana",
                "Santa María",
                "Santiago",
                "Santo Domingo",
                "Sierra Gorda",
                "Talagante",
                "Talca",
                "Talcahuano",
                "Taltal",
                "Temuco",
                "Teno",
                "Teodoro Schmidt",
                "Tierra Amarilla",
                "Til til",
                "Timaukel",
                "Tirua",
                "Tocopilla",
                "Toltén",
                "Tomé",
                "Torres del Paine",
                "Tortel",
                "Traiguén",
                "Trehuaco",
                "Tucapel",
                "Valdivia",
                "Vallenar",
                "Valparaíso",
                "Vichuquén",
                "Victoria",
                "Vicuña",
                "Vilcún",
                "Villa Alegre",
                "Villa Alemana",
                "Villarrica",
                "Viña del Mar",
                "Vitacura",
                "Yerbas Buenas",
                "Yumbel",
                "Yungay",
                "Zapallar"
            ]
        } else if sender.tag == 71 {
            items = ["Vehicular","Peatonal","Vehicular-Peatonal", "Otro"]
        } else if sender.tag == 72 {
            items = ["Expedito","Parcial","No disponible","Otro"]
        } else {
          items = [String]()
        }
        
        
        let params = Parameters(title: "Seleccionar ...", items: items, cancelButton: "Cancelar")
        SelectItemController().show(parent: self, params: params) { (index) in
            if let index = index {
                print("selected: \(items[index])")
                sender.setTitle(items[index], for: UIControlState.normal)
                if sender.tag == 0{
                    identificacion1 = items[index]
                } else if sender.tag == 1 {
                    identificacion2 = items[index]
                } else if sender.tag == 4 {
                    identificacion5 = items[index]
                } else if sender.tag == 61 {
                    identificacion9 = items[index]
                    if items[index] == "Otro" {
                        self.BanderaOtro = 1
                        let indexPath = IndexPath(item: 2, section: 6)
                        self.expandableTableView.collapse(5)
                        self.expandableTableView.expand(5)
                        
                    } else {
                       self.BanderaOtro = 0
                    }
                } else if sender.tag == 62 {
                    identificacion11 = items[index]
                } else if sender.tag == 71 {
                    identificacion15 = items[index]
                } else if sender.tag == 72 {
                    identificacion17 = items[index]
                
                } else {
                    print("cancel")
                }
            }
        }
    }
    
}

//All you have to do is to implement this method. If you have a current table view which is not expandable, you can turn it into an expandable table view just by copying and pasting the code for first cell from cellForRowAtIndexPath method.

extension IdentificacionInmueble: ExpyTableViewDataSource {
    func expandableCell(forSection section: Int, inTableView tableView: ExpyTableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HeaderTableViewCell.self)) as! HeaderTableViewCell
        //Make your customizations here.
        cell.labelHeader.text =  arraySecciones[section] //"Section: \(section) Row: 0"
        return cell
    }
}

//MARK: Basic Table View Implementation, no need to write UITableViewDataSource because ExpyTableViewDataSource is forwarding all the delegate methods of UITableView that are not handled by itself.

extension IdentificacionInmueble {
    func numberOfSections(in tableView: UITableView) -> Int {
        return arraySecciones.count
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
            

            
            if indexPath.section == -1 {
                var cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FirstTableViewCell.self)) as! FirstTableViewCell
                cell.labelFirst.text = "Section1: \(indexPath.section) Row: \(indexPath.row)"
                let VistaCelda = Bundle.main.loadNibNamed("InmueblePreCargado", owner: self, options: nil)?[0] as! InmueblePrecargado
                VistaCelda.frame.size.width = cell.contentView.frame.width
                VistaCelda.frame.size.height = cell.contentView.frame.height
                VistaCelda.btnSeleccionar.tag = indexPath.section
                VistaCelda.btnSeleccionar.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                if  !idFichaConsultada.isEmpty {
                    let a = idFichaConsultada.first?.value(forKeyPath: "identificacion1") as? String
                    if !(a == "") {
                        VistaCelda.btnSeleccionar.setTitle(a, for: UIControlState.normal)
                    }
                } else if !identificacion1.isEmpty {
                    VistaCelda.btnSeleccionar.setTitle(identificacion1, for: UIControlState.normal)
                }
                cell.contentView.addSubview(VistaCelda as UIView)
                return cell
                
            } else if indexPath.section == 0 {
                
                var cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FirstTableViewCell.self)) as! FirstTableViewCell
                cell.labelFirst.text = "Section1: \(indexPath.section) Row: \(indexPath.row)"
                let VistaCelda = Bundle.main.loadNibNamed("TipoDeEstablecimiento", owner: self, options: nil)?[0] as! TipoEstablecimiento
                VistaCelda.frame.size.width = cell.contentView.frame.width
                VistaCelda.frame.size.height = cell.contentView.frame.height
                VistaCelda.btnSeleccionar.tag = indexPath.section+1
                VistaCelda.btnSeleccionar.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                if  !idFichaConsultada.isEmpty {
                    let a = idFichaConsultada.first?.value(forKeyPath: "identificacion2") as? String
                    if !(a == "") {
                        VistaCelda.btnSeleccionar.setTitle(a, for: UIControlState.normal)
                    }
                } else if !identificacion2.isEmpty {
                    VistaCelda.btnSeleccionar.setTitle(identificacion2, for: UIControlState.normal)
                }
                cell.contentView.addSubview(VistaCelda as UIView)
                return cell
                
            } else if indexPath.section == 1 {
                
                var cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FirstTableViewCell.self)) as! FirstTableViewCell
                cell.labelFirst.text = "Section1: \(indexPath.section) Row: \(indexPath.row)"
                let VistaCelda = Bundle.main.loadNibNamed("NombreEstablecimiento", owner: self, options: nil)?[0] as! NombreEstablecimiento
                VistaCelda.frame.size.width = cell.contentView.frame.width
                VistaCelda.frame.size.height = cell.contentView.frame.height
                cell.contentView.addSubview(VistaCelda as UIView)
                return cell
                
            } else if indexPath.section == 2 {
                
                var cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FirstTableViewCell.self)) as! FirstTableViewCell
                cell.labelFirst.text = "Section1: \(indexPath.section) Row: \(indexPath.row)"
                let VistaCelda = Bundle.main.loadNibNamed("ServicioResponsable", owner: self, options: nil)?[0] as! ServicioResponsable
                VistaCelda.frame.size.width = cell.contentView.frame.width
                VistaCelda.frame.size.height = cell.contentView.frame.height
                //                VistaCelda.btnSeleccionar.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                cell.contentView.addSubview(VistaCelda as UIView)
                return cell
                
            } else if indexPath.section == 3 {
                
                var cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FirstTableViewCell.self)) as! FirstTableViewCell
                cell.labelFirst.text = "Section1: \(indexPath.section) Row: \(indexPath.row)"
                let VistaCelda = Bundle.main.loadNibNamed("Competencia", owner: self, options: nil)?[0] as! Competencia
                VistaCelda.frame.size.width = cell.contentView.frame.width
                VistaCelda.frame.size.height = cell.contentView.frame.height
                VistaCelda.btnSeleccionar.tag = indexPath.section+1
                VistaCelda.btnSeleccionar.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                
                if  !idFichaConsultada.isEmpty {
                    let a = idFichaConsultada.first?.value(forKeyPath: "identificacion5") as? String
                    if !(a == "") {
                        VistaCelda.btnSeleccionar.setTitle(a, for: UIControlState.normal)
                    }
                } else if !identificacion5.isEmpty {
                    VistaCelda.btnSeleccionar.setTitle(identificacion5, for: UIControlState.normal)
                }
                cell.contentView.addSubview(VistaCelda as UIView)
                return cell
                
                
            } else if indexPath.section == 4 {
                
                var cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FirstTableViewCell.self)) as! FirstTableViewCell
                cell.labelFirst.text = "Section1: \(indexPath.section) Row: \(indexPath.row)"
                let VistaCelda = Bundle.main.loadNibNamed("ResponsableEstablecimiento", owner: self, options: nil)?[0] as! ResponsableEstablecimiento
                VistaCelda.frame.size.width = cell.contentView.frame.width
                VistaCelda.frame.size.height = cell.contentView.frame.height
                //                VistaCelda.btnSeleccionar.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                cell.contentView.addSubview(VistaCelda as UIView)
                return cell
            } else if indexPath.section == 5 {
                var cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FirstTableViewCell.self)) as! FirstTableViewCell
                cell.labelFirst.text = "Section1: \(indexPath.section) Row: \(indexPath.row)"
                let VistaCelda = Bundle.main.loadNibNamed("DireccionEstablecimiento", owner: self, options: nil)?[0] as! DireccionEstablecimiento
                VistaCelda.frame.size.width = cell.contentView.frame.width
                VistaCelda.frame.size.height = cell.contentView.frame.height
                VistaCelda.btnCiudad.tag = 61
                VistaCelda.btnComuna.tag = 62
                VistaCelda.btnCiudad.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                VistaCelda.btnComuna.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                if  !idFichaConsultada.isEmpty {
                    var a = idFichaConsultada.first?.value(forKeyPath: "identificacion9") as? String
                    if !(a == "") {
                        VistaCelda.btnCiudad.setTitle(a, for: UIControlState.normal)
                    }
                    a = idFichaConsultada.first?.value(forKeyPath: "identificacion11") as? String
                    if !(a == "") {
                        VistaCelda.btnComuna.setTitle(a, for: UIControlState.normal)
                    }
                    
                }
                if !identificacion9.isEmpty {
                    VistaCelda.btnCiudad.setTitle(identificacion9, for: UIControlState.normal)
                }
                if !identificacion11.isEmpty {
                    VistaCelda.btnComuna.setTitle(identificacion11, for: UIControlState.normal)
                }
                if self.BanderaOtro == 1 {
                    VistaCelda.txtPueblo.isEnabled = true
                } else {
                    VistaCelda.txtPueblo.isEnabled = false
                    VistaCelda.txtPueblo.text = ""
                }
                
                cell.contentView.addSubview(VistaCelda as UIView)
                return cell
            } else if indexPath.section == 6 {
                var cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FirstTableViewCell.self)) as! FirstTableViewCell
                cell.labelFirst.text = "Section1: \(indexPath.section) Row: \(indexPath.row)"
                let VistaCelda = Bundle.main.loadNibNamed("AccesibilidadEstablecimiento", owner: self, options: nil)?[0] as! AccesibilidadEstablecimiento
                VistaCelda.frame.size.width = cell.contentView.frame.width
                VistaCelda.frame.size.height = cell.contentView.frame.height
                VistaCelda.btnAccesibilidad.tag = 71
                VistaCelda.btnCondiciones.tag = 72
                VistaCelda.btnAccesibilidad.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                VistaCelda.btnCondiciones.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                if  !idFichaConsultada.isEmpty {
                    var a = idFichaConsultada.first?.value(forKeyPath: "identificacion15") as? String
                    if !(a == "") {
                        VistaCelda.btnAccesibilidad.setTitle(a, for: UIControlState.normal)
                    }
                    a = idFichaConsultada.first?.value(forKeyPath: "identificacion17") as? String
                    if !(a == "") {
                        VistaCelda.btnCondiciones.setTitle(a, for: UIControlState.normal)
                    }
                    
                }
                if !identificacion15.isEmpty {
                    VistaCelda.btnAccesibilidad.setTitle(identificacion15, for: UIControlState.normal)
                }
                
                if !identificacion17.isEmpty {
                    VistaCelda.btnCondiciones.setTitle(identificacion17, for: UIControlState.normal)
                }
                cell.contentView.addSubview(VistaCelda as UIView)
                return cell
            } else if indexPath.section == 7 {
                var cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FirstTableViewCell.self)) as! FirstTableViewCell
                cell.labelFirst.text = "Section1: \(indexPath.section) Row: \(indexPath.row)"
                let VistaCelda = Bundle.main.loadNibNamed("Georeferenciacion", owner: self, options: nil)?[0] as! Georeferenciacion
                VistaCelda.frame.size.width = cell.contentView.frame.width
                VistaCelda.frame.size.height = cell.contentView.frame.height

                if  !idFichaConsultada.isEmpty {
                    var a = idFichaConsultada.first?.value(forKeyPath: "latitud") as? String
                    if !(a == "") && !(a == nil ) {
                        VistaCelda.Lat.text = "Latitud: " + (a?.description)!
                    }
                    
                    a = idFichaConsultada.first?.value(forKeyPath: "longitud") as? String
                    if !(a == "") && !(a == nil ) {
                        VistaCelda.Long.text = "Longitud: " + (a?.description)!
                        
                    }

                    
                } else {
                    VistaCelda.Lat.text = "Latitud: " + latitud
                    VistaCelda.Long.text = "Longitud: " + longitud
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
            if (indexPath.section == -1) {
                return 115
            } else if (indexPath.section == 0) {
                return 62
            } else if (indexPath.section == 1) {
                return 62
            } else if (indexPath.section == 2) {
                return 62
            } else if (indexPath.section == 3) {
                return 52
            } else if (indexPath.section == 4) {
                return 190
            } else if (indexPath.section == 5) {
                return 347
            } else if (indexPath.section == 6) {
                return 255
            } else if (indexPath.section == 7) {
                return 130
            } else {
                return 107
                
            }
            
        }
        
        //        } else {
        //            return 60
        //        }
        
        
        
    }
    
    
}

extension IdentificacionInmueble: ExpyTableViewDelegate {
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

