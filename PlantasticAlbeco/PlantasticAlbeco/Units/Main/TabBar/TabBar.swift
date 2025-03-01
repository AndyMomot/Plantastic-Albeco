import SwiftUI

struct TabBar: View {
    @StateObject private var viewModel = ViewModel()
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $viewModel.selection) {
                HomeView()
                    .environmentObject(viewModel)
                    .tag(TabBarSelectionView.home.rawValue)
                
                TasksView()
                    .tag(TabBarSelectionView.tasks.rawValue)
                
                InfoView()
                    .tag(TabBarSelectionView.info.rawValue)
                
                RewardsView()
                    .tag(TabBarSelectionView.rewards.rawValue)
                    .environmentObject(viewModel)
                
                ProfileView()
                    .tag(TabBarSelectionView.profile.rawValue)
                    .environmentObject(viewModel)
            }
            
            if viewModel.isShowTabBar {
                TabBarCustomView(selectedItem: $viewModel.selection)
                    .frame(height: UIScreen.main.bounds.height * 0.09)
                    .padding([.horizontal, .bottom], 20)
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    TabBar()
}
