//
//  CircleImage.swift
//  ChuckNorris
//
//  Created by Bruno Faganello Neto on 22/10/19.
//  Copyright © 2019 Bruno Faganello Neto. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("chuck")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.orange, lineWidth: 4)
            )
            .shadow(radius: 20)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
