//
//  ContentViewRow.swift
//  Learning
//
//  Created by Clive Rudd Fernandez on 12/27/21.
//

import SwiftUI

struct ContentViewRow: View {

    @State var index:Int
    @State var title:String
    @State var duration:String

    var body: some View {
        
        //Lesson Card
        ZStack (alignment: .leading){
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 10)
                .frame(height: 66)
            
            HStack (spacing: 30){
                Text(String(index + 1))
                    .bold()
                
                VStack (alignment: .leading){
                    Text(title)
                        .bold()
                    Text(duration)
                }
            }.padding()
        }.padding(.bottom, 5)
    }
}

