//
//  PerfilUsuario.swift
//  VBExpand_Tableview
//
//  Created by Cesar Andres Figueroa Mendiola on 28/11/17.
//  Copyright © 2017 Crypton. All rights reserved.
//

import Foundation
import UIKit
import TCProgressBar

class PerfilUsuario: UIViewController {
    @IBOutlet weak var vistaNombre: UIView!
    @IBOutlet weak var vistaProfesion: UIView!
    @IBOutlet weak var vistaInstitucion: UIView!
    @IBOutlet weak var vistaEmail: UIView!
    @IBOutlet weak var vistaTelefono: UIView!
    @IBOutlet weak var vistaMenuTabBar: UIView!
    @IBOutlet weak var vistaPaterno: UIView!
    @IBOutlet weak var vistaMaterno: UIView!
    
    
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtProfesion: UITextField!
    @IBOutlet weak var txtInstitucion: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtTelefono: UITextField!
    
    @IBOutlet weak var Barra: TCProgressBar!
    @IBOutlet weak var txtPaterno: UITextField!
    @IBOutlet weak var txtMaterno: UITextField!
    
    @IBOutlet weak var Nombre: UILabel!
    override func viewWillAppear(_ animated: Bool) {
        Barra.value = CGFloat(AvanceFicha)
        Nombre.text = NombreFicha
    }
    
    override func viewDidLoad() {
        
        self.vistaNombre.layer.borderWidth = 1
        self.vistaNombre.layer.borderColor = UIColor.black.cgColor
        self.vistaNombre.layer.borderWidth = 1
        self.vistaNombre.layer.borderColor = UIColor.black.cgColor
        
        self.vistaProfesion.layer.borderWidth = 1
        self.vistaProfesion.layer.borderColor = UIColor.black.cgColor
        self.vistaProfesion.layer.borderWidth = 1
        self.vistaProfesion.layer.borderColor = UIColor.black.cgColor
        
        self.vistaInstitucion.layer.borderWidth = 1
        self.vistaInstitucion.layer.borderColor = UIColor.black.cgColor
        self.vistaInstitucion.layer.borderWidth = 1
        self.vistaInstitucion.layer.borderColor = UIColor.black.cgColor
        
        self.vistaEmail.layer.borderWidth = 1
        self.vistaEmail.layer.borderColor = UIColor.black.cgColor
        self.vistaEmail.layer.borderWidth = 1
        self.vistaEmail.layer.borderColor = UIColor.black.cgColor
        
        self.vistaTelefono.layer.borderWidth = 1
        self.vistaTelefono.layer.borderColor = UIColor.black.cgColor
        self.vistaTelefono.layer.borderWidth = 1
        self.vistaTelefono.layer.borderColor = UIColor.black.cgColor
        
        self.vistaMenuTabBar.layer.borderWidth = 1
        self.vistaMenuTabBar.layer.borderColor = UIColor.black.cgColor
        self.vistaMenuTabBar.layer.borderWidth = 1
        self.vistaMenuTabBar.layer.borderColor = UIColor.black.cgColor
        
 
        self.vistaPaterno.layer.borderWidth = 1
        self.vistaPaterno.layer.borderColor = UIColor.black.cgColor
        self.vistaPaterno.layer.borderWidth = 1
        self.vistaPaterno.layer.borderColor = UIColor.black.cgColor
        
        
        self.vistaMaterno.layer.borderWidth = 1
        self.vistaMaterno.layer.borderColor = UIColor.black.cgColor
        self.vistaMaterno.layer.borderWidth = 1
        self.vistaMaterno.layer.borderColor = UIColor.black.cgColor
        
        
        
        if let name = dato.object(forKey: "nombrefichains") as? String {
            self.txtNombre.text = name
        }
        if let name = dato.object(forKey: "profesionfichains") as? String {
            self.txtProfesion.text = name
        }
        if let name = dato.object(forKey: "institucionfichains") as? String {
            self.txtInstitucion.text = name
        }
        if let name = dato.object(forKey: "emailfichains") as? String {
            self.txtEmail.text = name
        }
        if let name = dato.object(forKey: "telefonofichains") as? String {
            self.txtTelefono.text = name
        }
        if let name = dato.object(forKey: "AppPatfichains") as? String {
            self.txtPaterno.text = name
        }
        
        if let name = dato.object(forKey: "AppMatfichains") as? String {
            self.txtMaterno.text = name
        }
        
    }
    @IBAction func GuardarEvaluador(_ sender: Any) {
        dato.set(self.txtNombre.text!, forKey: "nombrefichains")
        dato.set(self.txtProfesion.text as! String, forKey: "profesionfichains")
        dato.set(self.txtInstitucion.text!, forKey: "institucionfichains")
        dato.set(self.txtEmail.text as! String, forKey: "emailfichains")
        dato.set(self.txtTelefono.text as! String, forKey: "telefonofichains")
        dato.set(self.txtPaterno.text as! String, forKey: "AppPatfichains")
        dato.set(self.txtMaterno.text as! String, forKey: "AppMatfichains")
        dato.synchronize()
        
        let alert = UIAlertController(title: TituloAlerta, message: msgGuardar, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default,  handler: { action in
            //            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func RegresarDePerfil(_ sender: Any) {
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        if llamadoPerfil == 1 {
//            let newViewController = storyBoard.instantiateViewController(withIdentifier: "menuinforme") as! MenuInforme
//            self.present(newViewController, animated: true, completion: nil)
//        } else  if llamadoPerfil == 2 {
//            let newViewController = storyBoard.instantiateViewController(withIdentifier: "infogeneral") as! InformeGeneral
//            self.present(newViewController, animated: true, completion: nil)
//        } else  if llamadoPerfil == 3 {
//
//            let newViewController = storyBoard.instantiateViewController(withIdentifier: "identificainm") as! IdentificacionInmueble
//            self.present(newViewController, animated: true, completion: nil)
//        } else  if llamadoPerfil == 4 {
//            let newViewController = storyBoard.instantiateViewController(withIdentifier: "evaludaedificio") as! EvaluacionEdificio
//            self.present(newViewController, animated: true, completion: nil)
//        }
        
        self.dismiss(animated: true, completion: nil)
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
}
