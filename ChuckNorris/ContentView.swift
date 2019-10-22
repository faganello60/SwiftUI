//
//  ContentView.swift
//  ChuckNorris
//
//  Created by Bruno Faganello Neto on 22/10/19.
//  Copyright © 2019 Bruno Faganello Neto. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .frame(height: 300)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
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
            
            Spacer()
            
            HStack {
                
                Button(action: {
                    
                }, label: {
                    Text("Começar")
                        .foregroundColor(Color.white)
                        .padding(.leading,70)
                        .padding(.trailing,70)
                        .frame(height:50)
                        .background(Color.pink)
                })
                    
                    
                
            }.padding(.bottom,10)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 8", "iPhone XS Max"], id: \.self) { deviceName in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
