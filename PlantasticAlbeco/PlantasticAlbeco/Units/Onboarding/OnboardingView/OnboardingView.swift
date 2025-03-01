import SwiftUI

struct OnboardingView: View {
    var item: OnboardingView.OnboardingItem
    @Binding var currentPageIndex: Int
    
    @EnvironmentObject private var rootViewModel: RootContentView.ViewModel
    @StateObject private var viewModel = OnboardingViewModel()
    
    var body: some View {
        ZStack {
            Color.honeydew
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                HStack {
                    Text("Skip")
                        .foregroundStyle(.emeraldGreen)
                        .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 14))
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .hidden()
                    
                    Spacer()
                    
                    HStack(spacing: 8) {
                        ForEach(0...item.lastIndex, id: \.self) { index in
                            let isSelected = index == currentPageIndex
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.emeraldGreen.opacity(isSelected ? 1 : 0.3))
                                .frame(width: isSelected ? 32 : 8)
                        }
                    }
                    .frame(height: 6)
                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            currentPageIndex = item.lastIndex
                        }
                    } label: {
                        Text("Skip")
                            .foregroundStyle(.emeraldGreen)
                            .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 14))
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                            .background(.white.opacity(0.8))
                            .clipShape(RoundedRectangle(cornerRadius: 100))
                    }
                }
                
                VStack(spacing: 16) {
                    Text(item.title)
                        .foregroundStyle(.forestGreen)
                        .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 24))
                    
                    Text(item.text)
                        .foregroundStyle(.emeraldGreen)
                        .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 16))
                }
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .padding(.horizontal)
                .lineSpacing(2)
                
                Image(item.image)
                    .resizable()
                    .scaledToFit()
            }
            .padding(.horizontal)
            
            VStack {
                Spacer()
                
                NextButton(title: item.nextButtonTitle) {
                    if item.rawValue == item.lastIndex {
                        Task {
                            await viewModel.initUser()
                            await MainActor.run {
                                rootViewModel.setFlow(.main)
                            }
                        }
                    } else {
                        withAnimation {
                            currentPageIndex = item.next.rawValue
                        }
                    }
                }
                .padding(.horizontal)
            }
            
        }
        .sheet(isPresented: $viewModel.showPrivacy) {
            SwiftUIViewWebView(url: viewModel.privacyPolicyURL)
        }
    }
}

#Preview {
    OnboardingView(item: .third, currentPageIndex: .constant(2))
}
