//
//  PostViewController.swift
//  MyTapi
//
//  Created by 瓜生理世 on 2019/04/29.
//  Copyright © 2019 瓜生理世. All rights reserved.
//

import UIKit
import RealmSwift

class PostViewController: UIViewController, UITextViewDelegate {
    
    //IBOutlets
    @IBOutlet weak var commentTextView: UITextView!
    
    var likeNumber: Int = 0
    
    
    //タピオカの写真addボタン
    @IBOutlet var tapiImageButton: UIButton!
    var tapi = Tapi.creat()
    var selectedImage: UIImage!
    //タピオカの写真追加(カメラを使う）
    @IBAction func setTapiImage(_ sender: Any) {
        useCamera()
    }
    //タピオカ名
    @IBOutlet var nameTextField: UITextField! {
        didSet { nameTextField.delegate = self as? UITextFieldDelegate}
    }
    
    enum PickerType {
        case sweetness
        case ice
    }
    //タピオカ甘さ,氷,ジャンル,店
    @IBOutlet var sweetnessTextField: UITextField!
    @IBOutlet var iceTextField: UITextField!
    
    var sweetnessPickerView =  ["0", "少なめ", "普通", "多め"]
    var icePickerView =  ["", "no", "less", "normal", "hot", "mild hot"]
    
    
    @IBAction func like1Button() {
        likeNumber = 1
    }
    @IBAction func like2Button() {
        likeNumber = 2
    }
    @IBAction func like3Button() {
        likeNumber = 3
    }
    @IBAction  func like4Button() {
        likeNumber = 4
    }
    @IBAction func like5Button() {
        likeNumber = 5
    }
    
        
    
    @objc func onDoneButtonTappedForSweetness(sender: UIBarButtonItem) {
        if sweetnessTextField.isFirstResponder {
            sweetnessTextField.resignFirstResponder()
        }
    }
    
    @objc func onDoneButtonTappedForIce(sender: UIBarButtonItem) {
        if iceTextField.isFirstResponder {
            iceTextField.resignFirstResponder()
        }
    }
    
//    var icePickerView: UIPickerView = UIPickerView()

    /*var commentTextView: UITextView! {
        didSet {commentTextView.delegate = self as? UITextViewDelegate
        }
    }*/
    
   override func viewDidLoad() {
        super.viewDidLoad()
    
        //Delegates
        commentTextView.delegate = self
    
        setupUIForSweetness()
        setupUIForIce()
    
    }
    @IBAction func save(_ sender: Any) {
        tapi.tapiName = nameTextField.text ?? ""
        tapi.tapiComment = commentTextView.text ?? ""
        tapi.tapiSweetness = sweetnessTextField.text ?? ""
        tapi.tapiIce = iceTextField.text ?? ""
        print("画像を選択してください2")
    
        guard let _selectedImage = selectedImage else {
            print("画像を選択してください")
            return
        }
        tapi.tapiImage = _selectedImage
        
        tapi.save()
        
        
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
}





extension PostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func useCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let picker = UIImagePickerController()
            
            picker.sourceType = .camera
            picker.delegate = self
            picker.allowsEditing = true
            
            print("カメラが使用できた!!!")
            present(picker, animated: true, completion: nil)
        } else {
            print("カメラが使用できませんでした")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        selectedImage = info[.editedImage] as? UIImage
        if let _selectedImage = selectedImage {
            tapiImageButton.setImage(_selectedImage, for: .normal)
        }
        
        dismiss(animated: true, completion: nil)
    }
    

    
}




private extension PostViewController {
    //ツールバーを表示
    var accessoryToolbarForSweetness: UIToolbar {
        get {
            let toolbarFrame = CGRect(x: 0, y: 0,
                                      width: view.frame.width, height: 44)
            let accessoryToolbar = UIToolbar(frame: toolbarFrame)
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                             target: self,
                                             action: #selector(onDoneButtonTappedForSweetness(sender:)))
            let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                                target: nil,
                                                action: nil)
            accessoryToolbar.items = [flexibleSpace, doneButton]
            accessoryToolbar.barTintColor = UIColor.white
            return accessoryToolbar
        }
    }
    var accessoryToolbarForIce: UIToolbar {
        get {
            let toolbarFrame = CGRect(x: 0, y: 0,
                                      width: view.frame.width, height: 44)
            let accessoryToolbar = UIToolbar(frame: toolbarFrame)
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                             target: self,
                                             action: #selector(onDoneButtonTappedForIce(sender:)))
            let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                                target: nil,
                                                action: nil)
            accessoryToolbar.items = [flexibleSpace, doneButton]
            accessoryToolbar.barTintColor = UIColor.white
            return accessoryToolbar
        }
    }
    func setupUIForSweetness() {
        //UIPickerViewのインスタンスを作る時に、引数にを渡す
        sweetnessTextField.inputView = getPickerView(type: .sweetness)
        sweetnessTextField.inputAccessoryView = accessoryToolbarForSweetness
        sweetnessTextField.text = sweetnessPickerView[0]
    }
    func setupUIForIce() {
        //UIPickerViewのインスタンスを作る時に、引数にを渡す
        iceTextField.inputView = getPickerView(type: .ice)
        iceTextField.inputAccessoryView = accessoryToolbarForIce
        iceTextField.text = icePickerView[0]
    }
    func getPickerView(type: PickerType) -> UIPickerView {
        //returnするためのpickerのインスタンス作成。
        let pickerView = UIPickerView()
        //タイプ分け。enumで定義した数だけswitch文でcase分け
        switch type {
        case .sweetness:
            pickerView.dataSource = sweetnessPickerView as? UIPickerViewDataSource
        case .ice:
            pickerView.dataSource = icePickerView as? UIPickerViewDataSource
        }
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.backgroundColor = UIColor.white
        
        return pickerView
    }
}

fileprivate class sweetnessPickerView: UIPickerView {}
fileprivate class icePickerView: UIPickerView {}


extension PostViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //getPickerView(type: PickerType)関数でタイプ分けされたインスタンスを判定して、pickerに表示する個数をそれぞれreturnする
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case is sweetnessPickerView:
            return sweetnessPickerView.count
        case is icePickerView:
            return icePickerView.count
        default:
            return sweetnessPickerView.count
        }
    }
}
extension PostViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) ->String? {
        switch pickerView {
        case is sweetnessPickerView:
            return sweetnessPickerView[row]
        case is icePickerView:
            return icePickerView[row]
        default:
            return sweetnessPickerView[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        switch pickerView {
        case is sweetnessPickerView:
            return sweetnessTextField.text = sweetnessPickerView[row]
        case is icePickerView:
            return iceTextField.text = icePickerView[row]
        default:
            return sweetnessTextField.text = sweetnessPickerView[row]
        }
    }
}
