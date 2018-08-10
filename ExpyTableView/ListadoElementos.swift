//
//  ListadoElementos.swift
//  Sismo App_Example
//
//  Created by Cesar Andres Figueroa Mendiola on 17/12/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import CoreData

class ListadoElementos: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var tabla: UITableView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        //        view.removeFromSuperview()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return idFichaListado.count

    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row

        if idBanFichaListado == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath as IndexPath) as! ListadoCelda1
            cell.estado.text = (idFichaListado[row].value(forKeyPath: "elemento") as! NSString as String)
            cell.elemento.text = (row + 1).description + ".- " +  (idFichaListado[row].value(forKeyPath: "respuesta") as! NSString as String)
           return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath as IndexPath) as! ListadoCelda2
            cell.elemento.text = (row + 1).description + ".- " + (idFichaListado[row].value(forKeyPath: "elemento") as! NSString as String)
            cell.ninguno.text = "Ninguno: " + (idFichaListado[row].value(forKeyPath: "ele1") as! NSString as String)
            cell.leve.text = "Leve: " + (idFichaListado[row].value(forKeyPath: "ele2") as! NSString as String)
            cell.moderado.text = "Moderado: " + (idFichaListado[row].value(forKeyPath: "ele3") as! NSString as String)
            cell.fuerte.text = "Fuerte: " + (idFichaListado[row].value(forKeyPath: "ele4") as! NSString as String)
            cell.severo.text = "Severo: " + (idFichaListado[row].value(forKeyPath: "ele5") as! NSString as String)
//            cell.estado.text = (idFichaListado[0].value(forKeyPath: "elemento") as! NSString as String)

            return cell
        }

    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if idBanFichaListado == 1 {
            return 70
        } else {
            return 180
        }
    }
    
    @IBAction func Atras(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
}
