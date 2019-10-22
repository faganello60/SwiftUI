//
//  CategoryRow.swift
//  ChuckNorris
//
//  Created by Bruno Faganello Neto on 22/10/19.
//  Copyright © 2019 Bruno Faganello Neto. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    var category: Category
    
    var body: some View {
        HStack {
            Text(category.name)
                .multilineTextAlignment(.leading)
            Spacer()
        }
        .padding()
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CategoryRow(category: CategoryBuilder.categories()[0])
            CategoryRow(category: CategoryBuilder.categories()[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
