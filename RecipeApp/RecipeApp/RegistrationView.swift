//
//  RegistrationView.swift
//  RecipeApp
//
//  Created by Мадина Валиева on 07.08.2024.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @State private var username = ""
    
    @Environment(\.dismiss) private var dismiss
    
    var isPasswordValidLength: Bool {
        return password.count >= 6
    }
    
    var isPasswordWithNumber: Bool {
        return password.contains { $0.isNumber }
    }
    var isPasswordWithUppercase: Bool {
        return password.contains { $0.isUppercase }
    }
    var isPasswordWithLowercase: Bool {
        return password.contains { $0.isLowercase }
    }
    @State private var isShowungPassword = false
    
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
                    
                    TextField("Email or phone number", text: $email)
                        .font(.subheadline)
                        .padding(12)
                        .cornerRadius(12)
                    
                }
                .modifier(TextFieldModifier())
                
                HStack {
                    Image(systemName: "envelope")
                        .fontWeight(.semibold)
                    if isShowungPassword {
                        TextField("Password", text: $password)
                            .font(.subheadline)
                            .padding(12)
                            .cornerRadius(12)
                    } else {
                        SecureField("Password", text: $password)
                            .font(.subheadline)
                            .padding(12)
                            .cornerRadius(12)
                    }
               
                    Button(action: {
                        isShowungPassword.toggle()
                    }, label: {
                        Image(systemName: isShowungPassword ? "eye" : "eye.slash")
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