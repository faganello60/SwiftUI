//
//  Detail.swift
//  ChuckNorris
//
//  Created by Bruno Faganello Neto on 29/10/19.
//  Copyright © 2019 Bruno Faganello Neto. All rights reserved.
//

import UIKit

struct Detail: Codable, Identifiable {
    let icon:String
    let id:String
    let url:String
    let value:String
    
    private enum CodingKeys: String, CodingKey {
        case icon = "icon_url"
        case id = "id"
        case url = "url"
        case value = "value"
    }
}
