//
//  HomeView.swift
//  PlantasticAlbeco
//
//  Created by Andrii Momot on 28.02.2025.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var tabBarViewModel: TabBar.ViewModel
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Color.honeydew
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                CustomNavigationView()
                
                ScrollView {
                    VStack(spacing: 24) {
                        if let uiImage = UIImage(named: "task\(viewModel.completesTasksCount)") {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFill()
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                        } else {
                            Asset.task50.swiftUIImage
                                .resizable()
                                .scaledToFill()
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                        }
                        
                        CompletedTasksProgress(allTasks: viewModel.allTasksCount,
                                               completedTasks: viewModel.completesTasksCount)
                        
                        NextButton(imageName: "tasks", title: "See Tasks") {
                            DispatchQueue.main.async {
                                withAnimation {
                                    let tab = TabBar.TabBarSelectionView.tasks.rawValue
                                    tabBarViewModel.selection = tab
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, UIScreen.main.bounds.height * 0.1)
                }
                .scrollIndicators(.never)
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
    HomeView()
}
