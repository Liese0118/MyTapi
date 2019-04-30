//
//  PostViewController.swift
//  MyTapi
//
//  Created by 瓜生理世 on 2019/04/29.
//  Copyright © 2019 瓜生理世. All rights reserved.
//

import UIKit
import RealmSwift

class PostViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    var likeNumber: Int = 0
    //タピオカの写真addボタン
    @IBOutlet var tapiAddPhoto: UIButton!
    var tapi = Tapi.creat()
    var selectedImage: UIImage!
    @IBAction func setTapiImage(_ sender: Any) {
        useCamera()
    }
    //タピオカの写真
    @IBOutlet var tapiPhoto: UIImageView!
    //タピオカ名
    @IBOutlet var tapiNameTextField: UITextField! {
            didSet {
                tapiNameTextField.delegate = self
            }
    //タピオカ甘さ
    @IBOutlet var sweetnesstextField: UITextField!{
        var sweetnessPickerView: UIPickerView = UIPickerView()
        let list = ["", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    //タピオカの氷量
        
    @IBOutlet var tapiIce: UIPickerView!
    
    //タピオカのお気に入り度(星ボタン x/5で表示)
    //1
    @IBAction func tapiLike1() {
        likeNumber == 1
    }
    //2
    @IBAction func tapiLike1() {
        likeNumber == 2
    }
    //3
    @IBAction func tapiLike1() {
        likeNumber == 3
    }
    //4
    @IBAction func tapiLike1() {
        likeNumber == 4
    }
    //5
    @IBAction func tapiLike1() {
        likeNumber == 5
}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapiSweetness.dataSource = self
        tapiSweetness.delegate = self
        // Do any additional setup after loading the view.
    }
        func numberOfComponents(in pickerView: UIPickerView) -> Int
        func sweetnessPickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
        func sweetnessPickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
    @IBAction func register(_ sender: Any) {
        book.bookTitle      = .text ?? ""
        book.authorName     = authorTextField.text ?? ""
        book.publisher      = publisherTextField.text ?? ""
        
        guard let _selectedImage = selectedImage else {
            print("画像を選択してちょ")
            return
        }
        book.bookImage = _selectedImage
        
        book.save()
        
        
        self.dismiss(animated: true, completion: nil)
    }
}
