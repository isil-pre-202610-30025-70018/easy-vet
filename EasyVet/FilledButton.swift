//
//  FilledButton.swift
//  EasyVet
//
//  Created by Jorge Mayta on 18/04/26.
//

import SwiftUI

struct FilledButton: View {
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
        }
        .padding(.vertical, 16)
        .background(.green)
        .clipShape(RoundedRectangle(cornerRadius: 32))
        .padding(.horizontal, 16)
    }
}
