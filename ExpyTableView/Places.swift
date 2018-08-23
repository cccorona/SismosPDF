//
//  Places.swift
//  Sismo App_Example
//
//  Created by Luis Fernando Bustos Ramírez on 23/08/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class Places: NSObject {
    //Region -> Provincia -> Comuna
    func getAllPlaces(){
        let places = [
            "ARICA Y PARINACOTA":
                ["Arica":
                    ["Arica","Camarones"],
                 "Parinacota":
                    ["Putre", "General Lagos"]
                ],
            "TARAPACÁ":
                ["Iquique":
                    ["Iquique","Alto Hospicio"],
                 "Tamarugal":
                    ["Pozo Almonte", "Camiña", "Colchane", "Huara", "Pica"]
                ],
            "ANTOFAGASTA":
                ["Antofagasta":
                    ["Antofagasta", "Mejillones", "Sierra Gorda", "Taltal"],
                 "El Loa":
                    ["Calama", "Ollagüe", "San Pedro de Atacama"],
                 "Tocopilla":
                    ["Tocopilla", "María Elena"]
                ],
            "ATACAMA":
                ["Copiapó":
                    ["Copiapó", "Caldera", "Tierra Amarilla"],
                 "Chañaral":
                    [],
                 "Huasco":
                    []
                ],
            "COQUIMBO":
                ["":
                    [],
                 "":
                    [],
                 "":
                    []
                ],
            "VALPARAÍSO":
                ["":
                    [],
                 "":
                    [],
                 "":
                    []
                ],
            "DEL LIBERTADOR GRAL. BERNARDO O'HIGGINS":
                ["":
                    [],
                 "":
                    [],
                 "":
                    []
                ],
            "DEL MAULE":
                ["":
                    [],
                 "":
                    [],
                 "":
                    []
                ],
            "DEL BIOBÍO":
                ["":
                    [],
                 "":
                    [],
                 "":
                    []
                ],
            "DE LA ARAUCANÍA":
                ["":
                    [],
                 "":
                    [],
                 "":
                    []
                ],
            "DE LOS RÍOS":
                ["":
                    [],
                 "":
                    [],
                 "":
                    []
                ],
            "DE LOS LAGOS":
                ["":
                    [],
                 "":
                    [],
                 "":
                    []
                ],
            "AYSÉN DEL GRAL. CARLOS IBAÑEZ DEL CAMPO":
                ["":
                    [],
                 "":
                    [],
                 "":
                    []
                ],
            "MAGALLANES Y DE LA ANTÁRTICA CHILENA":
                ["":
                    [],
                 "":
                    [],
                 "":
                    []
                ],
            "METROPOLITANA DE SANTIAGO":
                ["":
                    [],
                 "":
                    [],
                 "":
                    []
                ]
            ] as [String : Any]
    }
    
    
    func getListRegions(){
        
    }
    
    func getListProvincia(){
        
    }
    
    func getListComuna(){
        
    }

}
