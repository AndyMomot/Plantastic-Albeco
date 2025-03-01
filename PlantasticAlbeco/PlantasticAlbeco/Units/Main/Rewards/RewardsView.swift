//
//  RewardsView.swift
//  PlantasticAlbeco
//
//  Created by Andrii Momot on 01.03.2025.
//

import SwiftUI

struct RewardsView: View {
    @EnvironmentObject private var tabBarViewModel: TabBar.ViewModel
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Color.honeydew
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                CustomNavigationView()
                
                ScrollView {
                    VStack(spacing: 24) {
                        ZStack(alignment: .bottom) {
                            Asset.rewardsBg.swiftUIImage
                                .resizable()
                                .scaledToFill()
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            
                            HStack(spacing: 8) {
                                Spacer()
                                Asset.leaf.swiftUIImage
                                    .renderingMode(.template)
                                    .foregroundStyle(.forestGreen)
                                
                                Text("Level \(viewModel.level + 1) soon!")
                                Spacer()
                            }
                            .padding(12)
                            .background(.white.opacity(0.9))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .padding()
                        }
                        
                        VStack(spacing: 12) {
                            HStack(spacing: 12) {
                                StatisticCell(imageName: Asset.tasksCompleted.name,
                                              title: "\(viewModel.allTasks) Tasks",
                                              all: Double(viewModel.allTasks),
                                              completed: Double(viewModel.completedTasks),
                                              accentColor: .yellow)
                                
                                StatisticCell(imageName: Asset.daysCompleted.name,
                                              title: "\(viewModel.allTasks) Tasks",
                                              all: Double(Date.getNumber(of: .weekday)),
                                              completed: Double(viewModel.completedTasks),
                                              accentColor: .blue)
                            }
                            
                            HStack(spacing: 12) {
                                StatisticCell(imageName: Asset.leafsCompleted.name,
                                              title: "\(viewModel.leafs) leaf",
                                              all: Double(viewModel.allLeafs),
                                              completed: Double(viewModel.leafs),
                                              accentColor: .emeraldGreen)
                                
                                Button {
                                    DispatchQueue.main.async {
                                        withAnimation {
                                            let tab = TabBar.TabBarSelectionView.tasks.rawValue
                                            tabBarViewModel.selection = tab
                                        }
                                    }
                                } label: {
                                    VStack(alignment: .leading, spacing: 16) {
                                        Asset.tasks.swiftUIImage
                                            .renderingMode(.template)
                                            .foregroundStyle(.jadeGreen)
                                            .padding(8)
                                            .background(.honeydew)
                                            .clipShape(Circle())
                                        
                                        Text("See Tasks")
                                            .foregroundStyle(.white)
                                            .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 14))
                                            .frame(maxWidth: .infinity,
                                                   alignment: .leading)
                                    }
                                    .padding()
                                    .background(.jadeGreen)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                }
                            }
                        }
                    }
                    .padding([.top, .horizontal])
                    .padding(.bottom, UIScreen.main.bounds.height * 0.1)
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.getTasks()
            }
        }
    }
}

#Preview {
    RewardsView()
}
