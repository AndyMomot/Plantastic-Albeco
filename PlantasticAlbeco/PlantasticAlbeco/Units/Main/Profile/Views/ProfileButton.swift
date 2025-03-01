//
//  ProfileButton.swift
//  PlantasticAlbeco
//
//  Created by Andrii Momot on 01.03.2025.
//

import SwiftUI

struct ProfileButton: View {
    let style: Style
    let title: String
    let systemImage: String
    
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Text(title)
                    
                    .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 16))
                Spacer()
                Image(systemName: systemImage)
            }
            .foregroundStyle(style.foregroundColor)
            .padding()
            .background(style.backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}

#Preview {
    ZStack {
        Color.green.opacity(0.2)
        
        VStack {
            ProfileButton(style: .normal,
                          title: "Privacy Policy",
                          systemImage: "chevron.right") {}
            
            ProfileButton(style: .destructive,
                          title: "Delete Data",
                          systemImage: "trash") {}
        }
        .padding()
    }
}

extension ProfileButton {
    enum Style {
        case normal, destructive
        
        var backgroundColor: Color {
            switch self {
            case .normal:
                return .white
            case .destructive:
                return .roseWhite
            }
        }
        
        var foregroundColor: Color {
            switch self {
            case .normal:
                return .forestGreen
            case .destructive:
                return .red
            }
        }
    }
}
