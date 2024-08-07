//
//  ContentView.swift
//  RecipeApp
//
//  Created by Мадина Валиева on 07.08.2024.
//

import SwiftUI


struct ContentView: View {
    @State private var isPresented = false
    var body: some View {
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
            }, label: {
                Text("Get Started")
                    .modifier(RoudedColorButton(color: Color.green))
            })
            Spacer()
                .fullScreenCover(isPresented: $isPresented, content: {
                    LoginView()
                })
        }
        .padding()
      
    }
}

#Preview {
    ContentView()
}
