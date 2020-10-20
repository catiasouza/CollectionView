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
        // aqui ele ouve o delegate da myColletionview cell
        cell?.delegate = self
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(self.arrayEvento[indexPath.row].nome)
        
        //evento na celula
//        self.performSegue(withIdentifier: "DetailsViewController", sender: self.arrayEvento[indexPath.row])
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let evento: Evento? = sender as? Evento
        let vc = segue.destination as? DetailsViewController
        vc?.evento = evento
        
        
    }
}
// declara o delegate acima na celula
extension ViewController: MyCollectionViewCellDelegate{
    func goDetailVEventVC(value: Evento?) {
        print("ViewController======>MyCollectionViewCellDelegate========>goDetailVEventVC ===============>")
        self.performSegue(withIdentifier: "DetailsViewController", sender: value)
    }
    
    
}

