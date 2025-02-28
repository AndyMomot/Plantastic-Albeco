//
//  TaskCell.swift
//  PlantasticAlbeco
//
//  Created by Andrii Momot on 28.02.2025.
//

import SwiftUI

struct TaskCell: View {
    let item: UserTask
    var onComplete: () -> Void
    
    var body: some View {
        HStack(spacing: 12) {
            Button {
                onComplete()
            } label: {
                RoundedRectangle(cornerRadius: 1)
                    .fill(item.isCompleted ? .blue : .white)
                    .scaledToFit()
                    .frame(width: 20)
                    .overlay {
                        if item.isCompleted {
                            Image(systemName: "checkmark")
                                .foregroundStyle(.white)
                        } else {
                            RoundedRectangle(cornerRadius: 1)
                                .stroke(.black, lineWidth: 1)
                                .padding(1)
                        }
                    }
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(item.name)
                    .foregroundStyle(.black)
                    .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 16))
                    .strikethrough(item.isCompleted)
                
                Text(item.date.toString(format: .ddMMYYHHmm))
                    .foregroundStyle(.gray)
                    .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 14))
            }
            
            Spacer()
            
            HStack {
                Text("+\(item.type.leafs) 🌱")
                    .foregroundStyle(.emeraldGreen)
                    .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 12))
            }
            .padding(5)
            .background(.jadeGreen.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        .padding(12)
        .background(.honeydew)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    VStack {
        TaskCell(item: .init(
            name: "Team meeting",
            type: .health,
            date: .init(),
            imageIds: []
        )) {}
        
        TaskCell(item: .init(
            name: "Team meeting",
            type: .health,
            date: .init(),
            imageIds: [],
            isCompleted: true
        )) {}
    }
    .padding()
}
