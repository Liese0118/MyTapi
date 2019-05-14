//
//  DetailViewController.swift
//  MyTapi
//
//  Created by 瓜生理世 on 2019/04/30.
//  Copyright © 2019 瓜生理世. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    let likeImage:UIImage = UIImage(named:"likeButton.png")!
    let likedImage:UIImage = UIImage(named:"likedButton.PNG")!
    
    @IBOutlet var image: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var sweetnessLabel: UILabel!
    @IBOutlet var iceLabel: UILabel!
    @IBOutlet var commentLabel: UILabel!
    @IBOutlet var like1: UIImageView!
    @IBOutlet var like2: UIImageView!
    @IBOutlet var like3: UIImageView!
    @IBOutlet var like4: UIImageView!
    @IBOutlet var like5: UIImageView!
    func like() {
        if (likeNumber == 0) {
            self.like1.image = UIImage(named: "likeButton.png")
            self.like2.image = UIImage(named: "likeButton.png")
            self.like3.image = UIImage(named: "likeButton.png")
            self.like4.image = UIImage(named: "likeButton.png")
            self.like5.image = UIImage(named: "likeButton.png")
        }
        else if (likeNumber == 1) {
            self.like1.image = UIImage(named: "likedButton.PNG")
            self.like2.image = UIImage(named: "likeButton.png")
            self.like3.image = UIImage(named: "likeButton.png")
            self.like4.image = UIImage(named: "likeButton.png")
            self.like5.image = UIImage(named: "likeButton.png")
        }
        else if (likeNumber == 2){
            self.like1.image = UIImage(named: "likedButton.PNG")
            self.like2.image = UIImage(named: "likedButton.PNG")
            self.like3.image = UIImage(named: "likeButton.png")
            self.like4.image = UIImage(named: "likeButton.png")
            self.like5.image = UIImage(named: "likeButton.png")
        }
        else if (likeNumber == 3) {
            self.like1.image = UIImage(named: "likedButton.PNG")
            self.like2.image = UIImage(named: "likedButton.PNG")
            self.like3.image = UIImage(named: "likedButton.PNG")
            self.like4.image = UIImage(named: "likeButton.png")
            self.like5.image = UIImage(named: "likeButton.png")
        }
        else if (likeNumber == 4) {
            self.like1.image = UIImage(named: "likedButton.PNG")
            self.like2.image = UIImage(named: "likedButton.PNG")
            self.like3.image = UIImage(named: "likedButton.PNG")
            self.like4.image = UIImage(named: "likedButton.PNG")
            self.like5.image = UIImage(named: "likeButton.png")
        }
        else {
            self.like1.image = UIImage(named: "likedButton.PNG")
            self.like2.image = UIImage(named: "likedButton.PNG")
            self.like3.image = UIImage(named: "likedButton.PNG")
            self.like4.image = UIImage(named: "likedButton.PNG")
            self.like5.image = UIImage(named: "likedButton.PNG")
        }
        }


    @IBAction func deleteButton(){}
    
    var tapiArray: [Tapi]!
    var number: Int!
    var likeNumber: Int!
    
    //var starOne

    override func viewDidLoad() {
        super.viewDidLoad()
        tapiArray = Tapi.loadAll()
        setUpDetail()
        like()
        // Do any additional setup after loading the view.
    }
}
extension DetailViewController {
    
    func setUpDetail() {
        image.image = tapiArray[number].tapiImage
        nameLabel.text = tapiArray[number].tapiName
        commentLabel.text = tapiArray[number].tapiComment
        sweetnessLabel.text = tapiArray[number].tapiSweetness
        iceLabel.text = tapiArray[number].tapiIce
        likeNumber = tapiArray[number].tapiLike
        
        
    }
}

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

