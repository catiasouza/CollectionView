//
//  ViewController.swift
//  CollectionView
//
//  Created by Cátia Souza on 16/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var arrayEvento: [Evento] = [
        Evento(nome: "Evento1", backgroudNameImage: "um.jpg"),
        Evento(nome: "Evento2", backgroudNameImage: "dois.jpg"),
        Evento(nome: "Evento3", backgroudNameImage: "tres.jpg"),
        Evento(nome: "Evento4", backgroudNameImage: "quatro.jpg")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myCollectionView.register(UINib(nibName: "MyCollectionViewCell"  , bundle: nil), forCellWithReuseIdentifier: "MyCollectionViewCell")
        
        self.myCollectionView.dataSource = self
        self.myCollectionView.delegate = self
    }
    
    
}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayEvento.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: MyCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as? MyCollectionViewCell
        
        cell?.setup(evento: self.arrayEvento[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(self.arrayEvento[indexPath.row].nome)
    }
    
}
