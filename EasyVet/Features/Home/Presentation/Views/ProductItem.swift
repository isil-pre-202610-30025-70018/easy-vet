//
//  ProductItem.swift
//  EasyVet
//
//  Created by Jorge Mayta on 2/05/26.
//

import SwiftUI

struct ProductItem: View {
    
    @State var showDetail = false
    
    var product: Product
    
    @EnvironmentObject var viewModel: CartViewModel
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        VStack {
            
            ZStack (alignment:.topTrailing) {
                AsyncImage(url: URL(string: product.image)) { phase in
                    switch phase {
                        
                        
                    case .empty:
                        ProgressView()
                            .frame(height: 256)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 256)
                        
                    case .failure:
                        EmptyView()
                            .frame(height: 256)
                    @unknown default:
                        EmptyView()
                            .frame(height: 256)
                    }
                }
                .frame(maxWidth: .infinity)
                Button {
                    homeViewModel.togglefavorite(id: product.id)
                } label: {
                    Image(systemName: product.isFavorite ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
                .foregroundStyle(product.isFavorite ? .green : .gray)
                .padding()
                .buttonStyle(.plain)
                
            }
            
            Text(product.name).bold()
            Text("$\(product.price, specifier: "%.2f")")
        }
        
         .onTapGesture {
         showDetail.toggle()
         }
         .sheet(isPresented: $showDetail) {
         ProductDetail(product: product) {
         showDetail.toggle()
         viewModel.addProduct(product: product)
         }
         .presentationDetents([.large])
         .presentationBackground(.white)
         }
         
        
    }
}
