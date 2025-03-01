//
//  FAQCell.swift
//  PlantasticAlbeco
//
//  Created by Andrii Momot on 01.03.2025.
//

import SwiftUI

struct FAQCell: View {
    let item: Item
    @State private var showText = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 1) {
            Button {
                withAnimation {
                    showText.toggle()
                }
            } label: {
                HStack {
                    Text(item.title)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .rotationEffect(.degrees(showText ? 180 : 0))
                }
                .foregroundStyle(.forestGreen)
                .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 16))
                .multilineTextAlignment(.leading)
                .padding()
                .background(.white)
                .cornerRadius(12, corners: showText ? [.topLeft, .topRight] : .allCorners)
            }
            .buttonStyle(PlainButtonStyle())
            
            if showText {
            HStack(spacing: 16) {
                Asset.faq.swiftUIImage
                
                Text(item.text)
                    .foregroundStyle(.forestGreen)
                    .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 16))
                    .multilineTextAlignment(.leading)
                
                Spacer()
            }
            .padding()
            .background(.mintGreen)
            .cornerRadius(12, corners: [.bottomLeft, .bottomRight])
            .shadow(color: .jadeGreen.opacity(0.2), radius: 1, y: 1)
        }
        }
    }
}

#Preview {
    ZStack {
        Color.honeydew
        FAQCell(item: .init(title: "How do I track my daily progress?",
                            text: "Track your progress through the main dashboard. Complete daily tasks to grow your virtual forest and level up your Forester status."))
        .padding()
    }
}

extension FAQCell {
    struct Item: Identifiable {
        private(set) var id = UUID().uuidString
        let title: String
        let text: String
    }
}
