//
//  JokeDetailViewModel.swift
//  ChuckNorris
//
//  Created by Bruno Faganello Neto on 29/10/19.
//  Copyright © 2019 Bruno Faganello Neto. All rights reserved.
//

import SwiftUI
import Combine

class JokeDetailViewModel: ObservableObject {
    
    //--------------------------------------------------
    // MARK: - Public Properties
    //--------------------------------------------------
    
    @Published var jokeDetail:Detail? = nil
    
    //--------------------------------------------------
    // MARK: - Private Properties
    //--------------------------------------------------
   
    private let category:Category
    
    //--------------------------------------------------
    // MARK: - Init
    //--------------------------------------------------
    
    init(category:Category) {
        self.category = category
    }
    
    init() {
        self.category = Category(value: "", position: 0)
    }
    
    
    func load() {
        guard let url = URL(string: "https://api.chucknorris.io/jokes/random?category=\(category.name)") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                guard let data = data else { return }
                let detail = try JSONDecoder().decode(Detail.self, from: data)
                DispatchQueue.main.async {
                    self.jokeDetail = detail
                }
            } catch {
                print("Failed To decode: ", error)
            }
        }.resume()
    }
}
