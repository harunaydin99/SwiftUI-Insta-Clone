//
//  IGTextFieldModifier.swift
//  InstaCloneSwiftUI
//
//  Created by Harun AYDIN on 31.07.2024.
//

import SwiftUI

struct IGTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 6))
            .padding(.horizontal, 24)
        
    }
}


