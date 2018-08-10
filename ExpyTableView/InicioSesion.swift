//
//  InicioSesion.swift
//  VBExpand_Tableview
//
//  Created by Cesar Andres Figueroa Mendiola on 28/11/17.
//  Copyright © 2017 Crypton. All rights reserved.
//

import Foundation
import UIKit

class InicioSesion: UIViewController {
    
    @IBOutlet weak var vistaUsuario: UIView!
    @IBOutlet weak var vistaContrasenia: UIView!
    @IBOutlet weak var botonSesion: UIButton!
    
    override func viewDidLoad() {
        self.vistaUsuario.layer.borderWidth = 1
        self.vistaUsuario.layer.borderColor = UIColor.black.cgColor
        self.vistaContrasenia.layer.borderWidth = 1
        self.vistaContrasenia.layer.borderColor = UIColor.black.cgColor
        
//        botonSesion.backgroundColor = .clear
//        botonSesion.layer.cornerRadius = 10
//        botonSesion.layer.borderWidth = 1
//        botonSesion.layer.borderColor = UIColor.clear.cgColor
        
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
