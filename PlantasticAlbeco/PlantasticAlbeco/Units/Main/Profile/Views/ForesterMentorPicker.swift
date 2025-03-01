//
//  ForesterMentorPicker.swift
//  PlantasticAlbeco
//
//  Created by Andrii Momot on 01.03.2025.
//

import SwiftUI

struct ForesterMentorPicker: View {
    
    @Binding var selection: Mentor
    private let mentors = Mentor.allCases
    
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Your Forest Mentor")
                .foregroundStyle(.emeraldGreen)
                .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 14))
            
            HStack(spacing: 12) {
                ForEach(mentors, id: \.rawValue) { mentor in
                    let isSelected = selection == mentor
                    
                    Button {
                        withAnimation {
                            selection = mentor
                        }
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.white)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(
                                            isSelected ? .emeraldGreen : .clear,
                                            lineWidth: 2
                                        )
                                }
                            
                            VStack(spacing: 8) {
                                mentor.image
                                    .renderingMode(.template)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30)
                                    
                                Text(mentor.rawValue)
                                    .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 14))
                                    .multilineTextAlignment(.center)
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.5)
                            }
                            .foregroundStyle(isSelected ? .emeraldGreen : .gray)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .frame(height: 94)
        }
    }
}

#Preview {
    ZStack {
        Color.green.opacity(0.2)
        ForesterMentorPicker(selection: .constant(.beaver))
            .padding()
    }
}

extension ForesterMentorPicker {
    enum Mentor: String, CaseIterable {
        case beaver = "Beaver"
        case moose = "Moose"
        case bear = "Bear"
        
        var image: Image {
            switch self {
            case .beaver:
                return Asset.beaver.swiftUIImage
            case .moose:
                return Asset.moose.swiftUIImage
            case .bear:
                return Asset.bear.swiftUIImage
            }
        }
    }
}
