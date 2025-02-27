import Foundation
import SwiftUI

extension TabBar {
    final class ViewModel: ObservableObject {
        @Published var selection = TabBarSelectionView.home.rawValue
        @Published var isShowTabBar = true
        
        func showTabBar(_ show: Bool) {
            DispatchQueue.main.async { [weak self] in
                self?.isShowTabBar = show
            }
        }
    }
}

extension TabBar {
    enum TabBarSelectionView: Int {
        case home = 0
        case tasks
        case info
        case rewards
        case profile
    }
    
    struct Item: Identifiable {
        private(set) var id = UUID()
        var imageName: String
        var selectedImageName: String
    }
}
