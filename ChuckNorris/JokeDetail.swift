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
    
    @ObservedObject var viewModel: JokeDetailViewModel
    
    var myOrange = UIColor(red: 224/255, green: 100/255, blue: 55/255, alpha: 1)
    
    init(viewModel:JokeDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Image("chuck")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.all,30)
            Spacer()
           
            Text(LocalizedStringKey(stringLiteral: viewModel.jokeDetail?.value ?? "Carregando..."))
                .font(.system(size:20))
                .padding(.all,30)
            Spacer()
           
            Button(action: {
                self.viewModel.load()
            }, label: {
                
                HStack {
                    Text("Outra Piada")
                }
                    .foregroundColor(Color.white)
                    .padding(.all,130)
                    .frame(height:50)
                    .background(Color(myOrange))
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
