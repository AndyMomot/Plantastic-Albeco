//
//  TipCell.swift
//  PlantasticAlbeco
//
//  Created by Andrii Momot on 01.03.2025.
//

import SwiftUI

struct TipCell: View {
    let item: Item
    
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(spacing: 12) {
                Asset.tip.swiftUIImage
                Text(item.title)
                    .foregroundStyle(.forestGreen)
                    .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 16))
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                Spacer()
            }
            
            Text(item.text)
                .foregroundStyle(.jadeGreen)
                .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 14))
                .lineLimit(2)
                .minimumScaleFactor(0.5)
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    ZStack {
        Color.honeydew
        TipCell(item: .init(title: "Morning Routine",
                            text: "Start your day with the most important task to build momentum."))
        .padding()
    }
}

extension TipCell {
    struct Item: Identifiable {
        private(set) var id = UUID().uuidString
        let title: String
        let text: String
    }
}
