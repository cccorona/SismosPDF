//
//  CheckCoreData.swift
//  Sismo App_Example
//
//  Created by Luis Fernando Bustos Ramírez on 06/08/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import CoreData

class CheckCoreData: NSObject {

    func checkProgress(){
        AvanceFicha = 0
        
        
        
        var currentInformation: NSDictionary!
        var inspeccion44: [NSDictionary]!
        var inspeccion45: [NSDictionary]!
        var inspeccion46: [NSDictionary]!
        var imagesArr: [NSDictionary]!
        
        
        let appDelegate = UIApplication .shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest < NSManagedObject > (entityName: "Ficha" )
        
//        if matrizSelected.count > 2{
//            idFicha = matrizSelected[2]
//        }
        
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
        
        
        let fetchRequest3 = NSFetchRequest<NSManagedObject>(entityName: "Insp3")
        fetchRequest2.predicate = NSPredicate(format: "idficha = %@", idFicha )
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
                print("inspeccion 46")
                print(inspeccion46)
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        imagesArr = [NSDictionary]()
        
        if checkFirstScreen(currentInformation){
            AvanceFicha = AvanceFicha + 0.3
        }
        if checkSecondScreen(currentInformation){
            AvanceFicha = AvanceFicha + 0.3
        }
        if checkThirtScreen(currentInformation){
            AvanceFicha = AvanceFicha + 0.3
        }
        if AvanceFicha >= 0.8{
           AvanceFicha = 1
        }
    }
    
    private func checkFirstScreen(_ info:NSDictionary) -> Bool{
        var result = true
        if (info.object(forKey: "evalucacion58") as? String) == ""{
            result = false
        }
        if (info.object(forKey: "evalucacion59") as? String) == ""{
            result = false
        }
        if (info.object(forKey: "informe2") as? String) == ""{
            result = false
        }
        if (info.object(forKey: "informe3") as? String) == ""{
            result = false
        }
        if (info.object(forKey: "informe4") as? String) == ""{
            result = false
        }
        if (info.object(forKey: "informe5") as? String) == ""{
            result = false
        }
        return result
    }
    
    private func checkSecondScreen(_ info:NSDictionary) ->Bool{
        var result = true
        if (info.object(forKey: "identificacion2") as? String) == "" || (info.object(forKey: "identificacion2") as? String)  == nil{
            result = false
        }
        if (info.object(forKey: "identificacion3") as? String) == "" || (info.object(forKey: "identificacion3") as? String)  == nil{
            result = false
        }
        if (info.object(forKey: "identificacion4") as? String) == "" || (info.object(forKey: "identificacion4") as? String)  == nil{
            result = false
        }
        if (info.object(forKey: "identificacion5") as? String) == "" || (info.object(forKey: "identificacion5") as? String)  == nil{
            result = false
        }
        if (info.object(forKey: "identificacion6") as? String) == "" || (info.object(forKey: "identificacion6") as? String)  == nil{
            result = false
        }
        if (info.object(forKey: "identificacion7") as? String) == "" || (info.object(forKey: "identificacion7") as? String)  == nil{
            result = false
        }
        if (info.object(forKey: "identificacion8") as? String) == "" || (info.object(forKey: "identificacion8") as? String)  == nil{
            result = false
        }
        //identificacion9 == Pueblo / Ciudad -> Se le permite el parametro otro
        if (info.object(forKey: "identificacion9") as? String) == ""{
            result = false
        }else{
            if ((info.object(forKey: "identificacion9") as? NSString)?.uppercased == "OTRO") && ((info.object(forKey: "identificacion10") as? String) == ""){
                result = false
            }
        }
        if (info.object(forKey: "identificacion11") as? String) == "" || (info.object(forKey: "identificacion11") as? String)  == nil{
            result = false
        }
        if (info.object(forKey: "identificacion12") as? String) == "" || (info.object(forKey: "identificacion12") as? String)  == nil{
            result = false
        }
        if (info.object(forKey: "identificacion13") as? String) == "" || (info.object(forKey: "identificacion13") as? String)  == nil{
            result = false
        }
        if (info.object(forKey: "identificacion14") as? String) == "" || (info.object(forKey: "identificacion14") as? String)  == nil{
            result = false
        }
        //identificacion15 == Accesibilidad -> Se le permite el parametro otro
        if (info.object(forKey: "identificacion15") as? String) == ""{
            result = false
        }else{
            if ((info.object(forKey: "identificacion15") as? NSString)?.uppercased == "OTRO") && ((info.object(forKey: "identificacion16") as? String) == ""){
                result = false
            }
        }
        //identificacion17 == Condicion de accesibilidad -> Se le permite el parametro otro
        if (info.object(forKey: "identificacion17") as? String) == ""{
            result = false
        }else{
            if ((info.object(forKey: "identificacion17") as? NSString)?.uppercased == "OTRO") && ((info.object(forKey: "identificacion18") as? String) == ""){
                result = false
            }
        }
        return result
    }
    
    
    private func checkThirtScreen(_ info:NSDictionary) -> Bool{
        var result = true
        if (info.object(forKey: "evalucacion1") as? String) == "" || (info.object(forKey: "evalucacion1") as? String)  == nil{
            result = false
        }
        if (info.object(forKey: "evalucacion2") as? String) == "" || (info.object(forKey: "evalucacion2") as? String)  == nil{
            result = false
        }
        if (info.object(forKey: "evalucacion3") as? String) == "" || (info.object(forKey: "evalucacion3") as? String)  == nil{
            result = false
        }
        if (info.object(forKey: "evalucacion4") as? String) == "" || (info.object(forKey: "evalucacion4") as? String)  == nil{
            result = false
        }
        if (info.object(forKey: "evalucacion5") as? String) == "" || (info.object(forKey: "evalucacion5") as? String)  == nil{
            result = false
        }
        if (info.object(forKey: "evalucacion6") as? String) == "" || (info.object(forKey: "evalucacion6") as? String)   == nil{
            result = false
        }
        if (info.object(forKey: "evalucacion7") as? String) == "" || (info.object(forKey: "evalucacion7") as? String)   == nil{
            result = false
        }
        if (info.object(forKey: "evalucacion8") as? String) == "" || (info.object(forKey: "evalucacion8") as? String)   == nil{
            result = false
        }
        if (info.object(forKey: "evalucacion53") as? String) == "" || (info.object(forKey: "evalucacion53") as? String)   == nil{
            result = false
        }
        if (info.object(forKey: "evalucacion54") as? String) == "" || (info.object(forKey: "evalucacion54") as? String)  == nil{
            result = false
        }
        if (info.object(forKey: "evalucacion55") as? String) == "" || (info.object(forKey: "evalucacion55") as? String)   == nil{
            result = false
        }
        if (info.object(forKey: "evalucacion56") as? String) == "" || (info.object(forKey: "evalucacion56") as? String)  == nil{
            result = false
        }
        return result
    }
}
