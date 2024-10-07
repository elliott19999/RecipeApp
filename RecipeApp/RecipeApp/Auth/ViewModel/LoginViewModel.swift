//
//  LoginViewModel.swift
//  RecipeApp
//
//  Created by Мадина Валиева on 16.09.2024.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func login() async throws {
        try await AuthService.shared.login(email: email, password: password)
    }
}
