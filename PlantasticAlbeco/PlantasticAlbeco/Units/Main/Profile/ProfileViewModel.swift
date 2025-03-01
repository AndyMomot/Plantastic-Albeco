//
//  ProfileViewModel.swift
//  PlantasticAlbeco
//
//  Created by Andrii Momot on 01.03.2025.
//

import UIKit.UIImage

extension ProfileView {
    final class ViewModel: ObservableObject {
        @Published var userImage = Asset.preloader.image
        @Published var userName = ""
        @Published var selectedMentor = ForesterMentorPicker.Mentor.beaver
        @Published var appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        
        @Published var showPrivacyPolicy = false
        @Published var showSupport = false
        @Published var showLogoutAlert = false
        
        let privacyPolicyURL = URL(string: "https://www.google.com")
        let supportURL = URL(string: "https://www.google.com")
        let appStoreURL = URL(string: "https://apps.apple.com/app/id6740994248")
        
    }
}

extension ProfileView.ViewModel {
    func getUser() async {
        let user = DefaultsService.shared.user
        await getUserImage(id: user.id)
        let mentor = ForesterMentorPicker.Mentor(rawValue: user.foresterMentor) ?? .beaver
        await MainActor.run { [weak self] in
            self?.userName = user.userName
            self?.selectedMentor = mentor
        }
    }
    
    func getUserImage(id: String) async {
        if let imageData = await FileManagerService().fetchImage(with: id),
           let image = UIImage(data: imageData) {
            await MainActor.run { [weak self] in
                self?.userImage = image
            }
        }
    }
    
    func updateUserImage() async {
        let id = DefaultsService.shared.user.id
        guard userImage != Asset.preloader.image,
              let imageData = userImage.pngData() else { return }
        await FileManagerService().saveImage(data: imageData, for: id)
    }
    
    func updateUserName() async {
        DefaultsService.shared.user.userName = userName
    }
    
    func updateUserMentor() async {
        DefaultsService.shared.user.foresterMentor = selectedMentor.rawValue
    }
    
    func removeData() async {
        DefaultsService.shared.removeAll()
        FileManagerService().removeAllFiles()
    }
}
