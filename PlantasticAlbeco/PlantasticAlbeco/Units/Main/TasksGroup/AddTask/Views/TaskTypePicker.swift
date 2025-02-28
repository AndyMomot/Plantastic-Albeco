//
//  TaskTypePicker.swift
//  PlantasticAlbeco
//
//  Created by Andrii Momot on 28.02.2025.
//

import SwiftUI

struct TaskTypePicker: View {
    @Binding var selection: UserTask.TaskType
    private let allTypes = UserTask.TaskType.allCases
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(allTypes, id: \.self) { item in
                let isSelected = selection == item
                let color = getColor(for: item)
                
                Button {
                    withAnimation {
                        selection = item
                    }
                } label: {
                    HStack(spacing: 4) {
                        Spacer()
                        Image(item.icon)
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16)
                            .foregroundStyle(isSelected ? .white : color)
                        
                        Text(item.rawValue)
                            .foregroundStyle(isSelected ? .white : color)
                            .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 16))
                            .multilineTextAlignment(.center)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                        Spacer()
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 12)
                    .background(isSelected ? color : color.opacity(0.1))
                    .clipShape(Capsule())
                }
            }
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

private extension TaskTypePicker {
    func getColor(for type: UserTask.TaskType) -> Color {
        switch type.color {
        case .red:
            return .red
        case .blue:
            return .blue
        case .purple:
            return .purple
        }
    }
}

#Preview {
    ZStack {
        Color.green
        TaskTypePicker(selection: .constant(.personal))
            .padding()
    }
}
