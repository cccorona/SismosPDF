//
//  InformePDFView.swift
//  Sismo App_Example
//
//  Created by Cesar Corona Cabrera on 07/05/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import CoreData

class InformePDFView: UIView {
    
    @IBOutlet weak var tblView42HeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var tblView44HeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var tblView45HeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var tblView46HeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var warningView: UIView!
    @IBOutlet weak var informCodeLbl: UILabel!
    @IBOutlet weak var emisionDateLbl: UILabel!
    @IBOutlet weak var tblView1: UITableView!
    @IBOutlet weak var tblView2: UITableView!
    @IBOutlet weak var tblView3: UITableView!
    @IBOutlet weak var tblView4: UITableView!
    @IBOutlet weak var tblView42: UITableView!
    @IBOutlet weak var tblView43: UITableView!
    @IBOutlet weak var tblView44: UITableView!
    @IBOutlet weak var tblView45: UITableView!
    @IBOutlet weak var tblView46: UITableView!
    @IBOutlet weak var tblView5: UITableView!
    @IBOutlet weak var informationTxtView: UITextView!
    @IBOutlet weak var detailView1: UIView!
    @IBOutlet weak var detailView2: UIView!
    @IBOutlet weak var detailView3: UIView!
    @IBOutlet weak var alcanceLbl: UILabel!
    @IBOutlet weak var photo1: UIImageView!
    @IBOutlet weak var photo2: UIImageView!
    @IBOutlet weak var photo3: UIImageView!
    @IBOutlet weak var page1: UIView!
    @IBOutlet weak var page2: UIView!
    @IBOutlet weak var page3: UIView!
    @IBOutlet weak var page4: UIView!
    
    @IBOutlet weak var buildStateLetterLbl: UILabel!
    @IBOutlet weak var buildStateDescriptionLbl: UILabel!
    
    @IBOutlet weak var titleFirstSectionLbl: UILabel!
    @IBOutlet weak var titleSecondSectionLbl: UILabel!
    @IBOutlet weak var titleThirdSectionLbl: UILabel!
    
    @IBOutlet weak var messageInfoTxtView: UITextView!
    
    @IBOutlet weak var photosTblView: UITableView!
    var currentInformation: NSDictionary!
    var inspeccion44: [NSDictionary]!
    var inspeccion45: [NSDictionary]!
    var inspeccion46: [NSDictionary]!
    var imagesArr: [NSDictionary]!
    var numCellsTbl42 = 1
    
    var matrizSelected: [String] = [""]
    
    func fillInformationWithDetail(){
//        informationTxtView.layer.borderColor = UIColor.black.cgColor
//        informationTxtView.layer.borderWidth = 1
        warningView.layer.borderColor = UIColor.black.cgColor
        warningView.layer.borderWidth = 1
        detailView1.layer.borderColor = UIColor.black.cgColor
        detailView1.layer.borderWidth = 1
        detailView2.layer.borderColor = UIColor.black.cgColor
        detailView2.layer.borderWidth = 1
        detailView3.layer.borderColor = UIColor.black.cgColor
        detailView3.layer.borderWidth = 1
        
        prepareTableViews()
        checkCoreData()
    }
    
