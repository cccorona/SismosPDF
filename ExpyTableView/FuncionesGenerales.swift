//
//  FuncionesGenerales.swift
//  VBExpand_Tableview
//
//  Created by Cesar Andres Figueroa Mendiola on 28/11/17.
//  Copyright © 2017 Crypton. All rights reserved.
//

import Foundation
import CoreData
import UIKit

var ipServidorReomoto = "https://sgm.mop.gov.cl/meaweb/services/MOP_WS_MOP_SR_EMERGENCIA"

let appDelegate = UIApplication.shared.delegate as! AppDelegate
//let appDelegateObj : AppDelegate = UIApplication.shared.delegate as! AppDelegate
let context = appDelegate.persistentContainer.viewContext
let dato = UserDefaults()
let VaribleDispositivo = UserDefaults()
var llamadoPerfil = 0
var dataArray = [NSManagedObject]()
var idFicha = ""
var TituloAlerta = "Ficha de inspección"
var msgGuardar = "Información guardada correctamente"
var idFichaConsultada =   [NSManagedObject]() //NSFetchRequest<NSManagedObject>(entityName: "Ficha")
var idFichaListado =   [NSManagedObject]()

var idFichaConsultada2 =   [NSManagedObject]() //NSFetchRequest<NSManagedObject>(entityName: "Ficha")
var idFichaListado2 =   [NSManagedObject]()


var idBanFichaListado = 0
var EvaluacionA = 0
var EvaluacionB = 0
var EvaluacionC = 0
var NumEdificios = 0
var AvanceFicha = 0.0
var NombreFicha = ""
var TipoInfoGeneral = 0
var NombreOriginal = ""
var FechaFormato = ""
var latitud = ""
var longitud = ""
// ********* NUEVO INFORME ***********
var informe1 = "0"
var informe2 = ""
var informe3 = ""
var informe4 = ""
var informe5 = ""
//**********

// ********* IDENTIFICACION INMUEBLE ***********
var identificacion1 = ""
var identificacion2 = ""
var identificacion3 = ""
var identificacion4 = ""
var identificacion5 = ""
var identificacion6 = ""
var identificacion7 = ""
var identificacion8 = ""
var identificacion9 = ""
var identificacion10 = ""
var identificacion11 = ""
var identificacion12 = ""
var identificacion13 = ""
var identificacion14 = ""
var identificacion15 = ""
var identificacion16 = ""
var identificacion17 = ""
var identificacion18 = ""
//**********


// ********* EVALUACION EDIFICIO ***********
var evalucacion1 = ""
var evalucacion2 = ""
var evalucacion3 = ""
var evalucacion4 = ""
var evalucacion5 = ""
var evalucacion6 = ""
var evalucacion7 = ""
var evalucacion8 = ""
var evalucacion9 = ""
var evalucacion10 = ""
var evalucacion11 = ""
var evalucacion12 = ""
var evalucacion13 = ""
var evalucacion14 = ""
var evalucacion15 = ""
var evalucacion16 = ""
var evalucacion17 = ""
var evalucacion18 = ""
var evalucacion19 = ""
var evalucacion20 = ""
var evalucacion21 = ""
var evalucacion22 = ""
var evalucacion23 = ""
var evalucacion24 = ""
var evalucacion25 = ""
var evalucacion26 = ""
var evalucacion27 = ""
var evalucacion28 = ""
var evalucacion29 = ""
var evalucacion30 = ""
var evalucacion31 = ""
var evalucacion32 = ""
var evalucacion33 = ""
var evalucacion34 = ""
var evalucacion35 = ""
var evalucacion36 = ""
var evalucacion37 = ""
var evalucacion38 = ""
var evalucacion39 = ""
var evalucacion40 = ""
var evalucacion41 = ""
var evalucacion42 = ""
var evalucacion43 = ""
var evalucacion44 = ""
var evalucacion45 = ""
var evalucacion46 = ""
var evalucacion47 = ""
var evalucacion48 = ""
var evalucacion49 = ""
var evalucacion50 = ""
var evalucacion51 = ""
var evalucacion52 = ""
var evalucacion53 = ""
var evalucacion54 = ""
var evalucacion55 = ""
var evalucacion56 = ""
var evalucacion57 = ""
var evalucacion58 = ""
var evalucacion59 = ""
var evalucacion60 = ""
var evalucacion61 = ""
var evalucacion62 = ""
var idFichaPrincipal = ""
var foto1: NSData?
var foto2: NSData?
var foto3: NSData?


// ********* EVALUACION ***********
func CambiarColorBarraNavegacion(Vista:UIViewController){
    UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
    Vista.navigationController?.navigationBar.barTintColor = UIColor(red:0.13, green:0.18, blue:0.36, alpha:1.0)
    Vista.navigationController?.navigationBar.isTranslucent = true
    Vista.navigationController?.navigationBar.tintColor =  UIColor.white
    Vista.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white ]
    Vista.tabBarController?.tabBar.tintColor = UIColor(red:0.18, green:0.67, blue:0.40, alpha:1.0)
}

func getCurrentViewController() -> UIViewController? {
    
    if let rootController = UIApplication.shared.keyWindow?.rootViewController {
        var currentController: UIViewController! = rootController
        while( currentController.presentedViewController != nil ) {
            currentController = currentController.presentedViewController
        }
        return currentController
    }
    return nil
    
}

func resizeImage(image: UIImage) -> UIImage {
    return image
    var actualHeight: Float = Float(image.size.height)
    var actualWidth: Float = Float(image.size.width)
    let maxHeight: Float = 200.0
    let maxWidth: Float = 300.0
    var imgRatio: Float = actualWidth / actualHeight
    let maxRatio: Float = maxWidth / maxHeight
    let compressionQuality: Float = 0.7
    //50 percent compression
    
    if actualHeight > maxHeight || actualWidth > maxWidth {
        if imgRatio < maxRatio {
            //adjust width according to maxHeight
            imgRatio = maxHeight / actualHeight
            actualWidth = imgRatio * actualWidth
            actualHeight = maxHeight
        }
        else if imgRatio > maxRatio {
            //adjust height according to maxWidth
            imgRatio = maxWidth / actualWidth
            actualHeight = imgRatio * actualHeight
            actualWidth = maxWidth
        }
        else {
            actualHeight = maxHeight
            actualWidth = maxWidth
        }
    }
    
    let rect =  CGRect(x:0.0, y:0.0, width:CGFloat(actualWidth), height: CGFloat(actualHeight))
    UIGraphicsBeginImageContext(rect.size)
    image.draw(in: rect)
    let img = UIGraphicsGetImageFromCurrentImageContext()
    let imageData = UIImageJPEGRepresentation(img!,CGFloat(compressionQuality))
    UIGraphicsEndImageContext()
    return UIImage(data: imageData!)!
}
