//
//  TextFieldModifier.swift
//  RecipeApp
//
//  Created by Мадина Валиева on 07.08.2024.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    func body (content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(Color(.systemGray3), lineWidth: 1)
                    .padding(.horizontal, -12)
            )
            .padding(.horizontal, 24)
    }
}


