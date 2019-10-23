//
//  JokeDetail.swift
//  ChuckNorris
//
//  Created by Bruno Faganello Neto on 23/10/19.
//  Copyright © 2019 Bruno Faganello Neto. All rights reserved.
//

import SwiftUI

struct JokeDetail: View {
    var myOrange = UIColor(red: 224/255, green: 100/255, blue: 55/255, alpha: 1)
    
    var body: some View {
        VStack {
            Image("chuck")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.all,30)
            Spacer()
           
            Text("Detalhe da Piada")
                .font(.system(size:20))
            Spacer()
           
            Button(action: {
            
            }, label: {
                
                HStack {
                    Text("Outra Piada")
                }
                    .foregroundColor(Color.white)
                    .padding(.all,130)
                    .frame(height:50)
                    .background(Color(myOrange))
                
            }).padding(.bottom,10)
        }
        
        
        
    }
}

struct JokeDetail_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 8","iPhone 8 Plus", "iPhone XS Max"], id: \.self) { deviceName in
            JokeDetail()
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
