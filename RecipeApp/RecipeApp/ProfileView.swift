//
//  ProfileView.swift
//  RecipeApp
//
//  Created by Мадина Валиева on 15.09.2024.
//

import SwiftUI
enum ProfileFilter: Int, CaseIterable, Identifiable {
   
   case reciepe
   case liked
    
    var title: String {
        switch self {
        case .reciepe:
            return "Recipes"
        case .liked:
            return "Liked"
        }
    }
    var id: Int {
        return self.rawValue
    }
    
}

struct ProfileView: View {
    @State private var selectedFilter: ProfileFilter = .reciepe
   @Namespace var animation
    
    var gridItemLayot = [GridItem(.flexible()), GridItem(.flexible())]
    private var filterBarWidth : CGFloat {
        let count = CGFloat(ProfileFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Image("photoy")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                    Text ("Саша Тепли")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.gray)
                }
               
                HStack (spacing: 36.0) {
                    VStack {
                        Text ("543")
                            .fontWeight(.semibold)
                        Text ("Following")
                            .font(.footnote)
                    }
                    VStack {
                        Text ("32")
                            .fontWeight(.semibold)
                        Text ("Recipes")
                            .font(.footnote)
                    }
                    VStack {
                        Text ("1,23")
                            .fontWeight(.semibold)
                        Text ("Followers")
                            .font(.footnote)
                    }
                }
                .foregroundColor(.gray)
                .padding(.vertical, 5)
             
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: 6)
                    .foregroundColor(Color(.systemGray6))
                   
                VStack {
                    HStack {
                        ForEach(ProfileFilter.allCases) { filter in
                            VStack {
                                Text(filter.title)
                                    .font(.subheadline)
                                    .fontWeight(selectedFilter == filter ? .semibold : .regular)
                                if selectedFilter == filter {
                                    Rectangle()
                                        .frame(width: filterBarWidth, height: 1)
                                        .foregroundColor(.black)
                                        .matchedGeometryEffect(id: "item", in: animation)
                                } else {
                                    Rectangle()
                                        .frame(width: filterBarWidth, height: 1)
                                        .foregroundColor(.clear)
                                     
                                }
                            }
                            .onTapGesture {
                                withAnimation {
                                    selectedFilter = filter
                                }
                            }
                        }
                    }
                }
                .padding(.vertical, 10)
                //Content
                LazyVGrid(columns: gridItemLayot) {
                    ForEach (0 ... 10, id: \.self) { recipe in
                        Rectangle()
                            .frame(width: 150, height: 150)
                            .foregroundColor(.gray)
                            .background(Color(.systemGray3))
                    }
                }
            }
            .toolbar {
                ToolbarItem (placement: .topBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ProfileView()
}
