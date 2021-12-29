//
//  RectangleCard.swift
//  Learning
//
//  Created by Clive Rudd Fernandez on 12/29/21.
//

import SwiftUI

struct RectangleCard: View {
    
    @State var height:CGFloat
    @State var color = Color.white
    
    var body: some View {
        Rectangle()
            .foregroundColor(color)
            .cornerRadius(10)
            .shadow(radius: 5)
            .frame(height: height)
    }
}

struct RectangleCard_Previews: PreviewProvider {
    static var previews: some View {
        RectangleCard(height: 48, color: Color.white)
    }
}
