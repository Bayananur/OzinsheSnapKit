//
//  Category.swift
//  Ozinshe
//
//  Created by Nazerke Sembay on 16.07.2023.
//

import Foundation
import SwiftyJSON

struct Category {
    public var id = ""
    public var name = ""
    public var link = ""
    
    init(json: JSON) {
        if let temp = json["id"].string {
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
