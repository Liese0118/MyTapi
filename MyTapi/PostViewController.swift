//
//  PostViewController.swift
//  MyTapi
//
//  Created by 瓜生理世 on 2019/04/29.
//  Copyright © 2019 瓜生理世. All rights reserved.
//

import UIKit
import RealmSwift

class PostViewController: UIViewController {
    
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
    //タピオカ甘さ
    //@IBOutlet var sweetnessTextField: UITextField!
      // var sweetnessPickerView: UIPickerView = UIPickerView()
       // let list = ["0", "少なめ", "普通", "多め"]
    //タピオカの氷量
   // @IBOutlet var iceTextField: UITextField!
   // var icePickerView: UIPickerView = UIPickerView!
   // let list = ["", "no", "less", "normal", "hot", "mild hot"]
    
    //タピオカのお気に入り度(星ボタン x/5で表示)
    //1
    //@IBAction func like1() {
     //   likeNumber == 1
   // }
    //2
   // @IBAction func like2() {
    //    likeNumber == 2
    //}
    //3
   // @IBAction func like3() {
   //     likeNumber == 3
    }
    //4
   // @IBAction func like4() {
   //     likeNumber == 4
    //5
  //  @IBAction func like5() {
        //likeNumber == 5
//}
var commentTextView: UITextView! {
    didSet {commentTextView.delegate = self
        
    }
}
    
//   override func viewDidLoad() {
//        super.viewDidLoad()
//        sweetnessPickerView.dataSource = self
//        sweetnessPickerView.delegate = self
//        sweetnessPickerView.showsSelectionIndicator = true
//        // Do any additional setup after loading the view.
//        icePickerView.dataSource = self
//        icePickerView.delegate = self
//        icePickerView.showsSelectionIndicator = true
//
//        let toolbar = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
//        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(ViewController.done))
//        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(ViewController.cancel))
//        toolbar.setItems([cancelItem, doneItem], animated: true)
//
//        self.sweetnessTextField.inputView = sweetnessPickerView
//        self.sweetnessTextField.inputAccessoryView = toolbar
//
//        self.iceTextField.inputView = icePickerView
//        self.iceTextField.inputAccessoryView = toolbar
//
//
//    }

//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func sweetnessPickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return list.count
//    }
//
//    func sweetnessPickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return list[row]
//    }
//
//    func sweetnessPickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        self.textField.text = list[row]
//    }
//
//    func cancel() {
//        self.sweetnessTextField.text = ""
//        self.sweetnessTextField.endEditing(true)
//    }
//
//    func done() {
//        self.sweetnessTextField.endEditing(true)
//    }
//
//    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
//        return CGRect(x: x, y: y, width: width, height: height)
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

func save(_ sender: Any) {
        Tapi.tapiName      = nameTextField.text; ??""
        Tapi.tapiComment   = commentTextView.text; ??""
        
        
        guard let _selectedImage = selectedImage else {
            print("画像を選択してください")
            return
        }
        Tapi.tapiImage = _selectedImage
        
        Tapi.save()
        
        
        self.dismiss(animated: true, completion: nil)
    }

extension PostViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        selectedImage = info[.editedImage] as? UIImage
        if let _selectedImage = selectedImage {
            tapiImageButton.setImage(_selectedImage, for: .normal)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func useCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let picker = UIImagePickerController()
            
            picker.sourceType = .camera
            picker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            picker.allowsEditing = true
            
            present(picker, animated: true, completion: nil)
        } else {
            print("カメラが使用できませんでした")
        }
    }
}

