//
//  Listadp3Elementos.swift
//  Sismo App_Example
//
//  Created by Cesar Andres Figueroa Mendiola on 04/01/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import CoreData

class Listado3Elementos: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var tabla: UITableView!
    var ele1 = 0
    var ele2 = 0
    var ele3 = 0
    var ele4 = 0
    var ele5 = 0
    var ele6 = 0
    
    @IBOutlet weak var t1: UILabel!
    @IBOutlet weak var t2: UILabel!
    @IBOutlet weak var t3: UILabel!
    @IBOutlet weak var t4: UILabel!
    @IBOutlet weak var t5: UILabel!
    @IBOutlet weak var t6: UILabel!
    
    override func viewDidLoad() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.myOrientation = .landscape
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //        view.removeFromSuperview()
        ele1 = 0
        ele2 = 0
        ele3 = 0
        ele4 = 0
        ele5 = 0
        ele6 = 0
        for registro in idFichaListado {
            ele1 = Int(ele1 + (registro.value(forKeyPath: "ele1") as! NSString ).intValue)
            ele2 = Int(ele2 + (registro.value(forKeyPath: "ele2") as! NSString ).intValue)
            ele3 = Int(ele3 + (registro.value(forKeyPath: "ele3") as! NSString ).intValue)
            ele4 = Int(ele4 + (registro.value(forKeyPath: "ele4") as! NSString ).intValue)
            ele5 = Int(ele5 + (registro.value(forKeyPath: "ele5") as! NSString ).intValue)
            ele6 = Int(ele6 + (registro.value(forKeyPath: "total") as! NSString ).intValue)
        }
        
        t1.text = ele1.description
        t2.text = ele2.description
        t3.text = ele3.description
        t4.text = ele4.description
        t5.text = ele5.description
        t6.text = ele6.description
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (idFichaListado.count )
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        //        if idBanFichaListado == 1 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath as IndexPath) as! Listado3Celda2
        cell.t1.text = (idFichaListado[row].value(forKeyPath: "elemento") as! NSString as String)
        cell.t2.text = (idFichaListado[row].value(forKeyPath: "ele1") as! NSString as String)
        cell.t3.text = (idFichaListado[row].value(forKeyPath: "ele2") as! NSString as String)
        cell.t4.text = (idFichaListado[row].value(forKeyPath: "ele3") as! NSString as String)
        cell.t5.text = (idFichaListado[row].value(forKeyPath: "ele4") as! NSString as String)
        cell.t6.text = (idFichaListado[row].value(forKeyPath: "ele5") as! NSString as String)
        cell.t7.text = (idFichaListado[row].value(forKeyPath: "total") as! NSString as String)
        

        
        return cell

        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    @IBAction func Atras(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.myOrientation = .portrait
        self.dismiss(animated: true, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
}


