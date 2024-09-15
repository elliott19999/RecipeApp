//
//  ContentView.swift
//  RecipeApp
//
//  Created by Мадина Валиева on 07.08.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPresented = false
    @StateObject var viewModel = ContentViewModel()
    @State private var isVstackVisible: Bool = true
    var body: some View {
        VStack {
            if isVstackVisible {
                VStack {
                    Image("recipe")
                        .resizable()
                        .frame(height: 400)
                    VStack{
                        Text("Start Cooking")
                            .font(.title)
                            .fontWeight(.semibold)
                      
                        Text("Let’s join our community to cook better food!")
                            .font(.title3)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    
                    Button(action: {
                        isPresented = true
                        UserDefaults.standard.set(true, forKey: "Onboarding")
                    }, label: {
                        Text("Get Started")
                            .modifier(RoudedColorButton(color: Color.green))
                    })
                    Spacer()
                        .fullScreenCover(isPresented: $isPresented, content: {
                            LoginView()
                        })
                }
                
            } else {
                Group {
                    if viewModel.userSession != nil {
                        RecipeTabView()
                    } else {
                        LoginView()
                    }
                }
            }
        }
        .onAppear(perform: {
            if UserDefaults.standard.bool(forKey: "Onboarding") {
                isVstackVisible = false
            }
        })
      
    }
}

#Preview {
    ContentView()
}
