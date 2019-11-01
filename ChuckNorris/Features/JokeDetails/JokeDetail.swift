//
//  JokeDetail.swift
//  ChuckNorris
//
//  Created by Bruno Faganello Neto on 23/10/19.
//  Copyright © 2019 Bruno Faganello Neto. All rights reserved.
//

import SwiftUI
import Combine

struct JokeDetail: View {
    
    //--------------------------------------------------
    // MARK: - Private Properties
    //--------------------------------------------------
    
    @ObservedObject private var viewModel: JokeDetailViewModel
    @State private var clicked = false

    private var animation: Animation {
        Animation.spring(dampingFraction: 0.5)
            .speed(1)
            .delay(0)
    }
    
    //--------------------------------------------------
    // MARK: - Inits
    //--------------------------------------------------
    
    init(viewModel:JokeDetailViewModel) {
        self.viewModel = viewModel
    }
    
    //--------------------------------------------------
    // MARK: - Body
    //--------------------------------------------------
    
    var body: some View {
        VStack {
            Image("chuck")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.all,30)
                .modifier(ShakeEffect(shakes: self.clicked ? 3 : 0))
                .animation(.linear)
            Spacer()
           
            if viewModel.jokeDetail != nil {
                Text(LocalizedStringKey(stringLiteral: viewModel.jokeDetail?.value ?? "Carregando..."))
                    .font(.system(size:20))
                    .padding(.all,30)
                    .transition(.moveAndFade)
                    .animation(animation)
                Spacer()
            }
            
            Button(action: {
                withAnimation{
                    self.clicked.toggle()
                    self.viewModel.load()
                }
            }, label: {
                
                HStack {
                    Text("Outra Piada")
                }
                    .foregroundColor(Color.white)
                    .padding(.all,130)
                    .frame(height:50)
                    .background(Color.blue)
                    .cornerRadius(15)
            })
                .padding(.bottom,10)
        }.onAppear {
            self.viewModel.load()
        }
    }
}

struct JokeDetail_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 8","iPhone 8 Plus", "iPhone XS Max"], id: \.self) { deviceName in
            JokeDetail(viewModel: JokeDetailViewModel(category: Category(value: "dev", position: 0)))
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
