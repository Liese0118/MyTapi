//
//  ViewController.swift
//  MyTapi
//
//  Created by 瓜生理世 on 2019/04/29.
//  Copyright © 2019 瓜生理世. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var addButton: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    var tapis: [Tapi]!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TEST
        /*let config = Realm.Configuration(
            schemaVersion: 3,
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < 3) {}
        })
        Realm.Configuration.defaultConfiguration = config*/
        
        
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //customCellを使う場合registerしてあげる
        collectionView.register(UINib(nibName: "CustomCollectionViewCell",
                                      bundle: nil),
                                forCellWithReuseIdentifier: "cell")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tapis = Tapi.loadAll()
        collectionView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.number = sender as? Int
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetail", sender: indexPath.row)
    }
    
    //cellの数をセット
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tapis.count
    }
    
    //cellの中身をセット
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as!
            CustomCollectionViewCell
        
        cell.imageView.image = tapis[indexPath.row].tapiImage
        return cell
    }
}

