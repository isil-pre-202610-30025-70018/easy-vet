//
//  Login.swift
//  EasyVet
//
//  Created by Jorge Mayta on 25/04/26.
//

import SwiftUI

struct Login: View {
    @State var showMain = false
    
    @State var email = ""
    @State var password = ""
    
    @State var isHidden = true
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image("dog")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 384)
                Spacer()
                
                HStack {
                    Image(systemName: "envelope")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.gray)
                    TextField("Email", text: $email)
                }
                .padding()
                .background(.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal, 16)
                .padding(.bottom, 4)
                
                
                HStack {
                    Image(systemName: "lock")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.gray)
                    Group {
                        if isHidden {
                            SecureField("Password", text: $password)
                        } else {
                            TextField("Password", text: $password)
                        }
                    }
                    
                    Button {
                        isHidden.toggle()
                    } label: {
                        Image(systemName: isHidden ? "eye.slash" : "eye")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .foregroundStyle(.gray)
                    }

                }
                .padding()
                .background(.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal, 16)
                .padding(.top, 4)
                .padding(.bottom, 8)
                
                
                
                FilledButton(text: "Login") {
                    showMain.toggle()
                }
                Spacer()
                
            }
            .navigationBarBackButtonHidden()
            .navigationDestination(isPresented: $showMain) {
                Main()
            }
        }
        
    }
}


#Preview {
    Login()
}
