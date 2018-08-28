//
//  InformeDeAvence.swift
//  Sismo App_Example
//
//  Created by Cesar Andres Figueroa Mendiola on 09/12/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//
import UIKit
import CoreData
import Alamofire
import SwiftyJSON
import SwiftMessages
import MessageUI
import PDFGenerator

class InformeDeAvence: UIViewController, UITableViewDataSource, UITableViewDelegate, UIDocumentInteractionControllerDelegate, MFMailComposeViewControllerDelegate {
    
    var vectorPreguntas = ["A", "B"]
    
    @IBOutlet weak var VistaEnDesarrollo: UIView!
    @IBOutlet weak var VistaSinEnviar: UIView!
    @IBOutlet weak var VistaEnviados: UIView!
    @IBOutlet weak var CantidadDesarrollo: UILabel!
    @IBOutlet weak var CantidadSinEnviar: UILabel!
    @IBOutlet weak var CantidadEnviados: UILabel!
    @IBOutlet weak var CantidadTotal: UILabel!
    
    var MatrizFichas = [  [String]() ]
    var MatrizFichas1 = [  [String]() ]
    var MatrizFichas2 = [  [String]() ]
    var MatrizFichas3 = [  [String]() ]
    var Desarrollo = 0
    var SinEnviar = 0
    var Enviado = 0
    var Total = 0
    var BanderaEstado1 = 0
    var BanderaEstado2 = 0
    var BanderaEstado3 = 0
    var email = ""
    var RutaPDF = ""
    
    @IBOutlet weak var VistaBar: UIView!
    
    @IBOutlet weak var Tabla: UITableView!
    override func viewDidLoad() {
        BanderaEstado1 = 0
        BanderaEstado2 = 0
        BanderaEstado3 = 0
        VistaEnDesarrollo.layer.cornerRadius = VistaEnDesarrollo.frame.size.width/2
        VistaEnDesarrollo.clipsToBounds = true
        VistaSinEnviar.layer.cornerRadius = VistaSinEnviar.frame.size.width/2
        VistaSinEnviar.clipsToBounds = true
        VistaEnviados.layer.cornerRadius = VistaEnviados.frame.size.width/2
        VistaEnviados.clipsToBounds = true
        
        
//        let entity = NSEntityDescription.entity(forEntityName: "Ficha", in: context)
//        let newUser = NSManagedObject(entity: entity!, insertInto: context)
//        newUser.setValue("1", forKey: "estado")
//        newUser.setValue("1", forKey: "folio")
//        newUser.setValue("1", forKey: "idficha")
//        do {
//            
//            try context.save()
//            
//        } catch {
//            
//            print("Failed saving")
//        }
        self.VistaBar.layer.borderWidth = 1
        self.VistaBar.layer.borderColor = UIColor.black.cgColor
        self.VistaBar.layer.borderWidth = 1
        self.VistaBar.layer.borderColor = UIColor.black.cgColor
        ConsultaFichas ()
        
        
    }
    func ConsultaFichas (){
        let OrdenEstado = NSSortDescriptor(key: "estado", ascending: true)
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Ficha")
        request.sortDescriptors = [OrdenEstado]
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        MatrizFichas.removeAll()
        MatrizFichas.removeAll(keepingCapacity: true)
        MatrizFichas1.removeAll()
        MatrizFichas1.removeAll(keepingCapacity: true)
        MatrizFichas2.removeAll()
        MatrizFichas2.removeAll(keepingCapacity: true)
        MatrizFichas3.removeAll()
        MatrizFichas3.removeAll(keepingCapacity: true)
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                let Vec1 = [data.value(forKey: "folio") as! String, data.value(forKey: "estado") as! String, data.value(forKey: "idficha") as! String ]
                if !Vec1.isEmpty {
                   MatrizFichas.append(Vec1)
                }
                
                if (data.value(forKey: "estado") as! String) == "1" {
                    self.MatrizFichas1.append(Vec1)
                    Desarrollo = Desarrollo + 1
                } else if (data.value(forKey: "estado") as! String) == "2" {
                    SinEnviar = SinEnviar + 1
                    self.MatrizFichas2.append(Vec1)
                } else if (data.value(forKey: "estado") as! String) == "3" {
                    Enviado = Enviado + 1
                    self.MatrizFichas3.append(Vec1)
                }
                Total = Desarrollo + SinEnviar + Enviado
                
                print(data.value(forKey: "estado") as! String)
            }
            CantidadDesarrollo.text = Desarrollo.description
            CantidadSinEnviar.text = SinEnviar.description
            CantidadEnviados.text = Enviado.description
            CantidadTotal.text = Total.description
            
