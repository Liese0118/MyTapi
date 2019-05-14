//
//  PostViewController.swift
//  MyTapi
//
//  Created by 瓜生理世 on 2019/04/29.
//  Copyright © 2019 瓜生理世. All rights reserved.
//

import UIKit
import RealmSwift

class PostViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    var tapi = Tapi.create()
    var likeNumber: Int = 0
    
    let likeImage:UIImage = UIImage(named:"likeButton.png")!
    let likedImage:UIImage = UIImage(named:"likedButton.PNG")!
    //IBOutlets
    //タピオカの写真addボタン
    @IBAction func setTapiImage(_ sender: Any) {
        useCamera()
    }
    @IBOutlet var tapiImageButton: UIButton!
    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var sweetnessTextField: UITextField!
    @IBOutlet var iceTextField: UITextField!
    @IBOutlet var like1Button: UIButton!
    @IBOutlet var like2Button: UIButton!
    @IBOutlet var like3Button: UIButton!
    @IBOutlet var like4Button: UIButton!
    @IBOutlet var like5Button: UIButton!
    @IBAction func like1Tapped() {
        if(likeNumber == 1){
            like1Button.isSelected = false
            like2Button.isSelected = false
            like3Button.isSelected = false
            like4Button.isSelected = false
            like5Button.isSelected = false
            likeNumber = 0
        }
        else{
            like1Button.isSelected = true
            like2Button.isSelected = false
            like3Button.isSelected = false
            like4Button.isSelected = false
            like5Button.isSelected = false
            likeNumber = 1
        }
        
    }
    @IBAction func like2Tapped() {
        if(likeNumber == 2){
            like1Button.isSelected = false
            like2Button.isSelected = false
            like3Button.isSelected = false
            like4Button.isSelected = false
            like5Button.isSelected = false
            likeNumber = 0
        }
        else{
            like1Button.isSelected = true
            like2Button.isSelected = true
            like3Button.isSelected = false
            like4Button.isSelected = false
            like5Button.isSelected = false
            likeNumber = 2
        }
    }
    @IBAction func like3Tapped() {
        if(likeNumber == 3){
            like1Button.isSelected = false
            like2Button.isSelected = false
            like3Button.isSelected = false
            like4Button.isSelected = false
            like5Button.isSelected = false
            likeNumber = 0
        }
        else{
            like1Button.isSelected = true
            like2Button.isSelected = true
            like3Button.isSelected = true
            like4Button.isSelected = false
            like5Button.isSelected = false
            likeNumber = 3
    }
    }
    @IBAction func like4Tapped() {
        if(likeNumber == 4) {
            like1Button.isSelected = false
            like2Button.isSelected = false
            like3Button.isSelected = false
            like4Button.isSelected = false
            like5Button.isSelected = false
            likeNumber = 0
        }
        else{
            like1Button.isSelected = true
            like2Button.isSelected = true
            like3Button.isSelected = true
            like4Button.isSelected = true
            like5Button.isSelected = false
            likeNumber = 4
}
    }
    @IBAction func like5Tapped() {
        if(likeNumber == 5) {
            like1Button.isSelected = false
            like2Button.isSelected = false
            like3Button.isSelected = false
            like4Button.isSelected = false
            like5Button.isSelected = false
            likeNumber = 0
        }
        else{
            like1Button.isSelected = true
            like2Button.isSelected = true
            like3Button.isSelected = true
            like4Button.isSelected = true
            like5Button.isSelected = true
            likeNumber = 5
        }
    }
    
    func printstuff() {
        
        print()
        
    }
    
    var selectedImage: UIImage!

    enum PickerType {
        case sweetness
        case ice
    }
    
    var sweetness: UIPickerView = UIPickerView()
    var sweetnessPickerViewContent =  ["0", "少なめ", "普通", "多め"]
    
    var ice: UIPickerView = UIPickerView()
    var icePickerViewContent =  ["", "no", "less", "normal", "hot", "mild hot"]
    
    
    
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
    like1Button.setImage(likeImage, for: .normal)
    like1Button.setImage(likedImage, for: .selected)
    like2Button.setImage(likeImage, for: .normal)
    like2Button.setImage(likedImage, for: .selected)
    like3Button.setImage(likeImage, for: .normal)
    like3Button.setImage(likedImage, for: .selected)
    like4Button.setImage(likeImage, for: .normal)
    like4Button.setImage(likedImage, for: .selected)
    like5Button.setImage(likeImage, for: .normal)
    like5Button.setImage(likedImage, for: .selected)
    
    
    like1Button.isSelected = false
    like2Button.isSelected = false
    like3Button.isSelected = false
    like4Button.isSelected = false
    like5Button.isSelected = false
    
        //Delegates
        commentTextView.delegate = self
        nameTextField.delegate = self
        sweetnessTextField.delegate = self
        iceTextField.delegate = self

        setupUIForSweetness()
        setupUIForIce()
    }
    
    @IBAction func save(_ sender: Any) {
        
        tapi.tapiName = nameTextField.text ?? ""
        tapi.tapiComment = commentTextView.text ?? ""
        tapi.tapiSweetness = sweetnessTextField.text ?? ""
        tapi.tapiIce = iceTextField.text ?? ""
        tapi.tapiLike = likeNumber
        print("画像を選択してください2")
    
        guard let _selectedImage = selectedImage else {
            print("画像を選択してください")
            return
        }
        tapi.tapiImage = _selectedImage
        
        tapi.save()
        
//        UIView.animate(withDuration: 0, delay: 1.0, animations: {
//            self.dismiss(animated: true, completion: nil)
//        }, completion: { finished in
//
//        })
        //self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
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
        sweetnessTextField.inputView = getPickerView(type: .sweetness)
        sweetnessTextField.inputAccessoryView = accessoryToolbarForSweetness
        sweetnessTextField.text = sweetnessPickerViewContent[0]
    }
    func setupUIForIce() {
        iceTextField.inputView = getPickerView(type: .ice)
        iceTextField.inputAccessoryView = accessoryToolbarForIce
        iceTextField.text = icePickerViewContent[0]
    }
    
    func getPickerView(type: PickerType) -> UIPickerView {
        //returnするためのpickerのインスタンス作成。
        var pickerView = UIPickerView()
        //タイプ分け。enumで定義した数だけswitch文でcase分け
        switch type {
        case .sweetness:
            pickerView = sweetnessPickerView()
        case .ice:
            pickerView = icePickerView()
        }
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.backgroundColor = UIColor.white
        
        return pickerView
    }
}

fileprivate class sweetnessPickerView: UIPickerView {}
fileprivate class icePickerView: UIPickerView {}


extension PostViewController {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //getPickerViewでタイプ分けされたインスタンスを判定して、pickerに表示する個数をそれぞれ返す
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case is sweetnessPickerView:
            return sweetnessPickerViewContent.count
        case is icePickerView:
            return icePickerViewContent.count
        default:
            return sweetnessPickerViewContent.count
        }
    }
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) ->String? {
        switch pickerView {
        case is sweetnessPickerView:
            return sweetnessPickerViewContent[row]
        case is icePickerView:
            return icePickerViewContent[row]
        default:
            return sweetnessPickerViewContent[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        switch pickerView {
        case is sweetnessPickerView:
            return sweetnessTextField.text = sweetnessPickerViewContent[row]
        case is icePickerView:
            return iceTextField.text = icePickerViewContent[row]
        default:
            return sweetnessTextField.text = sweetnessPickerViewContent[row]
        }
    }
}
