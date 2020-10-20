//
//  DetailsViewController.swift
//  CollectionView
//
//  Created by Cátia Souza on 19/10/20.
//

import UIKit

//pra fazer a segue puxa da view p outra tela

class DetailsViewController: UIViewController {

    @IBOutlet weak var eventoDetailLabel: UILabel!
    @IBOutlet weak var eventoImage: UIImageView!
    
    var evento: Evento?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.eventoImage.image = UIImage(named: self.evento?.backgroudNameImage ?? "")
        self.eventoDetailLabel.text = self.evento?.nome
       
    }
    

    

}