            Tabla.reloadData()
        } catch {
            
            print("Failed")
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MatrizFichas.count
        //Total
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        // Celda estado 1
        if row == 0 {
           BanderaEstado1 = 0
        }
        
        if row  == (Total - SinEnviar ){
           BanderaEstado2 = 0
        }
        if MatrizFichas[row][1] == "1" {
            if BanderaEstado1 == 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: "Celda3", for: indexPath as IndexPath) as! InformeDeAvenceCelda3
                cell.Estado.text  = "EN DESARROLLO"
                cell.ColorFicha.backgroundColor = UIColor(red:0.99, green:0.58, blue:0.31, alpha:1.0)
                cell.ColorFicha.layer.cornerRadius = cell.ColorFicha.frame.size.width/2
                cell.idFicha.text = MatrizFichas[row][0]
//                cell.VistaModificar.layer.cornerRadius = 5
                cell.btnModificar.tag = row
                cell.btnEliminar.tag = row
                cell.btnModificar.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                cell.btnEnviar.isHidden = true
                cell.btnEliminar.addTarget(self, action: #selector(EliminarBtn(_:)), for: .touchUpInside)
                cell.btnEnviar.addTarget(self, action: #selector(EnviarBtn(_:)), for: .touchUpInside)
                BanderaEstado1 = 1
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "Celda2", for: indexPath as IndexPath) as! InformeDeAvenceCelda2
                cell.fechaFicha.text = MatrizFichas[row][0]
                cell.colorEstadoFicha.layer.cornerRadius = cell.colorEstadoFicha.frame.size.width/2
//                if MatrizFichas[row][1] == "1" {
                    cell.colorEstadoFicha.backgroundColor = UIColor(red:0.99, green:0.58, blue:0.31, alpha:1.0)
//                } else if MatrizFichas[row][1] == "2" {
//                  cell.colorEstadoFicha.backgroundColor =  UIColor(red:0.99, green:0.83, blue:0.01, alpha:1.0)
//              }
//              UIColor(red:0.25, green:0.72, blue:0.44, alpha:1.0)
                cell.colorEstadoFicha.clipsToBounds = true
//                cell.vistaBotonModificar.layer.cornerRadius = 5
//                cell.vistaBotonModificar.clipsToBounds = true
                cell.btnModificar.tag = row
                cell.btnModificar.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                cell.btnEnviar.isHidden = true
                cell.btnEliminar.addTarget(self, action: #selector(EliminarBtn(_:)), for: .touchUpInside)
                cell.btnEnviar.addTarget(self, action: #selector(EnviarBtn(_:)), for: .touchUpInside)
                cell.btnEliminar.tag = row
                
                return cell
//            }
            }
        } else {
//            if MatrizFichas[row][1] == "2" {
            if BanderaEstado2 == 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: "Celda3", for: indexPath as IndexPath) as! InformeDeAvenceCelda3
                cell.Estado.text  = "SIN ENVIAR"
                cell.ColorFicha.backgroundColor = UIColor(red:0.99, green:0.83, blue:0.01, alpha:1.0)
                cell.ColorFicha.layer.cornerRadius = cell.ColorFicha.frame.size.width/2
                cell.idFicha.text = MatrizFichas[row][0]
//                cell.VistaModificar.layer.cornerRadius = 5
                BanderaEstado2 = 1
                cell.btnModificar.tag = row
                cell.btnModificar.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                cell.btnEliminar.addTarget(self, action: #selector(EliminarBtn(_:)), for: .touchUpInside)
                cell.btnEnviar.isHidden = false
                cell.btnEnviar.addTarget(self, action: #selector(EnviarBtn(_:)), for: .touchUpInside)
                cell.btnEnviar.tag = row
                cell.btnEliminar.tag = row
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "Celda2", for: indexPath as IndexPath) as! InformeDeAvenceCelda2
                cell.fechaFicha.text = MatrizFichas[row][0]
                cell.colorEstadoFicha.layer.cornerRadius = cell.colorEstadoFicha.frame.size.width/2
                //                if MatrizFichas[row][1] == "1" {
                cell.colorEstadoFicha.backgroundColor = UIColor(red:0.99, green:0.83, blue:0.01, alpha:1.0)
                //                } else if MatrizFichas[row][1] == "2" {
                //                  cell.colorEstadoFicha.backgroundColor =  UIColor(red:0.99, green:0.83, blue:0.01, alpha:1.0)
                //              }
                //              UIColor(red:0.25, green:0.72, blue:0.44, alpha:1.0)
                cell.colorEstadoFicha.clipsToBounds = true
//                cell.vistaBotonModificar.layer.cornerRadius = 5
//                cell.vistaBotonModificar.clipsToBounds = true
                cell.btnModificar.tag = row
                cell.btnModificar.addTarget(self, action: #selector(EjecutarBtn(_:)), for: .touchUpInside)
                cell.btnEliminar.addTarget(self, action: #selector(EliminarBtn(_:)), for: .touchUpInside)
                cell.btnEnviar.isHidden = false
                cell.btnEnviar.addTarget(self, action: #selector(EnviarBtn(_:)), for: .touchUpInside)
                cell.btnEnviar.tag = row
                cell.btnEliminar.tag = row
                return cell
                //            }
            }
        }
        
            
        
//        return
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        //        view.removeFromSuperview()
    }
    

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 110.0
        }
        
        if indexPath.row  == (Total - SinEnviar ){
            return 110.0
        }
        
        
        return 75.0
    }
    


    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func EliminarBtn(_ sender: UIButton) {
        let alert = UIAlertController(title: "Eliminar", message: "¿Está seguro que quiere eliminar el presente informe?", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default,  handler: { action in
            guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
                    return
            }
            let managedContext =
                appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Ficha")
            fetchRequest.predicate = NSPredicate(format: "idficha = %@", self.MatrizFichas[sender.tag][2] )
            do {

                idFichaConsultada = try managedContext.fetch(fetchRequest)
                if (try? context.fetch(fetchRequest)) != nil {
                    for registro in idFichaConsultada {
                        context.delete(registro)
                        self.MatrizFichas.remove(at: sender.tag)
                        self.Tabla.reloadData()
                    }
                }
                
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
 
        }))

        alert.addAction(UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.cancel,  handler: { action in
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func EjecutarBtn(_ sender: UIButton) {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        let managedContext =
            appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Ficha")
        fetchRequest.predicate = NSPredicate(format: "idficha = %@", MatrizFichas[sender.tag][2] )
        
        //3
        do {
            idFichaConsultada = try managedContext.fetch(fetchRequest)
            for registro in idFichaConsultada {
                idFicha = (registro.value(forKeyPath: "idficha") as? String)!
                NombreFicha = (registro.value(forKeyPath: "folio") as? String)!
//                let a = registro.value(forKeyPath: "folio") as? String
//                let b = registro.value(forKeyPath: "estado") as? String
//                let c = registro.value(forKeyPath: "idficha") as? String
//                print(a , b , c)
            }
            
            TipoInfoGeneral = 1
            let storyboard: UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
            let vc: MenuInforme = storyboard.instantiateViewController(withIdentifier: "menuinforme") as! MenuInforme
            self.present(vc, animated: false, completion: nil)
            
            
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    
    func EnviarBtn(_ sender: UIButton) {
        let alert = UIAlertController(title: "Eviar", message: "Que operación desea realizar", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Enviar informe por correo electrónico", style: UIAlertActionStyle.default,  handler: { action in
            
            
            var alertController = UIAlertController(title: "Enviar informe por correo electrónico", message: "Por favor ingrese el correo electrónico", preferredStyle: .alert)
            alertController.addTextField(configurationHandler: { (textField) -> Void in
                textField.placeholder = "Correo electrónico"
                textField.textAlignment = .left
            })
            alertController.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: {
                alert -> Void in

                self.email = (alertController.textFields![0].text as! NSString ).description

                
                if self.email.isEmpty {
                    let errorAlert = UIAlertController(title: "Error", message: "Por favor ingrese los datos solicitados", preferredStyle: .alert)
                    errorAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {
                        alert -> Void in
                        self.present(alertController, animated: true, completion: nil)
                    }))
                    self.present(errorAlert, animated: true, completion: nil)
                    
                } else {
                    guard let appDelegate =
                        UIApplication.shared.delegate as? AppDelegate else {
                            return
                    }
                    let managedContext =
                        appDelegate.persistentContainer.viewContext
                    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Ficha")
                    fetchRequest.predicate = NSPredicate(format: "idficha = %@", self.MatrizFichas[sender.tag][2] )
                    
                    do {
                        idFichaConsultada = try managedContext.fetch(fetchRequest)
                        for registro in idFichaConsultada {
                            idFicha = (registro.value(forKeyPath: "idficha") as? String)!
                            NombreFicha = (registro.value(forKeyPath: "folio") as? String)!
                        }
                    } catch let error as NSError {
                        print("Could not fetch. \(error), \(error.userInfo)")
                    }
                    let matrizSelected = self.MatrizFichas[sender.tag]
                    self.EnviarPDF(matrizSelected)
                }
                
            }))
            alertController.addAction(UIAlertAction(title: "Cancelar", style: .cancel , handler: {
                alert -> Void in
                
                
            }))
            self.present(alertController, animated: true, completion: nil)
            
            
            
            
        }))
        alert.addAction(UIAlertAction(title: "Enviar información a SIEMOP", style: UIAlertActionStyle.default,  handler: { action in
            let alert2 = UIAlertController(title: "Informe", message: "Información enviada", preferredStyle: UIAlertControllerStyle.alert)
            alert2.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default,  handler: { action in
                self.GuardarSIEMOP(tag: sender.tag)
            }))
            self.present(alert2, animated: true, completion: nil)
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.cancel,  handler: { action in
            
        }))
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

    func EnviarPDF(_ matrizSelected:[String]){
        CircularSpinner.hide()
        
        let pdfMachote = Bundle.main.loadNibNamed("InformePDFViewController", owner: nil, options: nil)?[0] as! InformePDFView
        pdfMachote.matrizSelected = matrizSelected
        pdfMachote.fillInformationWithDetail()
        //let vista = PDFPage.view(pdfMachote)
        let filename = getDocumentsDirectory().appendingPathComponent("informe.pdf")
        // let dst = URL(fileURLWithPath: NSTemporaryDirectory().appending("informe.pdf"))
        RutaPDF = filename.path
        
        //       TODO: Solo para fines de testing
        var scrollView: UIScrollView!
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        scrollView.contentSize = CGSize(width: self.view.frame.width*3, height: 6000)
        scrollView.tag = 100
        scrollView.addSubview(pdfMachote)
        self.view.addSubview(scrollView)
        let aSelector : Selector = #selector(InformeDeAvence.removeSubview)
        let tapGesture = UITapGestureRecognizer(target:self, action: aSelector)
        scrollView.addGestureRecognizer(tapGesture)
        return
        
        let page1 = PDFPage.view(pdfMachote.page1)
        let page2 = PDFPage.view(pdfMachote.page2)
        let page3 = PDFPage.view(pdfMachote.page3)
        let page4 = PDFPage.view(pdfMachote.page4)
        let pages = [page1, page2, page3,page4]
        
        do {
            let data = try PDFGenerator.generated(by: pages)
            try data.write(to: filename, options: .atomic)
        } catch (let error) {
            print(error)
        }
        
        
        //Enviar email
        
        let mailComposeViewController = configuredMailComposeViewController()
        mailComposeViewController.setToRecipients([self.email])
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        }
        
        //Pagina1
    let var1 = (idFichaConsultada.first?.value(forKeyPath: "identificacion3") as? String) ?? "" // nombre
    let var2 = (idFichaConsultada.first?.value(forKeyPath: "identificacion5") as? String) ?? ""// compoetencia
    let var3 = (idFichaConsultada.first?.value(forKeyPath: "identificacion12") as? String) ?? ""
    let var4 = (idFichaConsultada.first?.value(forKeyPath: "identificacion10") as? String) ?? ""
    let var5 = (idFichaConsultada.first?.value(forKeyPath: "identificacion2") as? String) ?? ""
    let var6 = (idFichaConsultada.first?.value(forKeyPath: "identificacion4") as? String) ?? ""
    let var7 = (idFichaConsultada.first?.value(forKeyPath: "identificacion6") as? String) ?? ""
    let var8 = (idFichaConsultada.first?.value(forKeyPath: "identificacion7") as? String) ?? ""
    let var9 = (idFichaConsultada.first?.value(forKeyPath: "latitud") as? String) ?? ""
    let var10 = (idFichaConsultada.first?.value(forKeyPath: "longitud") as? String) ?? ""
    let var11 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion54") as? String) ?? ""
    let var12 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion55") as? String) ?? ""
    let var13 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion56") as? String) ?? ""
    let var14 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion58") as? String) ?? ""
    let var15 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion59") as? String) ?? ""
    let var16 = (idFichaConsultada.first?.value(forKeyPath: "identificacion11") as? String) ?? ""
    let var17 = (idFichaConsultada.first?.value(forKeyPath: "informe2") as? String) ?? ""
    let var18 = (idFichaConsultada.first?.value(forKeyPath: "informe3") as? String) ?? ""
    let var19 = (idFichaConsultada.first?.value(forKeyPath: "informe5") as? String) ?? ""
    let var20 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion1") as? String) ?? ""
    let var21 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion2") as? String) ?? ""
    let var22 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion3") as? String) ?? ""
    let var23 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion4") as? String) ?? ""
    let var24 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion5") as? String) ?? ""
    let var25 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion6") as? String) ?? ""
    let var26 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion7") as? String) ?? ""
    let var27 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion8") as? String) ?? ""
        //Pagina2
        
    var var28 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion10") as? String) ?? ""
    var var29 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion11") as? String) ?? ""
    var var30 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion12") as? String) ?? ""
        
    var var31 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion13") as? String) ?? ""
    var var32 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion14") as? String) ?? ""
    var var33 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion15") as? String) ?? ""
        
    var var34 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion19") as? String) ?? ""
    var var35 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion20") as? String) ?? ""
    var var36 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion21") as? String) ?? ""
        
    var28 = (var28 == "1") ? "Si" : "No"
    var31 = (var31 == "1") ? "Si" : "No"
    var34 = (var34 == "1") ? "Si" : "No"
    
        if (var28 == "No") {
           var29 = ""
           var30 = ""
        }
        if (var31 == "No") {
            var32 = ""
            var33 = ""
        }
        if (var34 == "No") {
            var35 = ""
            var36 = ""
        }
        
        
    
    var var37 = ""
    var var38 = ""
    var var39 = ""
    var var40 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion42") as? String) ?? ""
    if (evalucacion35 == "1") {
        var37 = "HORMIGON ARMADO"
        var38 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion36") as? String) ?? ""
        var39 = ""//(idFichaConsultada.first?.value(forKeyPath: "evalucacion21") as? String) ?? ""
    } else if (evalucacion35 == "2") {
        var37 = "ALBAÑILERIA"
        var38 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion37") as? String) ?? ""
            var39 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion38") as? String) ?? ""
            
    } else if (evalucacion35 == "3") {
        var37 = "ACERO"
        var38 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion39") as? String) ?? ""
        var39 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion40") as? String) ?? ""
    } else if (evalucacion35 == "4") {
        var37 = "MADERA"
        var38 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion41") as? String) ?? ""
        var39 = ""//(idFichaConsultada.first?.value(forKeyPath: "evalucacion38") as? String) ?? ""
    }
        
        var var41 = ""
        var var42 = ""
        var var43 = ""
        var var44 = ""
        var var45 = ""
        var var46 = ""
        
        if let name = dato.object(forKey: "nombrefichains") as? String {
            var41 = name
        }
        if let name = dato.object(forKey: "AppPatfichains") as? String {
            var42 = name
        }
        
        if let name = dato.object(forKey: "AppMatfichains") as? String {
            var43 = name
        }
        
        if let name = dato.object(forKey: "profesionfichains") as? String {
            var44 = name
        }
        if let name = dato.object(forKey: "institucionfichains") as? String {
            var45 = name
        }
        if let name = dato.object(forKey: "emailfichains") as? String {
            var46 = name
        }
        var var47 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion53") as? String) ?? ""

        
        
        //Inspeccion1
        
        idBanFichaListado = 1
        idFichaListado.removeAll(keepingCapacity: true)
        idFichaListado.removeAll()
        var managedContext =
            appDelegate.persistentContainer.viewContext
        var fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Insp1")
        fetchRequest.predicate = NSPredicate(format: "idficha = %@", idFicha )
        var  OrdenEstado = NSSortDescriptor(key: "num_letra", ascending: true)
        fetchRequest.sortDescriptors = [OrdenEstado]
        
        //3
        var Elemento = ""
        var ListadoInspeccion = "<tr> <td> </td><td>  </td><td>  </td> <td></td></tr>"
        do {
            idFichaListado = try managedContext.fetch(fetchRequest)
            for registro in idFichaListado {
                Elemento = (registro.value(forKeyPath: "respuesta") as! NSString).description
                if ((registro.value(forKeyPath: "respuesta") as! NSString).description == "Colapso")   {
                    if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 1 {
                        ListadoInspeccion =  ListadoInspeccion + "<tr> <td>" + Elemento + "</td><td>No</td><td> </td> <td></td>     </tr>"
                        
                    } else if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 2 {
                        ListadoInspeccion =  ListadoInspeccion + "<tr> <td>" + Elemento + "</td><td>  </td><td> Parcial </td> <td></td></tr>"
                        
                    } else if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 3 {
                       ListadoInspeccion =  ListadoInspeccion + "<tr> <td>" + Elemento + "</td><td>  </td><td>  </td> <td> Total </td></tr>"
                    }
                }  else if ((registro.value(forKeyPath: "respuesta") as! NSString).description == "Daño producto de Edificaciones Adyacentes o falla del suelo colindante") {
                    if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 1 {
                        ListadoInspeccion =  ListadoInspeccion + "<tr> <td>" + Elemento + "</td><td>No</td><td> </td> <td></td>     </tr>"
                        
                    } else if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 2 {
                        ListadoInspeccion =  ListadoInspeccion + "<tr> <td>" + Elemento + "</td><td>  </td><td> Incierto </td> <td></td></tr>"
                        
                    } else if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 3 {
                        ListadoInspeccion =  ListadoInspeccion + "<tr> <td>" + Elemento + "</td><td>  </td><td>  </td> <td> Si </td></tr>"
                    }
                    
                } else if ((registro.value(forKeyPath: "respuesta") as! NSString).description == "Asentamiento del Edificio debido a Falla de suelo") {
                    if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 1 {
                        ListadoInspeccion =  ListadoInspeccion + "<tr> <td>" + Elemento + "</td><td>< 0.2 m</td><td> </td> <td></td>     </tr>"
                        
                    } else if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 2 {
                        ListadoInspeccion =  ListadoInspeccion + "<tr> <td>" + Elemento + "</td><td>  </td><td> Entre 0.2 y 1.0m </td> <td></td></tr>"
                        
                    } else if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 3 {
                        ListadoInspeccion =  ListadoInspeccion + "<tr> <td>" + Elemento + "</td><td>  </td><td>  </td> <td> > 1.0m </td></tr>"
                    }
                    
                } else if ((registro.value(forKeyPath: "respuesta") as! NSString).description == "Inclinación del Edificio completo o una parte debido a asentamiento diferencial") {
                    if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 1 {
                        ListadoInspeccion =  ListadoInspeccion + "<tr> <td>" + Elemento + "</td><td>< 1/60 rad</td><td> </td> <td></td>     </tr>"
                        
                    } else if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 2 {
                        ListadoInspeccion =  ListadoInspeccion + "<tr> <td>" + Elemento + "</td><td>  </td><td> Entre 1/60 y 1/30 rad (aparentemente inclinado) </td> <td></td></tr>"
                        
                    } else if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 3 {
                        ListadoInspeccion =  ListadoInspeccion + "<tr> <td>" + Elemento + "</td><td>  </td><td>  </td> <td>  > 1/30 rad (fácil de notar) </td></tr>"
                    }
                } else if ((registro.value(forKeyPath: "respuesta") as! NSString).description == "Deformación de Estructura de Techo del Edificio total o parcial") {
                    if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 1 {
                        ListadoInspeccion =  ListadoInspeccion + "<tr> <td>" + Elemento + "</td><td><  1/60 rad</td><td> </td> <td></td>     </tr>"
                        
                    } else if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 2 {
                        ListadoInspeccion =  ListadoInspeccion + "<tr> <td>" + Elemento + "</td><td>  </td><td> Entre 1/60 y 1/30 rad (aparentemente inclinado) rad (aparentemente inclinado) </td> <td></td></tr>"
                        
                    } else if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 3 {
                        ListadoInspeccion =  ListadoInspeccion + "<tr> <td>" + Elemento + "</td><td>  </td><td>  </td> <td> 1/30 rad (fácil de notar o grietas de cordones) </td></tr>"
                    }
                    
                }
//                <tr>        <td>Colapso</td>        <td></td>        <td>Parcial</td>        <td><b></b></td>        </tr>
//                <tr>        <td>Daño producto de edificaciones adyacentes o falla del suelo colindante</td>        <td></td>        <td>Incierto</td>        <td><b></b></td>        </tr>
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        // Inspeccion2
        var ListadoInspeccion2 = "<tr> <td> </td> <td> </td> <td> </td>  <td> </td>   <td> </td>    <td> </td>        <td> </td>  </tr>"
        idBanFichaListado = 2
        idFichaListado.removeAll(keepingCapacity: true)
        idFichaListado.removeAll()
        managedContext =
            appDelegate.persistentContainer.viewContext
        fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Insp2")
        fetchRequest.predicate = NSPredicate(format: "idficha = %@", idFicha )
        
        do {
            idFichaListado = try managedContext.fetch(fetchRequest)
            for registro in idFichaListado {
                Elemento = (registro.value(forKeyPath: "elemento") as! NSString as String)
                var ele1 = (registro.value(forKeyPath: "ele1") as! NSString as String)
                var ele2 = (registro.value(forKeyPath: "ele2") as! NSString as String)
                var ele3 = (registro.value(forKeyPath: "ele3") as! NSString as String)
                var ele4 = (registro.value(forKeyPath: "ele4") as! NSString as String)
                var ele5 = (registro.value(forKeyPath: "ele5") as! NSString as String)
                var ele6 = (registro.value(forKeyPath: "total") as! NSString as String)
                ListadoInspeccion2 = "<tr> <td>" + Elemento + "</td> <td>" + ele1 + "</td> <td>" + ele2 + "</td>  <td>" + ele3 + "</td>   <td>" + ele4 + "</td>    <td>" + ele5 + "</td>        <td>" + ele6 + "</td>  </tr>"
            }

            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        
        //Inspeccion3
        
        var ListadoInspeccion3 = "<tr> <td>  </td>  <td>  </td>        <td>  </td>    <td></td>        </tr>"
        idBanFichaListado = 1
        idFichaListado.removeAll(keepingCapacity: true)
        idFichaListado.removeAll()
        managedContext =
            appDelegate.persistentContainer.viewContext
        fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Insp3")
        fetchRequest.predicate = NSPredicate(format: "idficha = %@", idFicha )
        OrdenEstado = NSSortDescriptor(key: "num_letra", ascending: true)
        fetchRequest.sortDescriptors = [OrdenEstado]
        
        
        
        //3
        do {
            idFichaListado = try managedContext.fetch(fetchRequest)
            for registro in idFichaListado {
                Elemento = (registro.value(forKeyPath: "respuesta") as! NSString).description

                if ((registro.value(forKeyPath: "respuesta") as! NSString).description == "Cielos falsos")   {
                    if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 1 {
                        ListadoInspeccion3 = ListadoInspeccion3 +  "<tr> <td> " + Elemento + "  </td>  <td>  </td>  <td>Sin daños</td>        <td> </td>    <td></td>        </tr>"
                        
                    } else if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 2 {
                        ListadoInspeccion3 = ListadoInspeccion3 +   "<tr>  <td> " + Elemento + "  </td>        <td> Se observa daño </td>    <td></td>        </tr>"
                    } else if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 3 {
                        ListadoInspeccion3 = ListadoInspeccion3 +   "<tr>  <td> " + Elemento + "  </td> <td></td>        <td></td>    <td>Peligro de caída</td>        </tr>"
                    }
                    
                    
                } else if ((registro.value(forKeyPath: "respuesta") as! NSString).description == "Escaleras") {
                    if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 1 {
                        ListadoInspeccion3 = ListadoInspeccion3 +   "<tr>  <td> " + Elemento + "  </td> <td>Sin o poco daño</td>        <td> </td>    <td></td>        </tr>"
                    } else if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 2 {
                        ListadoInspeccion3 = ListadoInspeccion3 +   "<tr>  <td> " + Elemento + "  </td> <td>  </td>        <td> Gran cantidad de grietas pero las barras de refuerzo están ancladas </td>    <td></td>        </tr>"
                    } else if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 3 {
                        ListadoInspeccion3 = ListadoInspeccion3 +   "<tr>  <td> " + Elemento + "  </td> <td></td>        <td></td>    <td>Inclinación/Separación de los elementos con que se cnecta, barras de anclaje separadas del elemento</td>        </tr>"
                    }
                    
                } else if ((registro.value(forKeyPath: "respuesta") as! NSString).description == "Muros no estructurales con marcos") {
                    if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 1 {
                        ListadoInspeccion3 = ListadoInspeccion3 +   "<tr>  <td> " + Elemento + "  </td> <td>Sin o poco daño</td>        <td> </td>    <td></td>        </tr>"
                    } else if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 2 {
                        ListadoInspeccion3 = ListadoInspeccion3 +   "<tr>  <td> " + Elemento + "  </td> <td>  </td>        <td> Se observa grietas sin deformación fuera del plano </td>    <td></td>        </tr>"
                    } else if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 3 {
                        ListadoInspeccion3 = ListadoInspeccion3 +   "<tr>  <td> " + Elemento + "  </td> <td></td>        <td></td>    <td>Grietas extensas interconectadas, o deformación fuera del plano</td>        </tr>"
                    }
                    
                } else if ((registro.value(forKeyPath: "respuesta") as! NSString).description == "Muros no estructurales sin marcos"){
                    if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 1 {
                        ListadoInspeccion3 = ListadoInspeccion3 +   "<tr>  <td> " + Elemento + "  </td> <td>Sin daños</td>        <td> </td>    <td></td>        </tr>"
                    } else if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 2 {
                        ListadoInspeccion3 = ListadoInspeccion3 +   "<tr>  <td> " + Elemento + "  </td>  <td>  </td>        <td> Grietas leves </td>    <td></td>        </tr>"
                    } else if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 3 {
                        ListadoInspeccion3 = ListadoInspeccion3 +   "<tr>  <td> " + Elemento + "  </td> <td></td>        <td></td>    <td>Grietas de corte, grietas de esquina</td>        </tr>"
                    }
                    
                } else if ((registro.value(forKeyPath: "respuesta") as! NSString).description == "Estanques, Antenas, Balcones, Letreros, Maquinaria, etc.") {
                    if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 1 {
                        ListadoInspeccion3 = ListadoInspeccion3 +   "<tr>  <td> " + Elemento + "  </td> <td>Sin inclinación</td>        <td> </td>    <td></td>        </tr>"
                    } else if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 2 {
                        ListadoInspeccion3 = ListadoInspeccion3 +   "<tr>  <td> " + Elemento + "  </td> <td>  </td>        <td> Un poco inclinado </td>    <td></td>        </tr>"
                    } else if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 3 {
                        ListadoInspeccion3 = ListadoInspeccion3 +   "<tr>  <td> " + Elemento + "  </td> <td></td>        <td></td>    <td>Peligro de caída</td>        </tr>"
                    }
                    
                } else if ((registro.value(forKeyPath: "respuesta") as! NSString).description == "Bienes muebles 1") {
                    if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 1 {
                        ListadoInspeccion3 = ListadoInspeccion3 +   "<tr>  <td> " + Elemento + "  </td> <td>Sin inclinación</td>        <td> </td>    <td></td>        </tr>"
                    } else if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 2 {
                        ListadoInspeccion3 = ListadoInspeccion3 +   "<tr>  <td> " + Elemento + "  </td> <td>  </td>        <td> Un poco inclinado </td>    <td></td>        </tr>"
                    } else if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 3 {
                        ListadoInspeccion3 = ListadoInspeccion3 +   "<tr>  <td> " + Elemento + "  </td> <td></td>        <td></td>    <td>Peligro de caída</td>        </tr>"
                    }
                    
                } else if ((registro.value(forKeyPath: "respuesta") as! NSString).description == "Bienes muebles 2") {
                    if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 1 {
                        ListadoInspeccion3 = ListadoInspeccion3 +   "<tr>  <td> " + Elemento + "  </td> <td>Sin inclinación</td>        <td> </td>    <td></td>        </tr>"
                    } else if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 2 {
                        ListadoInspeccion3 = ListadoInspeccion3 +   "<tr>  <td> " + Elemento + "  </td> <td>  </td>        <td>Un poco inclinado</td>    <td></td>        </tr>"
                    } else if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 3 {
                        ListadoInspeccion3 = ListadoInspeccion3 +   "<tr>  <td> " + Elemento + "  </td> <td></td>        <td></td>    <td>Peligro de caída</td>        </tr>"
                    }
                    
                } else if ((registro.value(forKeyPath: "respuesta") as! NSString).description == "Bienes muebles 3") {
                    if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 1 {
                        ListadoInspeccion3 = ListadoInspeccion3 +   "<tr>  <td> " + Elemento + "  </td> <td>Sin inclinación</td>        <td> </td>    <td></td>        </tr>"
                    } else if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 2 {
                        ListadoInspeccion3 = ListadoInspeccion3 +   "<tr>  <td> " + Elemento + "  </td> <td>  </td>        <td>Un poco inclinado</td>    <td></td>        </tr>"
                    } else if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 3 {
                        ListadoInspeccion3 = ListadoInspeccion3 +   "<tr>  <td> " + Elemento + "  </td> <td></td>        <td></td>    <td>Peligro de caída</td>        </tr>"
                    }
                    
                } else if ((registro.value(forKeyPath: "respuesta") as! NSString).description == "Otro(s) Perligro(s)") {
                    if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 1 {
                        ListadoInspeccion3 = ListadoInspeccion3 +   "<tr>  <td> " + Elemento + "  </td> <td>Sin daños</td>        <td> </td>    <td></td>        </tr>"
                    } else if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 2 {
                        ListadoInspeccion3 = ListadoInspeccion3 +   "<tr> <td> " + Elemento + "  </td>  <td>  </td>        <td>Se observa daño</td>    <td></td>        </tr>"
                    } else if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 3 {
                        ListadoInspeccion3 = ListadoInspeccion3 +   "<tr>  <td> " + Elemento + "  </td> <td></td>        <td></td>    <td>Peligro para la vida</td>        </tr>"
                    }
                } else if ((registro.value(forKeyPath: "respuesta") as! NSString).description == "Marcos y vidrios de ventana") {
                    if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 1 {
                        ListadoInspeccion3 = ListadoInspeccion3 +   "<tr>  <td> " + Elemento + "  </td> <td>Sin o poco daño</td>        <td> </td>    <td></td>        </tr>"
                    } else if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 2 {
                        ListadoInspeccion3 = ListadoInspeccion3 +   "<tr>  <td> " + Elemento + "  </td> <td>  </td>        <td>Deformación visible y/o grietas</td>    <td></td>        </tr>"
                    } else if (registro.value(forKeyPath: "num_resp") as! Int64 ) == 3 {
                        ListadoInspeccion3 = ListadoInspeccion3 +   "<tr>  <td> " + Elemento + "  </td> <td></td>        <td></td>    <td>Peligro de caída</td>        </tr>"
                    }
                }
            }
            
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        
        var dateStringFormatter = DateFormatter()
        dateStringFormatter.locale = Locale(identifier:"es_cl")
        dateStringFormatter.dateFormat = "dd-MM-yyyy"
        let date = Date()
        var fecha1 = dateStringFormatter.string(from: date)

        var InfoGeneral = "<td>\( var1)</td><td>Competencia</td><td>\(var2 )</td></tr><tr><td>Dirección</td><td>\(var3)</td><td>Pueblo/Ciudad</td><td>\( var4 )</td></tr><tr><td>Tipo Establecimiento</td><td>\( var5)</td><td>Servicio</td><td>\( var6)</td></tr><tr><td>Nombre Responsable</td><td>\(var7 )</td><td>Email</td> <td>\( var8 )</td></tr> <tr><td>Latitud</td> <td>\( var9 )</td><td>Longitud</td> <td> \( var10 ) </td></tr></table><table border width='100%' style='margin-top:30px;border-collapse:collapse'><tr style='background-color:#aba2a2;'><td colspan='4'><b>2. RECOMENDACIONES INICIALES</b></td></tr><tr>        <td>Recomendación</td>        <td>\( var11 )</td>        <td>Estimación Visual área</td>        <td>\( var12 )</td>        </tr>        <tr>        <td colspan='4'><b>Detalle Recomendación</b></td>        </tr>        <tr>        <td colspan='4'>\( var13 )</td>        </tr> "
        var InfoGeneral2 = "  </tr>        <tr>        <td>Región</td>        <td>\( var14 )</td>        <td>Provincia</td>        <td>\( var15 )</td>        <td>Comuna</td>        <td>\( var16 )</td>        </tr>        <tr>        <td>Tipo Desastre</td>        <td colspan='2'>\( var17 )</td>        <td>Nivel de Gravedad</td>        <td colspan='2'>\( var18 )</td></tr><tr><td colspan='6'><b>Descripción de la Emergencia</b></td></tr>        <tr>        <td colspan='6'>\( var19 )</td>        </tr>        </table>        <table border width='100%' style='margin-top:30px;border-collapse:collapse'>        <tr style='background-color:#aba2a2;'>        <td colspan='6'><b>4. DETALLE DE LA EVALUACION EDIFICIO</b></td>        </tr>        <tr>        <td colspan='6'>4.1 General</td>        </tr>        <tr>        <td>N° Edificio</td>        <td>\( var20 )</td>        <td>Tipo Edificio</td>        <td>\( var21 )</td>        <td>Año Construcción</td>        <td>\( var22 )</td>        </tr>        <tr>        <td>N° Pisos</td>        <td>\( var23 )</td>        <td>N° Subterráneos</td>        <td>\( var24 )</td>        <td>Sistema de Pareo</td>        <td>\( var25 )</td>        </tr>        <tr>        <td>Estado Operatividad</td>        <td>\( var26 )</td>        <td>Tipo Inspección</td>        <td>\( var27 )</td>        <td></td>        <td></td>        </tr> "
            
        CircularSpinner.show("Generando información...", animated: true, type: .indeterminate)
        // 1. Create a print formatter
        
        
//        let imageData:NSData = UIImagePNGRepresentation(imageView.image!)!
        let imageData:NSData = UIImagePNGRepresentation( UIImage(named:"FIR.png")! )! as NSData
//        let strBase64:String = imageData.base64EncodedString(options: .Encoding64CharacterLineLength)
        let strBase64:String = imageData.base64EncodedString(options: .lineLength64Characters )
        var ImgApp = String(format: "<img src=\"data:image/png;base64,%@\">", strBase64)
        
        ImgApp = "<IMG SRC=\"data:image/png;base64,R0lGODdhMAAwAPAAAAAAAP///ywAAAAAMAAwAAAC8IyPqcvt3wCcDkiLc7C0qwyGHhSWpjQu5yqmCYsapyuvUU lvONmOZtfzgFzByTB10QgxOR0TqBQejhRNzOfkVJ+5YiUqrXF5Y5lKh/DeuNcP5yLWGsEbtLiOSpa/TPg7JpJHxyendzWTBfX0cxOnKPjgBzi4diinWGdkF8kjdfnycQ ZXZeYGejmJlZeGl9i2icVqaNVailT6F5iJ90m6mvuTS4OK05M0vDk0Q4XUtwv KOzrcd3iq9uisF81M1OIcR7lEewwcLp7tuNNkM3uNna3F2JQFo97Vriy/Xl4/f1cf5VWzXyym7PHhhx4dbgYKAAA7\">"
        
//        var yourImagePath = [[[NSBundle mainBundle] URLForResource:@"resource" withExtension:@"extension"] absoluteString];
//        var URlImg = "2"
//        if let resourceUrl = Bundle.main.url(forResource: "FIR.png", withExtension: "png") {
//            if FileManager.default.fileExists(atPath: resourceUrl.path) {
//                print("file found")
//            } else {
//                URlImg = resourceUrl.path
//            }
//
//
//        }
//
        ImgApp = convertImageAtPathToBase64String(fileName: "FIR.png")
        
//        <img src='FIR2.png'/>
        
        let html = "<html><head><style>table{font-size:14px;}td{width:200px;}</style></head><body><center><div style='width:100%;font-family:calibri'><table width=100% style='border-collapse:collapse;'><tr><td width='20%' style='border-right:1px solid black;text-align:center'>\(ImgApp)</td><td style='padding-left:10px'><p style='font-size:16px'><b>FICHA DE INSPECCIÓN RÁPIDA</b><br><b>EDIFICIOS PÚBLICOS</b></p><p style='font-size:14px'>DIRECCIÓN DE ARQUITECTURA<br>MINISTERIO DE OBRAS PÚBLICAS</p><p style='font-size=13px'><b>COD.INFORME:</b>\( NombreFicha )</p></td><td width='20%' style='border-left:1px solid black;text-align:center'><b>\(fecha1)</b><br><img style='padding-top:5px' src='c.png'/><br><br><b>\( var47 )</b></td></tr></table><table width='100%' style='border:1px solid black'><tr><td style='text-align:center'><img src='signo.gif' style='padding-left:20px;padding-top:5px;float:left'><p style='text-align:center;padding-top:10px'><u><b>Alcance:</b></u> Esta ficha de inspección rápida  de edificación es un documento adaptado, ampliado  y actualizado de la versión japonesa, cuyo el fin es evaluar un inmueble para la  seguridad de las  personas  tanto al interior como en las inmediaciones, orientado  a  la  capacidad  remanente  de  la  estructura.  Debe  ser  usada  por  profesionales  del  área  de  la Construcción.</p></td></tr></table><br><table border width='100%' style='border:1px solid black;border-collapse:collapse;'><tr><td style='text-align:center'><u><b>A = INSPECCIONADO</b></u> Implica que el edificio evaluado nopresenta indicios visibles de deterioro<br></td><td style='text-align:center'> <u><b>B = INGRESO LIMITADO</b></u> Implica que el edificio evaluado presenta indicios de deterioro que podrían ser peligrosos para los usuarios</td><td style='text-align:center' > <u><b>C = INSEGURO</b></u> Implica que el edificio evaluado cuenta con deterioro evidente que pone en peligro a los usuarios<br></td></tr><table border width='100%' style='margin-top:30px;border-collapse:collapse'><tr style='background-color:#aba2a2;'><td colspan='4'><b>1. INFORMACION GENERAL DEL INMUEBLE</b></td></tr><tr><td>Nombre</td> \( InfoGeneral ) </table>        <table border width='100%' style='margin-top:30px;border-collapse:collapse'>        <tr style='background-color:#aba2a2;'>        <td colspan='6'><b>3. INFORMACIÓN GENERAL DEL DESASTRE</b></td> \( InfoGeneral2 )</table>        <p style='page-break-before: always;'>&nbsp;</p>        <table border style='width:100%;border-collapse:collapse'>        <tr style='background-color:#aba2a2;'>        <td colspan='4'><b>4.2 INSTALACIONES</b></td>        </tr>        <tr>        <td><b>Tipo Instalación</b></td>        <td><b>Factibilidad</b></td>        <td><b>Suministro</b></td>        <td><b>Estado</b></td>        </tr>        <tr>        <td>Agua Potable</td>        <td>\( var28 )</td>        <td>\( var29 )</td>        <td>\( var30 )</td>        </tr>        <tr>        <td>Aguas Lluvia</td>        <td>\( var34 )</td>        <td>\( var35 )</td>        <td>\( var36 )</td>        </tr>        <tr>        <td>Alcantarillado</td>        <td>\( var31 )</td>        <td>\( var32 )</td>        <td>\( var33 )</td>        </tr>        </table>        <br>        <table border style='width:100%;border-collapse:collapse'>        <tr style='background-color:#aba2a2;'>        <td colspan='6'><b>4.3 SISTEMA ESTRUCTURAL</b></td>        </tr>        <tr>        <td>Estr. Predominante</td>        <td>\( var37 )</td>        <td>Tipo</td>        <td>\( var38 )</td>        <td>Detalle</td>        <td>\( var39 )</td>        </tr>        <tr>        <td colspan='6'><b>Comentarios</b></td>        </tr>        <tr>        <td colspan='6'>\( var40 )</td>    </tr>        </table>        <br>        <table border style='width:100%;border-collapse:collapse'>        <tr style='background-color:#aba2a2'>       <td colspan='4'> <b>4.4 INSPECCIÓN 1</b></td>        </tr>        <tr>        <td>Elemento</b></td>        <td>A</td>        <td>B</td>        <td>C</td>        </tr>\( ListadoInspeccion )</table>        <br>        <table border style='width:100%;border-collapse:collapse'>        <tr style='background-color:#aba2a2;'>        <td colspan='7'><b>4.3 INSPECCION 2</b></td>        </tr>        <tr>        <td>Elementos</td>        <td>Ninguno (I)</td>        <td>Leve (II)</td>        <td>Moderado (III)</td>    <td>Fuerte (IV)</td>        <td>Severo (V)</td>        <td>Total</td>        </tr>\( ListadoInspeccion2 )</table>        <br>        <table border style='width:100%;border-collapse:collapse'>        <tr style='background-color:#aba2a2;'>        <td colspan='4'><b>4.4 INSPECCIÓN 3</b></td>        </tr>        <tr>        <td>Elemento</td>        <td>A</td>        <td>B</td>        <td>C</td>        </tr> \( ListadoInspeccion3 )</table>        <br>        <table border width='100%' style='margin-top:30px;border-collapse:collapse'>        <tr style='background-color:#aba2a2;'>        <td colspan='4'><b>5 INFORMACIÓN DEL EVALUADOR</b></td>        </tr>        <tr>        <td>Nombre</td>        <td>\( var41 )</td>        <td>Profesión</td>        <td>\( var44 )</td>        </tr>        <tr>        <td>Apellido Paterno</td>        <td>\( var42 )</td>        <td>Institución</td>        <td>\( var45 )</td>        </tr>        <tr>        <td>Apellido Materno</td>        <td>\( var43 )</td>        <td>Email</td>        <td>\( var46 )</td>    </tr>        </table>        <p style='page-break-before: always;'>&nbsp;</p>        <table border width='100%' style='margin-top:30px;border-collapse:collapse'>        <tr style='background-color:#aba2a2;'>        <td colspan='4'><b>6. FOTOS</b></td>        </tr>        <tr>        <td colspan='4' style='text-align:center'><img width='300px' height='200px' src='t.jpg'></td>        </tr>        <tr>        <td colspan='4' style='text-align:center'><img width='300px' height='200px' src='t2.jpg'></td>        </tr>        </table>        <div>        </center>        </body>        </html>"
        let fmt = UIMarkupTextPrintFormatter(markupText: html)
        
        // 2. Assign print formatter to UIPrintPageRenderer
        let render = UIPrintPageRenderer()
        render.addPrintFormatter(fmt, startingAtPageAt: 0)
        
        // 3. Assign paperRect and printableRect
        let page = CGRect(x: 0, y: 0, width: 595.2, height: 841.8) // A4, 72 dpi
        render.setValue(page, forKey: "paperRect")
        render.setValue(page, forKey: "printableRect")
        
        // 4. Create PDF context and draw
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, .zero, nil)
        
        for i in 0..<render.numberOfPages {
            UIGraphicsBeginPDFPage();
            render.drawPage(at: i, in: UIGraphicsGetPDFContextBounds())
        }
        
        UIGraphicsEndPDFContext();
        
        // 5. Save PDF file
        guard let outputURL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("FichaInspeccion").appendingPathExtension("pdf")
            else { fatalError("Destination URL not created") }
        
        
        
        pdfData.write(to: outputURL, atomically: true)
        print("open \(outputURL.path)") // command to open the generated file
        RutaPDF = outputURL.path
        CircularSpinner.hide()
        
        
        //Enviar email
        
        //let mailComposeViewController2 = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } 
    }

    func convertImageAtPathToBase64String(fileName: String) -> String {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsURL = paths[0]
        let imageFileURL = documentsURL.appendingPathComponent(fileName)
        if let imageData = NSData(contentsOf: imageFileURL as URL)  {
            let strBase64:String = imageData.base64EncodedString(options: .lineLength64Characters)
            print(strBase64)
            return "data:image/gif;base64,\(strBase64)"
        }
        return ""
    }
    
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --
        let pdfFileName = RutaPDF
        let fileData = NSData(contentsOfFile: pdfFileName)
        mailComposerVC.addAttachmentData(fileData as! Data, mimeType: "application/pdf", fileName: "FichaInspeccion")
        mailComposerVC.setToRecipients([email])
        mailComposerVC.setSubject("Ficha de inspección ")
        mailComposerVC.setMessageBody("Por medio del presente se anexa la ficha de inspección", isHTML: false)
        return mailComposerVC
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result.rawValue {
        case MFMailComposeResult.cancelled.rawValue :
            print("Cancelled")
        case MFMailComposeResult.failed.rawValue :
            print("Failed")
        case MFMailComposeResult.saved.rawValue :
            print("Saved")
        case MFMailComposeResult.sent.rawValue :
            print("Sent")
 
        default: break

        }

        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
    func GuardarSIEMOP(tag: Int){
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        let managedContext =
            appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Ficha")
        fetchRequest.predicate = NSPredicate(format: "idficha = %@", MatrizFichas[tag][2] )
        do {
            idFichaConsultada = try managedContext.fetch(fetchRequest)
            for registro in idFichaConsultada {
                idFicha = (registro.value(forKeyPath: "idficha") as? String)!
                NombreFicha = (registro.value(forKeyPath: "folio") as? String)!
            }

        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        CircularSpinner.show("Enviando información...", animated: true, type: .indeterminate)

        var Colapso = "0"

        let var1 = ((idFichaConsultada.first?.value(forKeyPath: "identificacion15") as? String == "No disponible") ? "0" : "1") // ACCESIBILIDAD
        if (var1.isEmpty){
            show(message: "Accesibilidad")
            return
        }
        let var2 = ((idFichaConsultada.first?.value(forKeyPath: "evalucacion54") as? String == "Acordonar") ? "1" : "0" ) // ACORDONAR
        if (var2.isEmpty){
            show(message: "Acordonar")
            return
        }
        let var3 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion10") as? String) ?? "" // AGPOTABLE
        let var4 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion19") as? String) ?? "" //</max:AGUASLLUVIA>
        let var5 = ( idFichaConsultada.first?.value(forKeyPath: "evalucacion13") as? String ) ?? ""  //</max:ALCANT
        let var6 = ((idFichaConsultada.first?.value(forKeyPath: "evalucacion54") as? String == "Alzaprimar") ? "1" : "0" ) //</max:ALZAPRIMAR>
        if (var6.isEmpty){
            show(message: "Recomendaciones")
            return
        }
        let var7 = ( (idFichaConsultada.first?.value(forKeyPath: "evalucacion54") as? String == "Apuntalar") ? "1" : "0" )  //</max:APUNTALAR>
        if (var7.isEmpty){
            show(message: "Recomendaciones")
            return
        }
        let var8 = ( idFichaConsultada.first?.value(forKeyPath: "evalucacion28") as? String ) ?? ""  //</max:ASCENSORES>
        let var9 = (idFichaConsultada.first?.value(forKeyPath: "informe3") as? String) ?? ""  //</max:CATEGORIAMOP>
        if (var9.isEmpty){
            show(message: "Nivel de gravedad")
            return
        }
        let var10 = ( idFichaConsultada.first?.value(forKeyPath: "fecha") as? String ) ?? "" //</max:CHANGEDATE>
        if (var10.isEmpty){
            show(message: "Fecha")
            return
        }
        let var11 = ( idFichaConsultada.first?.value(forKeyPath: "evalucacion22") as? String ) ?? ""  //</max:CLIMATIZACION>
        let var12 = ( idFichaConsultada.first?.value(forKeyPath: "identificacion5") as? String ) ?? ""  //</max:COMPETENCIA>
        if (var12.isEmpty){
            show(message: "Competencia")
            return
        }
        let var13 =  ( (idFichaConsultada.first?.value(forKeyPath: "evalucacion54") as? String == "Corte de suministro(Gas, Electrico, Agua)") ? "1" : "0" )  //<max:CORTESUM>
        if (var13.isEmpty){
            show(message: "Recomendaciones")
            return
        }
        let var14 = ( idFichaConsultada.first?.value(forKeyPath: "informe4") as? String ) ?? ""  //</max:DESCRIPTION>
        if (var14.isEmpty){
            show(message: "Descripción corta")
            return
        }
        let var15 = ( idFichaConsultada.first?.value(forKeyPath: "informe5") as? String ) ?? ""  //</max:DESCRIPTION_LONGDESCRIPTION>
        if (var15.isEmpty){
            show(message: "Descripción larga")
            return
        }
        let var16 =  ( (idFichaConsultada.first?.value(forKeyPath: "evalucacion54") as? String == "Destapar tuberias Alcantarillado y Limpieza") ? "1" : "0" ) //<max:DESTTUBE>
        if (var16.isEmpty){
            show(message: "Tuberias y alcantarillado")
            return
        }
        let var17 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion16") as? String ) ?? ""  //</max:ELECTRIC>
        let var18 = ( idFichaConsultada.first?.value(forKeyPath: "fecha") as? String ) ?? ""  //</max:FECHARE>
        if (var18.isEmpty){
            show(message: "Fecha")
            return
        }
        let var19 = ( idFichaConsultada.first?.value(forKeyPath: "evalucacion25") as? String)  ?? "" //</max:GAS>
        let var20 = ( idFichaConsultada.first?.value(forKeyPath: "identificacion13") as? String ) ?? ""  //</max:PLUSSADDRESSLINE2>
        if (var20.isEmpty){
            show(message: "Dirección del establecimiento")
            return
        }
        let var21 = ( idFichaConsultada.first?.value(forKeyPath: "identificacion14") as? String ) ?? ""  //</max:PLUSSADDRESSLINE3>
        if (var21.isEmpty){
            show(message: "Dirección del establecimiento")
            return
        }
        let var22 = ( idFichaConsultada.first?.value(forKeyPath: "latitud") as? String ) ?? ""  //</max:PLUSSLATITUDE>
        if (var22.isEmpty){
            show(message: "Latitud")
            return
        }
        let var23 = ( idFichaConsultada.first?.value(forKeyPath: "longitud") as? String ) ?? ""  //</max:PLUSSLONGITUDE>
        if (var23.isEmpty){
            show(message: "Longitud")
            return
        }
        let var24 = ( idFichaConsultada.first?.value(forKeyPath: "identificacion12") as? String ) ?? ""  //</max:PLUSSSTREETADDRESS>
        if (var24.isEmpty){
            show(message: "Dirección")
            return
        }
        let var25 = ( (idFichaConsultada.first?.value(forKeyPath: "evalucacion54") as? String == "Protección de Fachade de Lluvia") ? "1" : "0" ) //</max:PROTECCION>
        if (var25.isEmpty){
            show(message: "Recomendaciones")
            return
        }
        let var26 = ( (idFichaConsultada.first?.value(forKeyPath: "evalucacion54") as? String == "Remoción de barro en superficie") ? "1" : "0" ) //</max:REMBARRO>
        if (var26.isEmpty){
            show(message: "Recomendaciones")
            return
        }
        let var27 = ( (idFichaConsultada.first?.value(forKeyPath: "evalucacion54") as? String == "Remoción de ceniza volcanica") ? "1" : "0" ) //</max:REMCENIZA>
        if (var27.isEmpty){
            show(message: "Recomendaciones")
            return
        }
        let var28 = ( (idFichaConsultada.first?.value(forKeyPath: "evalucacion54") as? String == "Remover Objetos Peligrosos") ? "1" : "0" ) //</max:REMOVER>
        if (var28.isEmpty){
            show(message: "Recomendaciones")
            return
        }
        let var29 = ( idFichaConsultada.first?.value(forKeyPath: "fecha") as? String ) ?? ""  //</max:REPORTDATE>
        if (var29.isEmpty){
            show(message: "Fecha")
            return
        }
        let var30 =  ( idFichaConsultada.first?.value(forKeyPath: "identificacion8") as? String ) ?? ""  //</max:REPORTEDPHONE>
        if (var30.isEmpty){
            show(message: "Telefono")
            return
        }
        let var31 = ( idFichaConsultada.first?.value(forKeyPath: "fecha") as? String ) ?? ""  //</max:STATUSDATE>
        if (var31.isEmpty){
            show(message: "Fecha")
            return
        }
        
        if (var1.isEmpty) || (var2.isEmpty) /*|| (var3.isEmpty) || (var4.isEmpty) || (var5.isEmpty)*/ || (var6.isEmpty) || (var7.isEmpty) || /*(var8.isEmpty) ||*/ (var9.isEmpty) || (var10.isEmpty) /*|| (var11.isEmpty)*/ || (var12.isEmpty) || (var13.isEmpty) || (var14.isEmpty) || (var15.isEmpty) || (var16.isEmpty) /*|| (var17.isEmpty)*/ || (var18.isEmpty) || /*(var19.isEmpty) ||*/ (var20.isEmpty) || (var21.isEmpty) || (var22.isEmpty) || (var23.isEmpty) || (var24.isEmpty) || (var25.isEmpty) || (var26.isEmpty) || (var27.isEmpty) || (var28.isEmpty) || (var29.isEmpty) || (var30.isEmpty) || (var31.isEmpty)
            {
                CircularSpinner.hide()
                let alert2 = UIAlertController(title: "Informe", message: "Para poder enviar la ficha debe de llenarla en su totalidad", preferredStyle: UIAlertControllerStyle.alert)
                alert2.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default,  handler: { action in
                    
                }))
                self.present(alert2, animated: true, completion: nil)
        } else {
            let XML = "<?xml version=\"1.0\" encoding=\"UTF-8\"?> <soapenv:Envelope xmlns:soapenv=\"http://www.w3.org/2003/05/soap-envelope\" xmlns:max=\"http://www.ibm.com/maximo\"> <soapenv:Header/> <soapenv:Body> -<max:SyncMOP_SR_EMERGENCIA> <max:MOP_SR_EMERGENCIASet> <max:SR action=\"Add\"> <max:ACCESIBILIDAD>\(var1)</max:ACCESIBILIDAD> <max:ACORDONAR>\(var2)</max:ACORDONAR> <max:AFFECTEDEMAIL>marco.jorquera@daynetchile.com</max:AFFECTEDEMAIL> <max:AFFECTEDPHONE>932732476</max:AFFECTEDPHONE><max:AGPOTABLE>\(var3)</max:AGPOTABLE> <max:AGUASLLUVIA>\(var4)</max:AGUASLLUVIA> <max:ALCANT>\(var5)</max:ALCANT><max:ALZAPRIMAR>\(var6)</max:ALZAPRIMAR><max:APUNTALAR>\(var7)</max:APUNTALAR> <max:ASCENSORES>\(var8)</max:ASCENSORES> <max:ASSETSITEID>DARQ</max:ASSETSITEID><max:CATEGORIAMOP>\(var9)</max:CATEGORIAMOP><max:CHANGEBY>rafael.novoa</max:CHANGEBY><max:CHANGEDATE>\(var10)</max:CHANGEDATE><max:CLASS maxvalue=\"?\">SR</max:CLASS><max:CLIMATIZACION>\(var11)</max:CLIMATIZACION><max:COLAPSOTOTPAR>False</max:COLAPSOTOTPAR> <max:COMPETENCIA>\(var12)</max:COMPETENCIA><max:CORTESUM>\(var13)</max:CORTESUM> <max:DESCRIPTION>\(var14)</max:DESCRIPTION><max:DESCRIPTION_LONGDESCRIPTION>\(var15)</max:DESCRIPTION_LONGDESCRIPTION><max:DESTTUBE>\(var16)</max:DESTTUBE><max:ELECTRIC>\(var17)</max:ELECTRIC><max:EVENTO>Terremoto</max:EVENTO><max:FECHARE>\(var18)</max:FECHARE><max:GAS>\(var19)</max:GAS><max:LIMPCUB>0</max:LIMPCUB><max:PLUSSADDRESSLINE2>\(var20)</max:PLUSSADDRESSLINE2><max:PLUSSADDRESSLINE3>\(var21)</max:PLUSSADDRESSLINE3><max:PLUSSCITY>Santiago</max:PLUSSCITY><max:PLUSSCOUNTRY>CL</max:PLUSSCOUNTRY><max:PLUSSCOUNTY>130101</max:PLUSSCOUNTY><max:PLUSSLATITUDE>\(var22)</max:PLUSSLATITUDE><max:PLUSSLONGITUDE>\(var23)</max:PLUSSLONGITUDE><max:PLUSSREGIONDISTRICT>13</max:PLUSSREGIONDISTRICT> <max:FECHARE>\(var18)</max:FECHARE><max:PLUSSSTATEPROVINCE>1301</max:PLUSSSTATEPROVINCE><max:PLUSSSTREETADDRESS>\(var24)</max:PLUSSSTREETADDRESS><max:PROTECCION>\(var25)</max:PROTECCION><max:REMBARRO>\(var26)</max:REMBARRO><max:REMCENIZA>\(var27)</max:REMCENIZA><max:REMOVER>\(var28)</max:REMOVER><max:REPORTDATE>\(var29)</max:REPORTDATE><max:REPORTEDBY>rafael.novoa</max:REPORTEDBY><max:AFFECTEDPERSON>rafael.novoa</max:AFFECTEDPERSON><max:REPORTEDPHONE>\(var30)</max:REPORTEDPHONE><max:STATUS maxvalue=\"?\">NUEVO</max:STATUS><max:STATUSDATE>\(var31)</max:STATUSDATE><max:OTRO>1</max:OTRO><max:PROBLEMCODE_LONGDESCRIPTION>Se recomienda alzaprimar inmueble</max:PROBLEMCODE_LONGDESCRIPTION> </max:SR></max:MOP_SR_EMERGENCIASet></max:SyncMOP_SR_EMERGENCIA></soapenv:Body></soapenv:Envelope>"
            let parametros = ["text":  XML ]
            let urlString = ipServidorReomoto
            let headersMOP = [
                "Content-Type": "application/soap+xml;charset=UTF-8;action=urn:processDocument",
                "Authorization" : "Basic bWF4aW1vLmpyYzptYXhpbW8yMDE1"
            ]
            let url = URL(string:urlString)
            var xmlRequest = URLRequest(url: url!)
            xmlRequest.httpBody = XML.data(using: String.Encoding.utf8, allowLossyConversion: true)
            xmlRequest.httpMethod = "POST"
            xmlRequest.addValue("application/soap+xml;charset=UTF-8;action=urn:processDocument", forHTTPHeaderField: "Content-Type")
            xmlRequest.addValue("Basic bWF4aW1vLmpyYzptYXhpbW8yMDE1", forHTTPHeaderField: "Authorization")
            
            Alamofire.request(xmlRequest)
                .responseData { (response) in
                    CircularSpinner.hide()
                    let stringResponse: String = String(data: response.data!, encoding: String.Encoding.utf8) as String!
                    debugPrint(stringResponse)
            }
        }

    }
    
    func show(message:String){
        CircularSpinner.hide()
        let alert2 = UIAlertController(title: "Informe", message: "Para poder enviar la ficha debe de llenarla el campo de \(message)", preferredStyle: UIAlertControllerStyle.alert)
        alert2.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default,  handler: { action in
            
        }))
        self.present(alert2, animated: true, completion: nil)
    }
    
    func removeSubview(){
        print("Start remove sibview")
        if let viewWithTag = self.view.viewWithTag(100) {
            viewWithTag.removeFromSuperview()
        }else{
            print("No!")
        }
    }
    
    
}
