//
//  ContentView.swift
//  ChuckNorris
//
//  Created by Bruno Faganello Neto on 22/10/19.
//  Copyright © 2019 Bruno Faganello Neto. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var shouldShowView: Bool = false
    
    
    
    var body: some View {
        VStack {
            MapView()
                .frame(height: 300)
                .accessibility(sortPriority: 1)

            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
                .accessibility(sortPriority: 2)
            
            VStack(alignment: .leading) {
                Text("Chuck Norris API")
                    .font(.title)
                HStack {
                    Text("Primeiros Testes com SwiftUI")
                        .font(.subheadline)
                    Spacer()
                    Text("by: Bruno Faganello")
                }
            }
            .padding()
            .accessibility(sortPriority: 50)
            Spacer()
            
            HStack {
                
                Button(action: {
                    self.shouldShowView = true
                }, label: {
                    
                    HStack {
                        Image(systemName: "e.circle.fill")
                        Text("Começar")
                        
                    }.foregroundColor(Color.white)
                        .padding(.leading,70)
                    .padding(.trailing,70)
                    .frame(height:50)
                    .background(Color.pink)
                    
                }).sheet(isPresented: $shouldShowView) {
                    CategoryList()
                }

            }.padding(.bottom,10)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 8","iPhone 8 Plus", "iPhone XS Max"], id: \.self) { deviceName in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
