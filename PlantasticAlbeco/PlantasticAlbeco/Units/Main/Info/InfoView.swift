//
//  InfoView.swift
//  PlantasticAlbeco
//
//  Created by Andrii Momot on 01.03.2025.
//

import SwiftUI

struct InfoView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Color.honeydew
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 16) {
                CustomNavigationView()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        VStack(alignment: .leading, spacing: 12) {
                            ForEach(viewModel.faqItems) { item in
                                FAQCell(item: item)
                            }
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Productivity Tips")
                                .foregroundStyle(.forestGreen)
                                .font(Fonts.SFProDisplay.semibold.swiftUIFont(size: 18))
                            Text("Swipe to explore more tips")
                                .foregroundStyle(.jadeGreen)
                                .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 14))
                        }
                        .padding(.horizontal)
                        
                        ScrollView(.horizontal) {
                            HStack(spacing: 16) {
                                ForEach(viewModel.tipItems) { item in
                                    TipCell(item: item)
                                        .frame(width: UIScreen.main.bounds.width * 0.7)
                                }
                            }
                            .padding(.horizontal)
                        }
                        .scrollIndicators(.never)
                    }
                    .padding(.bottom, UIScreen.main.bounds.height * 0.1)
                }
                .scrollIndicators(.never)
            }
        }
    }
}

#Preview {
    InfoView()
}
