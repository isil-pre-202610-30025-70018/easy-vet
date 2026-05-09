//
//  OnBoarding.swift
//  EasyVet
//
//  Created by Jorge Mayta on 18/04/26.
//

import SwiftUI

struct OnBoarding: View {
    
    @State private var showLogin = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("background")
                    .resizable()
                    .scaledToFit()
                
                Text("From Bowl to Soul \n We've Got It All!")
                    .font(.largeTitle.bold())
                    .multilineTextAlignment(.center)
                Text("Buy the best pet food packed \n with health and nutrition for \n your beloved pet.")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 16)
                
                FilledButton(text: "Create account") {}
                
                OutlinedButton(text: "Sign in") {
                    showLogin.toggle()
                }
                
            }
            .navigationDestination(isPresented: $showLogin) {
                Login()
            }
        }
      
    }
}

#Preview {
    OnBoarding()
}
