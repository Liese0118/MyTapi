//
//  DetailViewController.swift
//  MyTapi
//
//  Created by 瓜生理世 on 2019/04/30.
//  Copyright © 2019 瓜生理世. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var homeButton: UIBUtton!
    @IBOutlet var image: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var sweetnessLabel: UILabel!
    @IBOutlet var iceLabel: UILabel!
    @IBAction func editButton(){}
    @IBAction func delateButton(){}

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
