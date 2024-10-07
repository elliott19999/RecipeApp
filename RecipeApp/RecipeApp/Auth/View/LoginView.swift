//
//  LoginView.swift
//  RecipeApp
//
//  Created by Мадина Валиева on 07.08.2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    @State private var isShowingPassword = false
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Text ("Welcome Back!")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text ("Please enter your account here")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                
                VStack (spacing: 20){
                    HStack {
                        Image(systemName: "envelope")
                            .fontWeight(.semibold)
                        
                        TextField("Email", text: $viewModel.email)
                            .font(.subheadline)
                            .padding(12)
                            .cornerRadius(12)
                        
                    }
                    .modifier(TextFieldModifier())
                    
                    HStack {
                        Image(systemName: "lock")
                            .fontWeight(.semibold)
                        if isShowingPassword {
                            TextField("Password", text: $viewModel.password)
                                .font(.subheadline)
                                .padding(12)
                                .cornerRadius(12)
                        } else {
                            SecureField("Password", text: $viewModel.password)
                                .font(.subheadline)
                                .padding(12)
                                .cornerRadius(12)
                        }
                        
                        Button(action: {
                            isShowingPassword.toggle()
                        }, label: {
                            Image(systemName: isShowingPassword ? "eye" : "eye.slash" )
                                .foregroundStyle(.gray)
                            
                        })
                        
                    }
                    .modifier(TextFieldModifier())
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Text("Forgot password?")
                                .foregroundStyle(.black)
                        })
                    
                    }
                    .padding(.trailing, 24)
                    
                    //login buttuns
                    VStack {
                        Button(action: {
                            Task {
                                try await viewModel.login()
                            }
                        }, label: {
                            Text("Login")
                                .modifier(RoudedColorButton(color: Color.green))
                        })
                        Text("Or continue with")
                            .foregroundStyle(.gray)
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Google")
                                .modifier(RoudedColorButton(color: Color.orange))
                        })
                        
                        NavigationLink {
                            RegistrationView()
                                .navigationBarBackButtonHidden()
                        } label: {
                            HStack {
                                Text("Don’t have any account?")
                                    .foregroundStyle(.gray)
                                Text("Sign Up")
                                    .foregroundStyle(Color.green)
                            }
                        }

                
                    }
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
