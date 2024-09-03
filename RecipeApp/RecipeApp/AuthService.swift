//
//  AuthService.swift
//  RecipeApp
//
//  Created by Мадина Валиева on 11.08.2024.
//


import FirebaseAuth
import Firebase
import FirebaseFirestore


class AuthService {
    @Published var userSession: FirebaseAuth.User?
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    @MainActor
    func createUser (email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await result.user.sendEmailVerification()
            let uid = result.user.uid
            do {
                try await Firestore.firestore()
                    .collection("user")
                    .document(uid)
                    .setData([
                        "email": email
                    ])
                print("Debug: пользователь добавлен в Firestore: \(result.user.uid)")
            } catch let firestoreError {
                print("Debug: ошибка Firestore \(firestoreError.localizedDescription)")
            }
        } catch let authError {
            print("Debug: ошибка аутентификации \(authError.localizedDescription)")
        }
    }
}
