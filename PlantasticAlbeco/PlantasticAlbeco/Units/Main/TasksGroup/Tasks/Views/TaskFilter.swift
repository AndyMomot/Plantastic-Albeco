//
//  TaskFilter.swift
//  PlantasticAlbeco
//
//  Created by Andrii Momot on 28.02.2025.
//

import SwiftUI

struct TaskFilter: View {
    @Binding var selection: UserTask.TaskType?
    private let allTypes = UserTask.TaskType.allCases
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(allTypes, id: \.self) { item in
                let isSelected = selection == item
                
                Button {
                    withAnimation {
                        if isSelected {
                            selection = nil
                        } else {
                            selection = item
                        }
                    }
                } label: {
                    Text(item.rawValue)
                        .foregroundStyle(isSelected ? .white : .jadeGreen)
                        .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 14))
                        .multilineTextAlignment(.center)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .padding(.vertical, 8)
                        .padding(.horizontal)
                        .background(isSelected ? .emeraldGreen : .honeydew)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
        }
    }
}

#Preview {
    TaskFilter(selection: .constant(UserTask.TaskType.health))
        .padding()
}
