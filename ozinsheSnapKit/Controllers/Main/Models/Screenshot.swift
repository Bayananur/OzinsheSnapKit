//
//  Screenshots.swift
//  Ozinshe
//
//  Created by Nazerke Sembay on 17.07.2023.
//

import Foundation
import SwiftyJSON

struct Screenshot {
    public var id: Int = 0
    public var link: String = ""
    
    init(json: JSON) {
        if let temp = json["id"].int {
            self.id = temp
        }
        if let temp = json["link"].string {
            self.link = temp
        }
    }
}
