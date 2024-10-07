//
//  RegistrationViewModel.swift
//  RecipeApp
//
//  Created by Мадина Валиева on 11.08.2024.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    @MainActor
    
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password)
    }
    
}
