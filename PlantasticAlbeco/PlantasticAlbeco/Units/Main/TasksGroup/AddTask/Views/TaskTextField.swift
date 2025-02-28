//
//  TaskTextField.swift
//  PlantasticAlbeco
//
//  Created by Andrii Momot on 28.02.2025.
//

import SwiftUI

struct TaskTextField: View {
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            TextField(text: $text) {
                Text("What needs to be done?")
                    .foregroundStyle(.gray)
            }
            .foregroundStyle(.black)
            .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 18))
            
            HStack(spacing: 6) {
                Text("Suggestions:")
                    .foregroundStyle(.gray)
                Text("Water plants Daily exercise")
                    .foregroundStyle(.emeraldGreen)
            }
            .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 12))
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    ZStack {
        Color.green
        
        TaskTextField(text: .constant(""))
            .padding()
    }
}