    func prepareTableViews(){
        tblView1.dataSource = self
        tblView1.delegate = self
        tblView1.estimatedRowHeight = 30.0
        tblView1.rowHeight = UITableViewAutomaticDimension
        tblView1.register(UINib(nibName: "OneSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "OneSpaceTblViewCell")
        tblView1.register(UINib(nibName: "ThreeTblViewCell", bundle: nil), forCellReuseIdentifier: "ThreeTblViewCell")
        tblView1.register(UINib(nibName: "FourSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "FourSpaceTblViewCell")
        tblView1.register(UINib(nibName: "SixSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "SixSpaceTblViewCell")
        tblView1.register(UINib(nibName: "SevenSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "SevenSpaceTblViewCell")
        
        tblView2.dataSource = self
        tblView2.delegate = self
        tblView2.estimatedRowHeight = 30.0
        tblView2.rowHeight = UITableViewAutomaticDimension
        tblView2.register(UINib(nibName: "OneSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "OneSpaceTblViewCell")
        tblView2.register(UINib(nibName: "ThreeTblViewCell", bundle: nil), forCellReuseIdentifier: "ThreeTblViewCell")
        tblView2.register(UINib(nibName: "FourSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "FourSpaceTblViewCell")
        tblView2.register(UINib(nibName: "SixSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "SixSpaceTblViewCell")
        tblView2.register(UINib(nibName: "SevenSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "SevenSpaceTblViewCell")
        
        tblView3.dataSource = self
        tblView3.delegate = self
        tblView3.estimatedRowHeight = 30.0
        tblView3.rowHeight = UITableViewAutomaticDimension
        tblView3.register(UINib(nibName: "OneSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "OneSpaceTblViewCell")
        tblView3.register(UINib(nibName: "ThreeTblViewCell", bundle: nil), forCellReuseIdentifier: "ThreeTblViewCell")
        tblView3.register(UINib(nibName: "FourSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "FourSpaceTblViewCell")
        tblView3.register(UINib(nibName: "SixSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "SixSpaceTblViewCell")
        tblView3.register(UINib(nibName: "SevenSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "SevenSpaceTblViewCell")
        
        tblView4.dataSource = self
        tblView4.delegate = self
        tblView4.estimatedRowHeight = 30.0
        tblView4.rowHeight = UITableViewAutomaticDimension
        tblView4.register(UINib(nibName: "OneSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "OneSpaceTblViewCell")
        tblView4.register(UINib(nibName: "ThreeTblViewCell", bundle: nil), forCellReuseIdentifier: "ThreeTblViewCell")
        tblView4.register(UINib(nibName: "FourSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "FourSpaceTblViewCell")
        tblView4.register(UINib(nibName: "SixSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "SixSpaceTblViewCell")
        tblView4.register(UINib(nibName: "SevenSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "SevenSpaceTblViewCell")
        
        tblView42.dataSource = self
        tblView42.delegate = self
        tblView42.estimatedRowHeight = 30.0
        tblView42.rowHeight = UITableViewAutomaticDimension
        tblView42.register(UINib(nibName: "OneSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "OneSpaceTblViewCell")
        tblView42.register(UINib(nibName: "ThreeTblViewCell", bundle: nil), forCellReuseIdentifier: "ThreeTblViewCell")
        tblView42.register(UINib(nibName: "FourSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "FourSpaceTblViewCell")
        tblView42.register(UINib(nibName: "SixSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "SixSpaceTblViewCell")
        tblView42.register(UINib(nibName: "SevenSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "SevenSpaceTblViewCell")
        
        tblView43.dataSource = self
        tblView43.delegate = self
        tblView43.estimatedRowHeight = 30.0
        tblView43.rowHeight = UITableViewAutomaticDimension
        tblView43.register(UINib(nibName: "OneSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "OneSpaceTblViewCell")
        tblView43.register(UINib(nibName: "ThreeTblViewCell", bundle: nil), forCellReuseIdentifier: "ThreeTblViewCell")
        tblView43.register(UINib(nibName: "FourSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "FourSpaceTblViewCell")
        tblView43.register(UINib(nibName: "SixSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "SixSpaceTblViewCell")
        tblView43.register(UINib(nibName: "SevenSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "SevenSpaceTblViewCell")
        
        tblView44.dataSource = self
        tblView44.delegate = self
        tblView44.estimatedRowHeight = 30.0
        tblView44.rowHeight = UITableViewAutomaticDimension
        tblView44.register(UINib(nibName: "OneSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "OneSpaceTblViewCell")
        tblView44.register(UINib(nibName: "ThreeTblViewCell", bundle: nil), forCellReuseIdentifier: "ThreeTblViewCell")
        tblView44.register(UINib(nibName: "FourSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "FourSpaceTblViewCell")
        tblView44.register(UINib(nibName: "SixSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "SixSpaceTblViewCell")
        tblView44.register(UINib(nibName: "SevenSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "SevenSpaceTblViewCell")
        
        tblView45.dataSource = self
        tblView45.delegate = self
        tblView45.estimatedRowHeight = 30.0
        tblView45.rowHeight = UITableViewAutomaticDimension
        tblView45.register(UINib(nibName: "OneSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "OneSpaceTblViewCell")
        tblView45.register(UINib(nibName: "ThreeTblViewCell", bundle: nil), forCellReuseIdentifier: "ThreeTblViewCell")
        tblView45.register(UINib(nibName: "FourSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "FourSpaceTblViewCell")
        tblView45.register(UINib(nibName: "SixSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "SixSpaceTblViewCell")
        tblView45.register(UINib(nibName: "SevenSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "SevenSpaceTblViewCell")
        
        tblView46.dataSource = self
        tblView46.delegate = self
//        tblView46.estimatedRowHeight = 30.0
//        tblView46.rowHeight = UITableViewAutomaticDimension
        tblView46.register(UINib(nibName: "OneSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "OneSpaceTblViewCell")
        tblView46.register(UINib(nibName: "ThreeTblViewCell", bundle: nil), forCellReuseIdentifier: "ThreeTblViewCell")
        tblView46.register(UINib(nibName: "FourSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "FourSpaceTblViewCell")
        tblView46.register(UINib(nibName: "SixSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "SixSpaceTblViewCell")
        tblView46.register(UINib(nibName: "SevenSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "SevenSpaceTblViewCell")
        
        tblView5.dataSource = self
        tblView5.delegate = self
        tblView5.estimatedRowHeight = 30.0
        tblView5.rowHeight = UITableViewAutomaticDimension
        tblView5.register(UINib(nibName: "OneSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "OneSpaceTblViewCell")
        tblView5.register(UINib(nibName: "ThreeTblViewCell", bundle: nil), forCellReuseIdentifier: "ThreeTblViewCell")
        tblView5.register(UINib(nibName: "FourSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "FourSpaceTblViewCell")
        tblView5.register(UINib(nibName: "SixSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "SixSpaceTblViewCell")
        tblView5.register(UINib(nibName: "SevenSpaceTblViewCell", bundle: nil), forCellReuseIdentifier: "SevenSpaceTblViewCell")
        
//        photosTblView.dataSource = self
//        photosTblView.delegate = self
//        photosTblView.estimatedRowHeight = 30.0
//        photosTblView.rowHeight = UITableViewAutomaticDimension
//        photosTblView.register(UINib(nibName: "PhotoTableViewCell", bundle: nil), forCellReuseIdentifier: "PhotoTableViewCell")
    }
    
    func checkCoreData(){
        
        let appDelegate = UIApplication .shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest < NSManagedObject > (entityName: "Ficha" )
        
        if matrizSelected.count > 2{
            idFicha = matrizSelected[2]
        }
        
        fetchRequest.predicate = NSPredicate(format: "idficha = %@", idFicha )
        do {
            if let fetchResults = try managedContext.fetch(fetchRequest) as? [NSManagedObject] {
                //appDel.managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [NSManagedObject] {
                if fetchResults.count != 0{
                    let managedObject = fetchResults[0]
                    let key = Array(managedObject.entity.attributesByName.keys)
                    currentInformation = managedObject.dictionaryWithValues(forKeys: key) as NSDictionary
                    print("General information")
                    print(managedObject.description)
                }
            }
            
        } catch  let error as  NSError {
            print ( "No se pudo recuperar. " )
            print (error)
        }
        
        
        
        
        let fetchRequest1 = NSFetchRequest<NSManagedObject>(entityName: "Insp1")
        fetchRequest1.predicate = NSPredicate(format: "idficha = %@", idFicha )
        do {
            if let fetchResults = try managedContext.fetch(fetchRequest1) as? [NSManagedObject] {
                inspeccion44 = [NSDictionary]()
                for managedObject in fetchResults{
                    let key = Array(managedObject.entity.attributesByName.keys)
                    inspeccion44.append(managedObject.dictionaryWithValues(forKeys: key) as NSDictionary)
                }
                print("inspeccion 44")
                print(inspeccion44)
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        
        let fetchRequest2 = NSFetchRequest<NSManagedObject>(entityName: "Insp2")
        fetchRequest2.predicate = NSPredicate(format: "idficha = %@", idFicha )
        do {
            if let fetchResults = try managedContext.fetch(fetchRequest2) as? [NSManagedObject] {
                inspeccion45 = [NSDictionary]()
                for managedObject in fetchResults{
                    let key = Array(managedObject.entity.attributesByName.keys)
                    inspeccion45.append(managedObject.dictionaryWithValues(forKeys: key) as NSDictionary)
                }
                print("inspeccion 45")
                print(inspeccion45)
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        var statusEvaluation = 0
        let fetchRequest3 = NSFetchRequest<NSManagedObject>(entityName: "Insp3")
        fetchRequest2.predicate = NSPredicate(format: "idficha = %@", idFicha )
        let OrdenEstado = NSSortDescriptor(key: "num_letra", ascending: true)
        fetchRequest.sortDescriptors = [OrdenEstado]
        do {
            if let fetchResults = try managedContext.fetch(fetchRequest3) as? [NSManagedObject] {
                inspeccion46 = [NSDictionary]()
                for managedObject in fetchResults{
                    let key = Array(managedObject.entity.attributesByName.keys)
                    inspeccion46.append(managedObject.dictionaryWithValues(forKeys: key) as NSDictionary)
                }
                var filerInspeccion = [NSDictionary]()
                for inspeccion in inspeccion46{
                    var add = true
                    for newInspeccion in filerInspeccion{
                        if (inspeccion.value(forKey: "elemento") as! String) == (newInspeccion.value(forKey: "elemento") as! String){
                            add = false
                        }
                    }
                    if add{
                        filerInspeccion.append(inspeccion)
                    }
                }
                inspeccion46 = filerInspeccion
                for dic in inspeccion46{
                    let respuesta = dic.value(forKey: "num_resp") as! Int
                    if respuesta > statusEvaluation{
                        statusEvaluation = respuesta
                    }
                }
                print("inspeccion 46")
                print(inspeccion46)
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        imagesArr = [NSDictionary]()
        
//        let fetchRequestImg = NSFetchRequest < NSManagedObject > (entityName: "ImagesToSismos" )
//        fetchRequestImg.predicate = NSPredicate(format: "idficha = %@", idFicha )
//        do {
//            if let fetchResults = try managedContext.fetch(fetchRequestImg) as? [NSManagedObject] {
//                imagesArr = [NSDictionary]()
//                for managedObject in fetchResults{
//                    let key = Array(managedObject.entity.attributesByName.keys)
//                    imagesArr.append(managedObject.dictionaryWithValues(forKeys: key) as NSDictionary)
//                }
//                print("Imagenes")
//                print(imagesArr)
//            }
//        } catch  let error as  NSError {
//            print ( "No se pudo recuperar. " )
//            print (error)
//        }
        
        tblView44HeightConstraint.constant = CGFloat((inspeccion44.count+2)*50)
        tblView45HeightConstraint.constant = CGFloat((inspeccion45.count+2)*30)
        tblView46HeightConstraint.constant = CGFloat((inspeccion46.count+1)*60)
        self.layoutIfNeeded()
        
        
        setValues(statusEvaluation)
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func setValues(_ statusEvaluation:Int){
        if matrizSelected.count > 0{
            informCodeLbl.text = matrizSelected[0]
        }
        if matrizSelected.count > 2{
            let isoDate = matrizSelected[2]
            let dateArr = isoDate.split(separator: "T")
            emisionDateLbl.text = "FECHA EMISIÓN \(dateArr.first!)"
        }
        buildStateLetterLbl.layer.cornerRadius = buildStateLetterLbl.frame.width/2
        buildStateLetterLbl.clipsToBounds = true
        let inspectionStatus = currentInformation.value(forKey: "evalucacion8") ?? ""
        if ("\(inspectionStatus)" == "Inseguro") {
            buildStateLetterLbl.text = "C"
            buildStateLetterLbl.backgroundColor = .red
            buildStateDescriptionLbl.text = "Inseguro"
        } else if ("\(inspectionStatus)" == "Ingreso Limitado") {
            buildStateLetterLbl.text = "B"
            buildStateLetterLbl.backgroundColor = .yellow
            buildStateDescriptionLbl.text = "Ingreso Limitado"
        } else if ("\(inspectionStatus)" == "Inspeccionado") {
            buildStateLetterLbl.text = "A"
            buildStateLetterLbl.backgroundColor = .green
            buildStateDescriptionLbl.text = "Inspeccionado"
        } else{
            if (statusEvaluation == 3) {
                buildStateLetterLbl.text = "C"
                buildStateLetterLbl.backgroundColor = .red
                buildStateDescriptionLbl.text = "Inseguro"
            } else if (statusEvaluation == 2) {
                buildStateLetterLbl.text = "B"
                buildStateLetterLbl.backgroundColor = .yellow
                buildStateDescriptionLbl.text = "Ingreso Limitado"
            } else {
                buildStateLetterLbl.text = "A"
                buildStateLetterLbl.backgroundColor = .green
                buildStateDescriptionLbl.text = "Inspeccionado"
            }
        }
        
        
        let textRange = NSMakeRange(0, (titleFirstSectionLbl.text?.count)!)
        let attributedText = NSMutableAttributedString(string: titleFirstSectionLbl.text!)
        attributedText.addAttribute(NSUnderlineStyleAttributeName , value: NSUnderlineStyle.styleSingle.rawValue, range: textRange)
        titleFirstSectionLbl.attributedText = attributedText
        
        let textRange2 = NSMakeRange(0, (titleSecondSectionLbl.text?.count)!)
        let attributedText2 = NSMutableAttributedString(string: titleSecondSectionLbl.text!)
        attributedText2.addAttribute(NSUnderlineStyleAttributeName , value: NSUnderlineStyle.styleSingle.rawValue, range: textRange2)
        titleSecondSectionLbl.attributedText = attributedText2
        
        let textRange3 = NSMakeRange(0, (titleThirdSectionLbl.text?.count)!)
        let attributedText3 = NSMutableAttributedString(string: titleThirdSectionLbl.text!)
        attributedText3.addAttribute(NSUnderlineStyleAttributeName , value: NSUnderlineStyle.styleSingle.rawValue, range: textRange3)
        titleThirdSectionLbl.attributedText = attributedText3
  
        
//        let string = messageInfoTxtView.text
//        let attributedString = NSMutableAttributedString(string: string as? String ?? "", attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 15.0)])
//        let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 15.0)]
//
//        attributedString.addAttributes(boldFontAttribute, range: NSRange("Alcance:")!)
//        messageInfoTxtView.attributedText = attributedText
        
        let textRange4 = NSMakeRange(0, (alcanceLbl.text?.count)!)
        let attributedText4 = NSMutableAttributedString(string: alcanceLbl.text!)
        attributedText4.addAttribute(NSUnderlineStyleAttributeName , value: NSUnderlineStyle.styleSingle.rawValue, range: textRange4)
        alcanceLbl.attributedText = attributedText4
        
        
        var a = currentInformation.value(forKeyPath: "foto1") as? NSData
        if !(a == nil) {
            foto1 = a
        }
        a = currentInformation.value(forKeyPath: "foto2") as? NSData
        if !(a == nil) {
            foto2 = a
        }
        a = currentInformation.value(forKeyPath: "foto3") as? NSData
        if !(a == nil) {
            foto3 = a
        }
        
        if !(foto1 == nil) {
            let image = UIImage(data: foto1! as Data)
            photo1.image = image
        }
        if !(foto2 == nil) {
            let image = UIImage(data: foto2! as Data)
            photo2.image = image
        }
        if !(foto3 == nil)  {
            let image = UIImage(data: foto3! as Data)
            photo3.image = image
        }
        
        
    }
    
}

extension InformePDFView: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if tblView1 == tableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FourSpaceTblViewCell", for: indexPath) as! FourSpaceTblViewCell
            
            switch (indexPath.row){
            case 0:
                let var1 = currentInformation.value(forKey: "identificacion3") ?? ""
                let var2 = currentInformation.value(forKey: "identificacion5") ?? ""
                cell.setData("Nombre", data2:  var1 as? String ?? "", data3: "Competencia", data4: var2 as? String ?? "")
                cell.setBold(label: 1)
                cell.setBold(label: 3)
                break;
            case 1:
                let var1 = currentInformation.value(forKey: "identificacion12") ?? ""
                var var2 = currentInformation.value(forKey: "identificacion9") ?? ""
                if ((var2 as? String) ?? "") == "Otro"{
                    var2 = currentInformation.value(forKey: "identificacion10") ?? ""
                }
                cell.setData("Dirección", data2: var1 as? String ?? "", data3: "Pueblo/Ciudad", data4: var2 as? String ?? "")
                cell.setBold(label: 1)
                cell.setBold(label: 3)
                break;
            case 2:
                let var1 = currentInformation.value(forKey: "identificacion2") ?? ""
                let var2 = currentInformation.value(forKey: "identificacion4") ?? ""
                cell.setData("Tipo Establecimiento", data2: var1 as? String ?? "", data3: "Servicio", data4: var2 as? String ?? "")
                cell.setBold(label: 1)
                cell.setBold(label: 3)
                break;
            case 3:
                let var1 = currentInformation.value(forKey: "identificacion6") ?? ""
                let var2 = currentInformation.value(forKey: "identificacion7") ?? ""
                cell.setData("Nombre Responsable", data2: var1 as? String ?? "", data3: "Email", data4: var2 as? String ?? "")
                cell.setBold(label: 1)
                cell.setBold(label: 3)
                break;
            case 4:
                let var1 = currentInformation.value(forKey: "latitud") ?? ""
                let var2 = currentInformation.value(forKey: "longitud") ?? ""
                cell.setData("Latitud", data2: var1 as? String ?? "", data3: "Longitud", data4: var2 as? String ?? "")
                cell.setBold(label: 1)
                cell.setBold(label: 3)
                break;
            default:
                break;
            }
            return cell
        }
        if tblView2 == tableView{
            if indexPath.row == 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: "FourSpaceTblViewCell", for: indexPath) as! FourSpaceTblViewCell
                let var1 = currentInformation.value(forKey: "evalucacion54") ?? ""
                let var2 = currentInformation.value(forKey: "evalucacion56") ?? ""
                cell.setData("Recomendaciones", data2: var1 as? String ?? "", data3: "Estimación visual area", data4: var2 as? String ?? "")
                cell.setBold(label: 1)
                cell.setBold(label: 3)
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "OneSpaceTblViewCell", for: indexPath) as! OneSpaceTblViewCell
                let var1 = currentInformation.value(forKey: "evalucacion55") ?? ""
                let theString = "Detalle Recomendación\n\((var1 as? String ?? ""))" as NSString
                let theAttributedString = NSMutableAttributedString(string: theString as String)
                
                let boldString = "Detalle Recomendación"
                let boldRange = theString.range(of: boldString)
                let font = UIFont.boldSystemFont(ofSize: 20)
                
                theAttributedString.addAttribute(NSFontAttributeName, value: font, range: boldRange)
                cell.value1Lbl.attributedText = theAttributedString
                return cell
            }
        }
        if tblView3 == tableView{
            if indexPath.row == 0{
                let var1 = currentInformation.value(forKey: "evalucacion58") ?? ""
                let var2 = currentInformation.value(forKey: "evalucacion59") ?? ""
                let var3 = currentInformation.value(forKey: "identificacion11") ?? ""
                let cell = tableView.dequeueReusableCell(withIdentifier: "SixSpaceTblViewCell", for: indexPath) as! SixSpaceTblViewCell
                cell.setData("Región", data2: var1 as? String ?? "", data3: "Provincia", data4: var2 as? String ?? "", data5: "Comuna", data6: var3 as? String ?? "")
                cell.setBold(label: 1)
                cell.setBold(label: 3)
                cell.setBold(label: 5)
                return cell
            }
            if indexPath.row == 1{
                let cell = tableView.dequeueReusableCell(withIdentifier: "SixSpaceTblViewCell", for: indexPath) as! SixSpaceTblViewCell
                
                cell.value2Lbl.layer.borderWidth = 0
                cell.value3Lbl.layer.borderWidth = 0
                cell.value5Lbl.layer.borderWidth = 0
                cell.value6Lbl.layer.borderWidth = 0
                
                let var1 = currentInformation.value(forKey: "informe2") ?? ""
                let var2 = currentInformation.value(forKey: "informe3") ?? ""
                cell.setData("Tipo Desastre", data2: var1 as? String ?? "", data3: "", data4: "Nivel de Gravedad", data5: var2 as? String ?? "", data6: "")
                cell.setBold(label: 1)
                cell.setBold(label: 4)
                
                return cell
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: "OneSpaceTblViewCell", for: indexPath) as! OneSpaceTblViewCell
            
            let var1 = currentInformation.value(forKey: "informe5") ?? ""
            let theString = "Descripción de la Emergencia\n\(var1)" as NSString
            let theAttributedString = NSMutableAttributedString(string: theString as String)
            
            let boldString = "Descripción de la Emergencia"
            let boldRange = theString.range(of: boldString)
            let font = UIFont.boldSystemFont(ofSize: 20)
            
            theAttributedString.addAttribute(NSFontAttributeName, value: font, range: boldRange)
            cell.value1Lbl.attributedText = theAttributedString
            return cell
            
        }
        if tblView4 == tableView{
            if indexPath.row == 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: "OneSpaceTblViewCell", for: indexPath) as! OneSpaceTblViewCell
                cell.setData("4.1 General")
                return cell
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: "SixSpaceTblViewCell", for: indexPath) as! SixSpaceTblViewCell
            
            switch (indexPath.row){
            case 1:
                
                let var1 = currentInformation.value(forKey: "evalucacion1") ?? ""
                let var2 = currentInformation.value(forKey: "evalucacion2") ?? ""
                let var3 = currentInformation.value(forKey: "evalucacion3") ?? ""
                cell.setData("N° Edificio", data2: var1 as? String ?? "", data3: "Tipo Edificio", data4: var2 as? String ?? "", data5: "Año Construcción", data6: var3 as? String ?? "")
                cell.setBold(label: 1)
                cell.setBold(label: 3)
                cell.setBold(label: 5)
                break;
            case 2:
                let var1 = currentInformation.value(forKey: "evalucacion4") ?? ""
                let var2 = currentInformation.value(forKey: "evalucacion5") ?? ""
                let var3 = currentInformation.value(forKey: "evalucacion6") ?? ""
                cell.setData("N° Pisos", data2: var1 as? String ?? "", data3: "N° Subterráneos", data4: var2 as? String ?? "", data5: "Sistema de Pareo", data6: var3 as? String ?? "")
                cell.setBold(label: 1)
                cell.setBold(label: 3)
                cell.setBold(label: 5)
                break;
            case 3:
                let var1 = currentInformation.value(forKey: "evalucacion7") ?? ""
                let var2 = currentInformation.value(forKey: "evalucacion53") ?? ""
                cell.setData("Estado Operatividad", data2: var1 as? String ?? "", data3: "Tipo Inspeción", data4: var2 as? String ?? "", data5: "", data6: "")
                cell.setBold(label: 1)
                cell.setBold(label: 3)
                break;
            default:
                break;
            }
            return cell
        }
        if tblView42 == tableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FourSpaceTblViewCell", for: indexPath) as! FourSpaceTblViewCell
            switch (indexPath.row){
            case 0:
                cell.setData("Tipo Instalación", data2: "Factibilidad", data3: "Suministro", data4: "Estado")
                cell.setBold(label: 1)
                cell.setBold(label: 2)
                cell.setBold(label: 3)
                cell.setBold(label: 4)
                break;
            case 1:
                var var1 = currentInformation.value(forKey: "evalucacion10") ?? ""
                var1 = ((var1 as? String) ?? "") == "1" ? "Si" : "No"
                let var2 = currentInformation.value(forKey: "evalucacion11") ?? ""
                let var3 = currentInformation.value(forKey: "evalucacion12") ?? "Normal"
                cell.setData("Agua Potable", data2: var1 as? String ?? "", data3: var2 as? String ?? "", data4: var3 as? String ?? "")
                break;
            case 2:
                var var1 = currentInformation.value(forKey: "evalucacion13") ?? ""
                var1 = ((var1 as? String) ?? "") == "1" ? "Si" : "No"
                let var2 = currentInformation.value(forKey: "evalucacion14") ?? ""
                let var3 = currentInformation.value(forKey: "evalucacion15") ?? "Normal"
                cell.setData("Alcantarillado", data2: var1 as? String ?? "", data3: var2 as? String ?? "", data4: var3 as? String ?? "")
                break;
            case 3:
                var var1 = currentInformation.value(forKey: "evalucacion16") ?? ""
                var1 = ((var1 as? String) ?? "") == "1" ? "Si" : "No"
                let var2 = currentInformation.value(forKey: "evalucacion17") ?? ""
                let var3 = currentInformation.value(forKey: "evalucacion18") ?? "Normal"
                cell.setData("Electricidad", data2: var1 as? String ?? "", data3: var2 as? String ?? "", data4: var3 as? String ?? "")
                break;
            case 4:
                var var1 = currentInformation.value(forKey: "evalucacion19") ?? ""
                var1 = ((var1 as? String) ?? "") == "1" ? "Si" : "No"
                let var2 = currentInformation.value(forKey: "evalucacion20") ?? ""
                let var3 = currentInformation.value(forKey: "evalucacion21") ?? "Normal"
                cell.setData("Agua Lluvia", data2: var1 as? String ?? "", data3: var2 as? String ?? "", data4: var3 as? String ?? "")
                break;
            case 5:
                var var1 = currentInformation.value(forKey: "evalucacion22") ?? ""
                var1 = ((var1 as? String) ?? "") == "1" ? "Si" : "No"
                let var2 = currentInformation.value(forKey: "evalucacion23") ?? ""
                let var3 = currentInformation.value(forKey: "evalucacion24") ?? "Normal"
                cell.setData("Climatización", data2: var1 as? String ?? "", data3: var2 as? String ?? "", data4: var3 as? String ?? "")
                break;
            case 6:
                var var1 = currentInformation.value(forKey: "evalucacion25") ?? ""
                var1 = ((var1 as? String) ?? "") == "1" ? "Si" : "No"
                let var2 = currentInformation.value(forKey: "evalucacion26") ?? ""
                let var3 = currentInformation.value(forKey: "evalucacion27") ?? "Normal"
                cell.setData("Gas", data2: var1 as? String ?? "", data3: var2 as? String ?? "", data4: var3 as? String ?? "")
                break;
            case 7:
                var var1 = currentInformation.value(forKey: "evalucacion28") ?? ""
                var1 = ((var1 as? String) ?? "") == "1" ? "Si" : "No"
                let var2 = currentInformation.value(forKey: "evalucacion29") ?? ""
                let var3 = currentInformation.value(forKey: "evalucacion30") ?? "Normal"
                cell.setData("Asensores", data2: var1 as? String ?? "", data3: var2 as? String ?? "", data4: var3 as? String ?? "")
                break;
            case 8:
                let var1 = currentInformation.value(forKey: "evalucacion32") ?? ""
                var var2 = currentInformation.value(forKey: "evalucacion31") ?? ""
                var2 = ((var2 as? String) ?? "") == "1" ? "Si" : "No"
                let var3 = currentInformation.value(forKey: "evalucacion33") ?? ""
                let var4 = currentInformation.value(forKey: "evalucacion34") ?? "Normal"
                cell.setData(var1 as? String ?? "", data2: var2 as? String ?? "", data3: var3 as? String ?? "", data4: var4 as? String ?? "")
                break;
            default:
                break;
            }
            return cell
        }
        if tblView43 == tableView{
            if indexPath.row == 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: "SixSpaceTblViewCell", for: indexPath) as! SixSpaceTblViewCell
                let var1 = (currentInformation.value(forKey: "evalucacion35") as? String) ?? ""
                var var2 = ""
                var var3 = ""
                var mainSistem = "HORMIGON ARMADO"
                if (var1 == "1") {
                    mainSistem = "HORMIGON ARMADO"
                    var2 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion36") as? String) ?? ""
                } else if (var1 == "2") {
                    mainSistem = "ALBAÑILERIA"
                    var2 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion37") as? String) ?? ""
                    var3 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion38") as? String) ?? ""
                    
                } else if (var1 == "3") {
                    mainSistem = "ACERO"
                    var2 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion39") as? String) ?? ""
                    var3 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion40") as? String) ?? ""
                    
                } else if (var1 == "4") {
                    mainSistem = "MADERA"
                    var2 = (idFichaConsultada.first?.value(forKeyPath: "evalucacion41") as? String) ?? ""
                }
                if var3 == ""{
                    var3 = "No aplica"
                }
                cell.setData("Estr. Predominante", data2: mainSistem, data3: "Tipo", data4: var2, data5: "Detalle", data6: var3)
                cell.setBold(label: 1)
                cell.setBold(label: 3)
                cell.setBold(label: 5)
                return cell
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: "OneSpaceTblViewCell", for: indexPath) as! OneSpaceTblViewCell
            let var1 = currentInformation.value(forKey: "evalucacion42") ?? ""
            let theString = "Comentarios\n\(var1 as? String ?? "")" as NSString
            let theAttributedString = NSMutableAttributedString(string: theString as String)
            
            let boldString = "Comentarios"
            let boldRange = theString.range(of: boldString)
            let font = UIFont.boldSystemFont(ofSize: 20)
            
            theAttributedString.addAttribute(NSFontAttributeName, value: font, range: boldRange)
            cell.value1Lbl.attributedText = theAttributedString
            return cell
        }
        if tblView44 == tableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FourSpaceTblViewCell", for: indexPath) as! FourSpaceTblViewCell
            if indexPath.row == 0{
                cell.setData("Elemento", data2: "A", data3: "B", data4: "C")
                cell.setBold(label: 1)
                cell.setBold(label: 2)
                cell.setBold(label: 3)
                cell.setBold(label: 4)
            }else{
                if indexPath.row == inspeccion44.count+1{
                    var int1 = 0
                    var int2 = 0
                    var int3 = 0
                    for dic in inspeccion44{
                        let respuesta = dic.value(forKey: "num_resp") as! Int
                        if respuesta == 1{
                            int1 = int1 + 1
                        }
                        if respuesta == 2{
                            int2 = int2 + 1
                        }
                        if respuesta == 3{
                            int3 = int3 + 1
                        }
                    }
                    cell.setData("Total", data2: "\(int1)", data3: "\(int2)", data4: "\(int3)")
                }else{
                    let dic = inspeccion44[indexPath.row - 1]
                    let respuesta = dic.value(forKey: "num_resp") as! Int
                    if respuesta == 1{
                        cell.setData(dic.value(forKey: "respuesta") as? String ?? "", data2: dic.value(forKey: "elemento") as? String ?? "", data3: "", data4: "")
                    }
                    if respuesta == 2{
                        cell.setData(dic.value(forKey: "respuesta") as? String ?? "", data2: "", data3: dic.value(forKey: "elemento") as? String ?? "", data4: "")
                    }
                    if respuesta == 3{
                        cell.setData(dic.value(forKey: "respuesta") as? String ?? "", data2: "", data3: "", data4: dic.value(forKey: "elemento") as? String ?? "")
                    }
                }
            }
            return cell
        }
        if tblView45 == tableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "SevenSpaceTblViewCell", for: indexPath) as! SevenSpaceTblViewCell
            if indexPath.row == 0{
                cell.setData("Elementos", data2: "Ninguno(I)", data3: "Leve (II)", data4: "Moderado (III)", data5: "Fuerte (IV)", data6: "Severo (V)", data7: "Total")
                cell.setBold(label: 1)
                cell.setBold(label: 2)
                cell.setBold(label: 3)
                cell.setBold(label: 4)
                cell.setBold(label: 5)
                cell.setBold(label: 6)
                cell.setBold(label: 7)
            }else{
                if indexPath.row == inspeccion45.count+1{
                    var int1 = 0
                    var int2 = 0
                    var int3 = 0
                    var int4 = 0
                    var int5 = 0
                    var intTotal = 0
                    for dic in inspeccion45{
                        int1 = int1 + (dic.value(forKey: "ele1") as! NSString).integerValue
                        int2 = int2 + (dic.value(forKey: "ele2") as! NSString).integerValue
                        int3 = int3 + (dic.value(forKey: "ele3") as! NSString).integerValue
                        int4 = int4 + (dic.value(forKey: "ele4") as! NSString).integerValue
                        int5 = int5 + (dic.value(forKey: "ele5") as! NSString).integerValue
                        intTotal = intTotal + (dic.value(forKey: "total") as! NSString).integerValue
                    }
                    cell.setData("Total", data2: "\(int1)", data3: "\(int2)", data4: "\(int3)", data5: "\(int4)", data6: "\(int5)", data7: "\(intTotal)")
                }else{
                    let dic = inspeccion45[indexPath.row - 1]
                    
                    let ele1 = dic.value(forKey: "ele1") as? String ?? ""
                    let ele2 = dic.value(forKey: "ele2") as? String ?? ""
                    let ele3 = dic.value(forKey: "ele3") as? String ?? ""
                    let ele4 = dic.value(forKey: "ele4") as? String ?? ""
                    let ele5 = dic.value(forKey: "ele5") as? String ?? ""
                    let total = dic.value(forKey: "total") as? String ?? ""
                    cell.setData(dic.value(forKey: "elemento") as? String ?? "", data2: "\(ele1)", data3: "\(ele2)", data4: "\(ele3)", data5: "\(ele4)", data6: "\(ele5)", data7: "\(total)")
                }
            }
            
            return cell
        }
        if tblView46 == tableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FourSpaceTblViewCell", for: indexPath) as! FourSpaceTblViewCell
            if indexPath.row == 0{
                cell.setData("Elemento", data2: "A", data3: "B", data4: "C")
                cell.setBold(label: 1)
                cell.setBold(label: 2)
                cell.setBold(label: 3)
                cell.setBold(label: 4)
            }else{
                if indexPath.row == inspeccion46.count+1{
                    var int1 = 0
                    var int2 = 0
                    var int3 = 0
                    for dic in inspeccion46{
                        let respuesta = dic.value(forKey: "num_resp") as! Int
                        if respuesta == 1{
                            int1 = int1 + 1
                        }
                        if respuesta == 2{
                            int2 = int2 + 1
                        }
                        if respuesta == 3{
                            int3 = int3 + 1
                        }
                    }
                    cell.setData("Total", data2: "\(int1)", data3: "\(int2)", data4: "\(int3)")
                }else{
                    let dic = inspeccion46[indexPath.row - 1]
                    let respuesta = dic.value(forKey: "num_resp") as! Int
                    var respuestaValue = dic.value(forKey: "respuesta") as? String ?? ""
                    if respuestaValue == "Otro(s) Perligro(s)" || respuestaValue == "Bienes muebles 1" || respuestaValue == "Bienes muebles 2" || respuestaValue == "Bienes muebles 3" {
                        respuestaValue = dic.value(forKey: "otros") as? String ?? ""
                    }
                    if respuesta == 1{
                        cell.setData(respuestaValue, data2: dic.value(forKey: "elemento") as? String ?? "", data3: "", data4: "")
                    }
                    if respuesta == 2{
                        cell.setData(respuestaValue, data2: "", data3: dic.value(forKey: "elemento") as? String ?? "", data4: "")
                    }
                    if respuesta == 3{
                        cell.setData(respuestaValue, data2: "", data3: "", data4: dic.value(forKey: "elemento") as? String ?? "")
                    }
                }
            }
            return cell
        }
        if tblView5 == tableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FourSpaceTblViewCell", for: indexPath) as! FourSpaceTblViewCell
            switch (indexPath.row){
            case 0:
                let var1 = dato.value(forKey: "nombrefichains") ?? ""
                let var2 = dato.value(forKey: "profesionfichains") ?? ""
                cell.setData("Nombre", data2: var1 as? String ?? "", data3: "Profesión", data4: var2 as? String ?? "")
                cell.setBold(label: 1)
                cell.setBold(label: 3)
                break;
            case 1:
                let var1 = dato.value(forKey: "AppPatfichains") ?? ""
                let var2 = dato.value(forKey: "institucionfichains") ?? ""
                cell.setData("Apellido Paterno", data2: var1 as? String ?? "", data3: "Institución", data4: var2 as? String ?? "")
                cell.setBold(label: 1)
                cell.setBold(label: 3)
                break;
            case 2:
                let var1 = dato.value(forKey: "AppMatfichains") ?? ""
                let var2 = dato.value(forKey: "emailfichains") ?? ""
                cell.setData("Apellido Materno", data2: var1 as? String ?? "", data3: "Email", data4: var2 as? String ?? "")
                cell.setBold(label: 1)
                cell.setBold(label: 3)
                break;
            default:
                break;
            }
            return cell
        }
        
        if photosTblView == tableView{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoTableViewCell", for: indexPath) as! PhotoTableViewCell
            
            let imageDic = imagesArr[indexPath.row]
            
            let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
            let nsUserDomainMask    = FileManager.SearchPathDomainMask.userDomainMask
            let paths               = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
            
            if let dirPath = paths.first{
                let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent(imageDic.object(forKey: "image") as! String)
                let image = UIImage(contentsOfFile: imageURL.path)
                cell.imageCell.image = image
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tblView1 == tableView{
            return 5
        }
        if tblView2 == tableView{
            return 2
        }
        if tblView3 == tableView{
            return 3
        }
        if tblView4 == tableView{
            return 4
        }
        if tblView42 == tableView{
            return 9
        }
        if tblView43 == tableView{
            return 2
        }
        if tblView44 == tableView{
            return inspeccion44.count+2
        }
        if tblView45 == tableView{
            return inspeccion45.count+2
        }
        if tblView46 == tableView{
            return inspeccion46.count+2
        }
        if tblView5 == tableView{
            return 3
        }
        if photosTblView == tableView{
            return imagesArr.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if photosTblView == tableView{
            return 100
        }
        if tblView42 == tableView{
            switch (indexPath.row){
            case 0:
                
                break;
            case 1:
                let var1 = (currentInformation.value(forKey: "evalucacion10") as? String ) ?? ""
                if var1.isEmpty || var1 == "0"{
                    return 0
                }
                numCellsTbl42 = numCellsTbl42 + 1
                break;
            case 2:
                let var1 = (currentInformation.value(forKey: "evalucacion13") as? String ) ?? ""
                if var1.isEmpty || var1 == "0"{
                    return 0
                }
                numCellsTbl42 = numCellsTbl42 + 1
                break;
            case 3:
                let var1 = (currentInformation.value(forKey: "evalucacion16") as? String ) ?? ""
                if var1.isEmpty || var1 == "0"{
                    return 0
                }
                numCellsTbl42 = numCellsTbl42 + 1
                break;
            case 4:
                let var1 = (currentInformation.value(forKey: "evalucacion19") as? String ) ?? ""
                if var1.isEmpty || var1 == "0"{
                    return 0
                }
                numCellsTbl42 = numCellsTbl42 + 1
                break;
            case 5:
                let var1 = (currentInformation.value(forKey: "evalucacion22") as? String ) ?? ""
                if var1.isEmpty || var1 == "0"{
                    return 0
                }
                numCellsTbl42 = numCellsTbl42 + 1
                break;
            case 6:
                let var1 = (currentInformation.value(forKey: "evalucacion25") as? String ) ?? ""
                if var1.isEmpty || var1 == "0"{
                    return 0
                }
                numCellsTbl42 = numCellsTbl42 + 1
                break;
            case 7:
                let var1 = (currentInformation.value(forKey: "evalucacion28") as? String ) ?? ""
                if var1.isEmpty || var1 == "0"{
                    return 0
                }
                numCellsTbl42 = numCellsTbl42 + 1
                break;
            case 8:
                let var1 = (currentInformation.value(forKey: "evalucacion32") as? String ) ?? ""
                if var1.isEmpty || var1 == "0"{
                    tblView42HeightConstraint.constant = CGFloat(numCellsTbl42*30)
                    self.layoutIfNeeded()
                    return 0
                }
                numCellsTbl42 = numCellsTbl42 + 1
                tblView42HeightConstraint.constant = CGFloat(numCellsTbl42*30)
                self.layoutIfNeeded()
                break;
            default:
                break;
        }
        }
        return UITableViewAutomaticDimension
    }
}
