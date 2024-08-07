//
//  RoudedColorButton.swift
//  RecipeApp
//
//  Created by Мадина Валиева on 07.08.2024.
//

import Foundation
import SwiftUI

struct RoudedColorButton: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .frame(height: 48)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(color)
            .cornerRadius(24)
            .padding(.horizontal, 24)
          
    }
}
