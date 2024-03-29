//
//  ghostButton.swift
//  KodeHaus
//
//  Created by Diana Duong on 1/22/24.
//

import SwiftUI

struct SecondaryBtn: View {
    @Environment(\.colorScheme) var colorScheme

    
    var title: String
    
    var body: some View {
        
        Text(title)
            .foregroundColor(colorScheme == .dark ? .white : .magenta1)
            .fontWeight(.semibold)
            .padding()
            .frame(width:175, height:50)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(LinearGradient(colors: [Color.magenta1, Color.blue1], startPoint: .leading, endPoint: .trailing), lineWidth: 3)
            )
    }
}

struct GhostButton_Previews: PreviewProvider {
    
    static var previews: some View {
        SecondaryBtn(title: "Create an Account")
    }
}


