//
//  StatisticCell.swift
//  PlantasticAlbeco
//
//  Created by Andrii Momot on 01.03.2025.
//

import SwiftUI

struct StatisticCell: View {
    var imageName: String
    var title: String
    var all: Double
    var completed: Double
    var accentColor: Color
    
    private var progress: Double { completed / all }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 12) {
                Image(imageName)
                Text(title)
                    .foregroundStyle(.black)
                    .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 14))
            }
            
            CustomLinearProgressView(
                progress: progress,
                backgroundColors: [accentColor.opacity(0.2)],
                progressColors: [accentColor],
                height: 6,
                cornerRadius: 6
            )
            
            Text("\(Int(completed))/\(Int(all))")
                .foregroundStyle(.gray)
                .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 12))
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    ZStack {
        Color.green.opacity(0.2)
        StatisticCell(imageName: Asset.tasksCompleted.name,
                      title: "50 Tasks",
                      all: 50,
                      completed: 7,
                      accentColor: .yellow)
        .padding()
    }
}
