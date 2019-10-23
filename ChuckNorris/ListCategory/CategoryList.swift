//
//  CategoryList.swift
//  ChuckNorris
//
//  Created by Bruno Faganello Neto on 22/10/19.
//  Copyright © 2019 Bruno Faganello Neto. All rights reserved.
//

import SwiftUI

struct CategoryList: View {
    let categories = CategoryBuilder.categories()
    
    var body: some View {
        NavigationView{
            
            List(categories, id: \.id) { category in
                NavigationLink(destination: ContentView()) {
                    
                    CategoryRow(category: category)
                }
            }
            .navigationBarTitle("Categories")
            .accentColor(Color.orange)
        }
    }
}

struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList()
    }
}
