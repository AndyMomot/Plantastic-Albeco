//
//  OnboardingViewModel.swift
//  Goobeltoin
//
//  Created by Andrii Momot on 12.06.2024.
//

import Foundation

extension OnboardingView {
    final class OnboardingViewModel: ObservableObject {
        let privacyPolicyURL = URL(string: "https://www.google.com")
        @Published var showPrivacy = false
        @Published var showLogin = false
        
        func initUser() async {
            DefaultsService.shared.user = .init(userName: "", foresterMentor: "")
        }
    }
    
    enum OnboardingItem: Int, CaseIterable {
        case first = 0
        case second
        case third
        
        var image: String {
            switch self {
            case .first:
                return Asset.onboard1.name
            case .second:
                return Asset.onboard2.name
            case .third:
                return Asset.onboard3.name
            }
        }
        
        var title: String {
            switch self {
            case .first:
                return "Welcome to Forest Guardian"
            case .second:
                return "Task List"
            case .third:
                return "Track your progress"
            }
        }
        
        var text: String {
            switch self {
            case .first:
                return "Welcome to your personal forest! Complete tasks to grow trees, attract animals, and level up as a Forest Keeper."
            case .second:
                return "Organize your tasks into 'Paths' like Work, Health, and Hobbies. Check them off to earn Nature Points and see your forest thrive!"
            case .third:
                return "Track your journey as a Forest Keeper! See your level, achievements, and how your forest has grown over time."
            }
        }
        
        var nextButtonTitle: String {
            switch self {
            case .first, .second:
                return "Next"
            case .third:
                return "Start"
            }
        }

        var next: Self {
            switch self {
            case .first:
                return .second
            case .second, .third:
                return .third
            }
        }
        
        var lastIndex: Int {
            OnboardingItem.allCases.last?.rawValue ?? .zero
        }
    }
}
