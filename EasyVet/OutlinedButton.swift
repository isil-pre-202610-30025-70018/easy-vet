//
//  OutlinedButton.swift
//  EasyVet
//
//  Created by Jorge Mayta on 18/04/26.
//

import SwiftUI

struct OutlinedButton: View {
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .foregroundStyle(.green)
                .frame(maxWidth: .infinity)
        }
        .padding(.vertical, 16)
        .clipShape(RoundedRectangle(cornerRadius: 32))
        .overlay(RoundedRectangle(cornerRadius: 32).stroke(.green, lineWidth: 2))
        .padding(.horizontal, 16)

    }
}
