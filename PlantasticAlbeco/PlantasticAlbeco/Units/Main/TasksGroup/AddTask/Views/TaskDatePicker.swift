//
//  TaskDatePicker.swift
//  PlantasticAlbeco
//
//  Created by Andrii Momot on 28.02.2025.
//

import SwiftUI

struct TaskDatePicker: View {
    @Binding var date: Date
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 8) {
                Asset.calendar.swiftUIImage
                Text("Due Date")
                    .foregroundStyle(.black)
                    .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 14))
                
                Spacer()
                
                Text(date.toString(format: .ddMMYYHHmm))
                    .foregroundStyle(.black)
                    .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 14))
            }
            
            DatePicker("Due Date",
                       selection: $date,
                       in: Date()...,
                       displayedComponents: [.date, .hourAndMinute])
            .labelsHidden()
            .datePickerStyle(.graphical)
            .tint(.emeraldGreen)
        }
        .padding([.top, .horizontal])
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    TaskDatePicker(date: .constant(.init()))
}
