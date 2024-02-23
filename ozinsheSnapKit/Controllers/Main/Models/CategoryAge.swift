//
//  CategoryAge.swift
//  Ozinshe
//
//  Created by Nazerke Sembay on 17.07.2023.
//

import Foundation
import SwiftyJSON

struct CategoryAge {
    public var id: Int = 0
    public var name: String = ""
    public var link: String = ""
    
    init(json: JSON) {
        if let temp = json["id"].int {
            self.id = temp
        }
        if let temp = json["name"].string {
            self.name = temp
        }
        if let temp = json["link"].string {
            self.link = temp
        }
    }
}

