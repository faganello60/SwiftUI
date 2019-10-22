//
//  Category.swift
//  ChuckNorris
//
//  Created by Bruno Faganello Neto on 22/10/19.
//  Copyright © 2019 Bruno Faganello Neto. All rights reserved.
//

import UIKit

struct Category: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    
    init(value:String, position: Int) {
        self.id = position
        self.name = value
    }
    
    func convertPNGIntoJPEG(_ png:FILE) {
        
    }
    
    typealias imagePNG = FILE
    
    func convertTOJPEG(_ image: imagePNG) {
        
    }
    
}


struct CategoryBuilder {
    
    static func categories() -> [Category] {
        return categoryData.enumerated().compactMap { (index, element) in
            return Category(value: element, position: index)
        }
    }
}
