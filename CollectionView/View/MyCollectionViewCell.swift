//
//  MyCollectionViewCell.swift
//  CollectionView
//
//  Created by Cátia Souza on 16/10/20.
//

import UIKit

protocol MyCollectionViewCellDelegate: class {
    
    func goDetailVEventVC(value: Evento?)
}

class MyCollectionViewCell: UICollectionViewCell {

    weak var delegate: MyCollectionViewCellDelegate?
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var titlelabel: UILabel!
    private var currentEvent: Evento?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    @IBAction func tappedButton(_ sender: UIButton) {
        print("clicou botao")
        // aqui ele manda so e a viewController ouve
        print("MyCollection=====>tappedButton")
        self.delegate?.goDetailVEventVC(value: self.currentEvent)
        self.titlelabel.textColor = .red
    }
    func setup(evento: Evento){
        self.currentEvent = evento
        self.titlelabel.text = evento.nome
        self.backgroundImage.image = UIImage(named: evento.backgroudNameImage ?? "")
    }
    
}
