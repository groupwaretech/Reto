//
//  FamiliaViewController.swift
//  Comparte
//
//  Created by HEINSOHN BUSINESS on 28/02/15.
//  Copyright (c) 2015 App Design Vault. All rights reserved.
//

import Foundation
import UIKit

class FamiliaViewController : UIViewController {
    
    internal var index: Int!
    
    
    @IBOutlet var titleText: UINavigationItem!
    
    @IBOutlet var back: UIBarButtonItem!
    
    @IBOutlet var image: UIImageView!
    
    
    @IBOutlet var familyDescription: UITextView!
    
    
    struct Family {
        let name : String
        let image : String
        let description : String
    }
    
    var families = [Family]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("%i", index)
        
        self.families = [Family(name:"Familia Morales Yepes", image:"Familia-1", description: "Familia ubicada en la zona nororiental de Medellín, integrada por 12 personas. Actualmente los niños no están cursando sus estudios debido a la escacez económica, desplazamiento de los mismos. Esta es una familia muy necesitada.")
            ,Family(name:"Familia Gómez Pérez", image:"Familia-2", description: "Familia ubicada en el sector de Iguaná, integrada por 5 personas. Actualmente el padre de familia no tiene un empleo estable, él tiene habilidades en carpinteria. Sería de mucha ayuda si puede colaborar en encontrar un empleo")
            ,Family(name:"Familia Carrillo Rodríguez", image:"Familia-3", description: "Familia ubicada en el sector de Iguaná, integrada por 6 personas. El padre de familia busca urgente un empleo que le pemita llevar el sustento a casa. Sus habilidades están en su experiencia en la construcción")
            ,Family(name:"Familia Manzanera Bermudes", image:"Familia-4", description: "Familia ubicada en el sector de Manrrique en Medellín, integrada por 5 personas")
            ,Family(name:"Familia Vélez Contreras", image:"Familia-5", description: "Familia ubicada en el sector de Iguaná, integrada por 8 personas")]
        
        titleText.title = self.families[index].name
        image.image = UIImage(named: self.families[index].image)
        familyDescription.text = self.families[index].description
        
        switch index {
        case 0:
            NSLog("%@", "Case 0")
            
            
        case 1:
            NSLog("%@", "Case 1")
        case 2:
            NSLog("%@", "Case 2")

        default:
            NSLog("%@", "Default")
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
}