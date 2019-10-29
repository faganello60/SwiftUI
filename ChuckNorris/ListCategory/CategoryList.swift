//
//  CategoryList.swift
//  ChuckNorris
//
//  Created by Bruno Faganello Neto on 22/10/19.
//  Copyright © 2019 Bruno Faganello Neto. All rights reserved.
//

import SwiftUI

struct CategoryList: View {
    @ObservedObject var viewModel = CategoryListViewModel()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.red]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.blue]
    }
    
    var body: some View {
        NavigationView{
            List(viewModel.category, id: \.id) { category in
                NavigationLink(destination: JokeDetail(viewModel: JokeDetailViewModel(category: category))) {
                    CategoryRow(category: category)
                }
            }
                
            .navigationBarTitle("Categories")
            .navigationBarItems(leading:
                Button(action: {
                    self.viewModel.shuffle()
                }, label: {
                    Text("Shuffle")
                }), trailing:
                Button(action: {
                    self.viewModel.load()
                }, label: {
                    Image(systemName: "arrow.2.circlepath")
                })
            )
        }.onAppear {
            self.viewModel.load()
        }
    }
}

struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList()
    }
}
