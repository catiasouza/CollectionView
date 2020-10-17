//
//  MyCollectionViewCell.swift
//  CollectionView
//
//  Created by Cátia Souza on 16/10/20.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var titlelabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    @IBAction func tappedButton(_ sender: UIButton) {
        print("clicou botao")
    }
    func setup(evento: Evento){
        self.titlelabel.text = evento.nome
        self.backgroundImage.image = UIImage(named: evento.backgroudNameImage ?? "")
    }
}
