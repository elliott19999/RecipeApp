//
//  RecipeTabView.swift
//  RecipeApp
//
//  Created by Мадина Валиева on 04.09.2024.
//

import SwiftUI

struct RecipeTabView: View {
    @State private var selectedTab = 0
    @State private var showScanView = false
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Home View!")
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                }
                .onAppear(perform: {
                    selectedTab = 0
                })
                .tag(0)
            Text("Upload View!")
                .tabItem {
                    Image(systemName: selectedTab == 1 ? "pencil.line" : "pencil")
                       
                }
                .onAppear(perform: {
                    selectedTab = 1
                })
                .tag(1)
            Text("Scan View!")
                .tabItem {
                    Image(systemName: "plus")
                }
                .onAppear(perform: {
                    selectedTab = 2
                })
                .tag(2)
            Text("Nitification View!")
                .tabItem {
                    Image(systemName: selectedTab == 3 ? "bell.fill" : "bell")
                        
                }
                .onAppear(perform: {
                    selectedTab = 3
                })
                .tag(3)
            Text("Home View!")
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "person.fill" : "person")
                     
                }
                .onAppear(perform: {
                    selectedTab = 4
                })
                .tag(4)
        }
        .onChange(of: selectedTab) { oldValue, newValue in
            showScanView = selectedTab == 2
            
        }
        .sheet(isPresented: $showScanView, onDismiss: {
            selectedTab = 0
        }, content: {
            EmptyView()
        })
        .tint(.green)
    }
}

#Preview {
    RecipeTabView()
}
