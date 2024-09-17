//
//  ErrorComponent.swift
//  Pokemon
//
//  Created by Gabor Pinter on 17/09/2024.
//

import SwiftUI

struct ErrorComponent: View {
    var title: String = "Something went wrong!"
    var body: some View {
        Text(title)
            .foregroundStyle(.red)
            .frame(maxWidth: .infinity)
            .padding(.vertical)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(.white)
                    .shadow(color: .gray, radius: 5)
            )
            .padding()
    }
}

#Preview {
    ErrorComponent()
}
