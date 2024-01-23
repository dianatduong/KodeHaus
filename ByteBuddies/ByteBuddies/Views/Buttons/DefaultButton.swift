//
//  defaultButton.swift
//  ByteBuddies
//
//  Created by Diana Duong on 1/22/24.
//

import SwiftUI

struct DefaultButton: View {
    
    var title: LocalizedStringKey
    
    var body: some View {
        
        Text(title)
            .foregroundColor(.white)
            .fontWeight(.bold)
            .padding()
            .frame(width:350, height:50)
            .background(LinearGradient(colors: [Color.magenta, Color.hotPink],
                                       startPoint: .leading,
                                       endPoint: .trailing))
            .cornerRadius(28)
    }
}

#Preview {
    DefaultButton(title: "Login")
}
