//
//  RegistrationView.swift
//  RecipeApp
//
//  Created by Мадина Валиева on 07.08.2024.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewModel()

    
    @Environment(\.dismiss) private var dismiss
    
    var isPasswordValidLength: Bool {
        return viewModel.password.count >= 6
    }
    
    var isPasswordWithNumber: Bool {
        return viewModel.password.contains { $0.isNumber }
    }
    var isPasswordWithUppercase: Bool {
        return viewModel.password.contains { $0.isUppercase }
    }
    var isPasswordWithLowercase: Bool {
        return viewModel.password.contains { $0.isLowercase }
    }
    @State private var isShowingPassword = false
    
    var isPasswordValid : Bool {
        return isPasswordValidLength &&
               isPasswordWithNumber &&
               isPasswordWithUppercase &&
               isPasswordWithLowercase
        
    }
    var body: some View {
        VStack(spacing: 16) {
            Text ("Welcome!")
                .font(.title2)
                .fontWeight(.semibold)
            Text ("Please enter your account here")
                .font(.footnote)
                .foregroundStyle(.gray)
            
            VStack (spacing: 20){
                HStack {
                    Image(systemName: "envelope")
                        .fontWeight(.semibold)
                    
                    TextField("Email or phone number", text: $viewModel.email)
                        .font(.subheadline)
                        .padding(12)
                        .cornerRadius(12)
                    
                }
                .modifier(TextFieldModifier())
                
                HStack {
                    Image(systemName: "envelope")
                        .fontWeight(.semibold)
                    if isShowingPassword {
                        TextField("Password", text: $viewModel.password)
                            .font(.subheadline)
                            .padding(12)
                            .cornerRadius(12)
                    } else {
                        SecureField("Password", text:  $viewModel.password)
                            .font(.subheadline)
                            .padding(12)
                            .cornerRadius(12)
                    }
               
                    Button(action: {
                        isShowingPassword.toggle()
                    }, label: {
                        Image(systemName: isShowingPassword ? "eye" : "eye.slash")
                            .foregroundStyle(.gray)
                        
                    })
                    
                }
                .modifier(TextFieldModifier())
                
            }
            VStack(spacing:16.0 ) {
                Text("Your Password must contain:")
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: isPasswordValidLength ? "checkmark.circle.fill" : "checkmark.circle" )
                            .foregroundColor(isPasswordValidLength ? .green : .gray)
                        Text("Atleast 6 characters")
                        
                    }
                    HStack {
                        Image(systemName: isPasswordWithNumber ? "checkmark.circle.fill" : "checkmark.circle" )
                            .foregroundColor(isPasswordWithNumber ? .green : .gray)
                        Text("Contains a number")
                        
                    }
                    HStack {
                        Image(systemName: isPasswordWithUppercase ? "checkmark.circle.fill" : "checkmark.circle" )
                            .foregroundColor(isPasswordWithUppercase ? .green : .gray)
                        Text("Atleast one uppercase letter")
                        
                    }
                    HStack {
                        Image(systemName: isPasswordWithLowercase ? "checkmark.circle.fill" : "checkmark.circle" )
                            .foregroundColor(isPasswordWithLowercase ? .green : .gray)
                        Text("Atleast one lowercase letter")
                        
                    }
                }
           
                .font(.footnote)
                
            }
                //login buttuns
            VStack(spacing: 16.0) {
                    Button(action: {
                        Task {
                            try await viewModel.createUser()
                        }
                    }, label: {
                        Text("Sign Up")
                            .modifier(RoudedColorButton(color: Color.green))
                    })
                    .opacity(isPasswordValid ? 1 : 0.5)
                    .disabled(!isPasswordValid)
                    
                    Button(action: {
                        dismiss()
                    }, label: {
                        HStack {
                            Text("Already have any account")
                            
                            Text("Log in")
                                .foregroundStyle(Color.green)
                                .fontWeight(.semibold)
                        }
                        .foregroundColor(.black)
                        .font(.footnote)
                    })
           
                    
                    
                }
            }
        .padding(.vertical, 50)
        }
    }


#Preview {
    RegistrationView()
}
