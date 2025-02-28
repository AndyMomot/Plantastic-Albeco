//
//  CompletedTasksProgress.swift
//  PlantasticAlbeco
//
//  Created by Andrii Momot on 28.02.2025.
//

import SwiftUI

struct CompletedTasksProgress: View {
    let allTasks: Int
    let completedTasks: Int
    
    var body: some View {
        let progress = Double(allTasks) / Double(completedTasks)
        
        return VStack(spacing: 12) {
            HStack {
                Text("Today's Progress")
                    .foregroundStyle(.forestGreen)
                    .font(Fonts.SFProDisplay.semibold.swiftUIFont(size: 18))
                
                Spacer()
                
                Text("\(completedTasks)/\(allTasks) tasks")
                    .foregroundStyle(.emeraldGreen)
                    .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 14))
            }
            
            CustomLinearProgressView(
                progress: progress,
                backgroundColors: [.honeydew],
                progressColors: [.emeraldGreen],
                height: 8,
                cornerRadius: 8
            )
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    ZStack {
        Color.honeydew
        CompletedTasksProgress(allTasks: 7, completedTasks: 10)
            .padding()
    }
}
