//
//  ContentViewModel.swift
//  RecipeApp
//
//  Created by Мадина Валиева on 15.09.2024.
//

import Foundation
import Combine
import Firebase
import FirebaseAuth

class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    private func setupSubscribers() {
        AuthService.shared.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellable)
    }
}
