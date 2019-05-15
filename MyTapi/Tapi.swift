//
//  Tapi.swift
//  MyTapi
//
//  Created by 瓜生理世 on 2019/04/30.
//  Copyright © 2019 瓜生理世. All rights reserved.
//

import Foundation
import RealmSwift

final class Tapi: Object {
    static let realm = try! Realm()

    @objc dynamic var id = 0
    @objc dynamic var tapiName: String = ""
    @objc dynamic var tapiSweetness: String = ""
    @objc dynamic var tapiIce: String = ""
    @objc dynamic var tapiShop: String = ""
    @objc dynamic var tapiComment: String = ""
    @objc dynamic var tapiLike: Int = 0
    
    
    @objc dynamic private var _tapiImage: UIImage? = nil
    @objc dynamic var tapiImage: UIImage? {
        set {
            self._tapiImage = newValue
            if let value = newValue {
                self.tapiImageData = value.jpegData(compressionQuality: 1)
            }
        }
        get {
            if let image = self._tapiImage {
                return image
            }
            
            if let data = self.tapiImageData {
                self._tapiImage = UIImage(data: data)
                return self._tapiImage
            }
            
            return nil
        }
    }
    
    @objc dynamic private var tapiImageData: Data? = nil
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    override static func ignoredProperties() -> [String] {
        return ["_tapiImage", "tapiImage"]
    }
    
    static func lasdId() -> Int {
        if let tapi = realm.objects(Tapi.self).last {
            return tapi.id + 1
        } else {
            return 0
        }
    }
    
    static func create() -> Tapi {
        let tapi = Tapi()
        tapi.id = lasdId()
        return tapi
    }
    
    func save() {
        try! Tapi.realm.write {
            Tapi.realm.add(self)
        }
    }
    
    static func loadAll() -> [Tapi] {
        let tapis = realm.objects(Tapi.self).sorted(byKeyPath: "id", ascending: true)
        var array: [Tapi] = []
        for tapi in tapis {
            array.append(tapi)
        }
        
        return array
    }
}

