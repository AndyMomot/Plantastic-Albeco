//
//  ProfileImageView.swift
//  PlantasticAlbeco
//
//  Created by Andrii Momot on 01.03.2025.
//

import SwiftUI

struct ProfileImageView: View {
    @Binding var uiImage: UIImage
    
    @State private var showImagePicker = false
    
    var body: some View {
        Image(uiImage: uiImage)
            .resizable()
            .scaledToFill()
            .frame(width: 90, height: 90)
            .clipShape(Circle())
            .overlay {
                Circle()
                    .stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 5, y: 5)
            .onTapGesture {
                showImagePicker.toggle()
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(selectedImage: $uiImage)
            }
    }
}

#Preview {
    ZStack {
        Color.green
        ProfileImageView(uiImage: .constant(.preloader))
    }
}
