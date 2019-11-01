//
//  CategoryListViewModel.swift
//  ChuckNorris
//
//  Created by Bruno Faganello Neto on 29/10/19.
//  Copyright © 2019 Bruno Faganello Neto. All rights reserved.
//

import UIKit
import Combine
import SwiftUI

class CategoryListViewModel: ObservableObject {
    @Published var category:[Category] = []
    
    func load() {
        guard let url = URL(string: "https://api.chucknorris.io/jokes/categories") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                guard let data = data else { return }
                let categories = try JSONDecoder().decode([String].self, from: data)
                DispatchQueue.main.async {
                    categoryData = categories
                    self.category = CategoryBuilder.categories()
                }
            } catch {
                print("Failed To decode: ", error)
            }
            }.resume()
    }
    
    func shuffle() {
        self.category = self.category.shuffled()
    }
}
