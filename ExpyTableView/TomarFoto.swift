//
//  TomarFoto.swift
//  Sismo App_Example
//
//  Created by Cesar Andres Figueroa Mendiola on 09/12/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

class TomarFoto: UIView, UIImagePickerControllerDelegate,UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    
    
    @IBOutlet var Imagen1: UIImageView!
    @IBOutlet var Imagen2: UIImageView!
    @IBOutlet var Imagen3: UIImageView!
    
    var BanderaImagen = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        Imagen2.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(handleGesture(_:))))
        Imagen3.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(handleGesture(_:))))
        Imagen1.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(handleGesture(_:))))
        
        Imagen2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapGesture(_:))))
        Imagen3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapGesture(_:))))
        Imagen1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapGesture(_:))))
        
        Imagen1.isUserInteractionEnabled = true
        Imagen2.isUserInteractionEnabled = true
        Imagen3.isUserInteractionEnabled = true


        if (foto1 != nil) {
            let image = UIImage(data: foto1! as Data)
            Imagen1.image = image
        }
        if (foto2 != nil) {
            let image = UIImage(data: foto2! as Data)
            Imagen2.image = image
        }
        if (foto3 != nil)  {
            let image = UIImage(data: foto3! as Data)
            Imagen3.image = image
        }
    }
    

    @IBAction func SeleccionarFoto1(_ sender: Any) {
        BanderaImagen = (sender as AnyObject).tag
        TomarFoto()
    }
    
    @IBAction func tapGesture(_ sender:UITapGestureRecognizer){
        BanderaImagen = (sender.view?.tag)!
        TomarFoto()
    }
    
    @IBAction func handleGesture(_ sender: UILongPressGestureRecognizer) {
        if sender.state == UIGestureRecognizerState.began
        {
            let actionSheetController: UIAlertController = UIAlertController(title: "Imagen", message: "Deseas eliminar esta imagen", preferredStyle: .actionSheet)
            
            //Create and add the Cancel action
            let cancelAction: UIAlertAction = UIAlertAction(title: "Cancelar", style: .cancel) { action -> Void in
                //Just dismiss the action sheet
            }
            actionSheetController.addAction(cancelAction)
            
            let deletePictureAction: UIAlertAction = UIAlertAction(title: "Borrar", style: .destructive) { action -> Void in
                let imageTag = sender.view?.tag
                if imageTag == self.Imagen1.tag {
                    self.Imagen1.image = #imageLiteral(resourceName: "image_seleciconar.png")
                    foto1 = nil
                } else if imageTag == self.Imagen2.tag {
                    self.Imagen2.image = #imageLiteral(resourceName: "image_seleciconar.png")
                    foto2 = nil
                } else if imageTag == self.Imagen3.tag {
                    self.Imagen3.image = #imageLiteral(resourceName: "image_seleciconar.png")
                    foto3 = nil
                }
            }
            actionSheetController.addAction(deletePictureAction)
            
            //Present the AlertController
            let currentController = getCurrentViewController()
            currentController?.present(actionSheetController, animated: true, completion: nil)
        }
    }

    
    
    @IBOutlet weak var SelecionarFoto: UIButton!
    @IBAction func FotoGaleria(_ sender: Any) {
        foto1 = UIImagePNGRepresentation(resizeImage(image: Imagen1.image! ))! as NSData
        foto2 = UIImagePNGRepresentation(resizeImage(image: Imagen2.image! ))! as NSData
        foto3 = UIImagePNGRepresentation(resizeImage(image: Imagen3.image! ))! as NSData

    }
    
    
    func TomarFoto() {
        let actionSheetController: UIAlertController = UIAlertController(title: "Imagen", message: "Selecciona una imagen", preferredStyle: .actionSheet)
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancelar", style: .cancel) { action -> Void in
            //Just dismiss the action sheet
        }
        actionSheetController.addAction(cancelAction)
        //Create and add first option action
//        let takePictureAction: UIAlertAction = UIAlertAction(title: "Tomar foto", style: .default) { action -> Void in
//            if(  UIImagePickerController.isSourceTypeAvailable(.camera))
//
//            {
//                let myPickerController = UIImagePickerController()
//                myPickerController.delegate = self
//                myPickerController.sourceType = .camera
//                let currentController = getCurrentViewController()
//                currentController?.present(myPickerController, animated: true, completion: nil)
//            }
//            else
//            {
//                let actionController: UIAlertController = UIAlertController(title: "Selecciona una imagen",message: "", preferredStyle: .alert)
//                let cancelAction: UIAlertAction = UIAlertAction(title: "Aceptar", style: .cancel) { action -> Void     in
//                    //Just dismiss the action sheet
//                }
//
//                actionController.addAction(cancelAction)
//                let currentController = getCurrentViewController()
//                currentController?.present(actionController, animated: true, completion: nil)
//
//            }
            
//            let storyboard: UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
//            let vc: CameraViewController = storyboard.instantiateViewController(withIdentifier: "camera") as! CameraViewController
//            let currentController = getCurrentViewController()
//            currentController?.present(vc, animated: false, completion: nil)
//
//        }
        
//        actionSheetController.addAction(takePictureAction)
        //Create and add a second option action
        let choosePictureAction: UIAlertAction = UIAlertAction(title: "Galería", style: .default) { action -> Void in
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self
            myPickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
            let currentController = getCurrentViewController()
            currentController?.present(myPickerController, animated: true, completion: nil)
        }
        actionSheetController.addAction(choosePictureAction)
        
        //Present the AlertController
        let currentController = getCurrentViewController()
        currentController?.present(actionSheetController, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        if BanderaImagen == 1 {
            Imagen1.image = image
            foto1 = UIImagePNGRepresentation(resizeImage(image: Imagen1.image! ))! as NSData
        } else if BanderaImagen == 2 {
            Imagen2.image = image
            foto2 = UIImagePNGRepresentation(resizeImage(image: Imagen2.image! ))! as NSData
        } else if BanderaImagen == 3 {
            Imagen3.image = image
            foto3 = UIImagePNGRepresentation(resizeImage(image: Imagen3.image! ))! as NSData
        }
//        self.imagenPerfil.image = image
//        CargandoFoto = 1
        



        
        let currentController = getCurrentViewController()
        currentController?.dismiss(animated: true, completion: nil)
//        self.dismiss(animated: true, completion: nil)
    }
}
