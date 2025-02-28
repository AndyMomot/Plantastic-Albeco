//
//  HomeViewModel.swift
//  PlantasticAlbeco
//
//  Created by Andrii Momot on 28.02.2025.
//

import Foundation

extension HomeView {
    final class ViewModel: ObservableObject {
        @Published var allTasksCount = 0
        @Published var completesTasksCount = 0
    }
}

extension HomeView.ViewModel {
    func getTasks() async {
        let tasks = DefaultsService.shared.tasks
        let completesTasksCount = tasks.filter { $0.isCompleted }.count
        
        await MainActor.run { [weak self] in
            guard let self else { return }
            self.allTasksCount = tasks.count
            self.completesTasksCount = completesTasksCount
        }
    }
}
