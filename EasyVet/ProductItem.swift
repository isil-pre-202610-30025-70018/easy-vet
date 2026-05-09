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
    
    var body: some View {
        VStack {
            
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
            .presentationDetents([.fraction(0.35)])
            .presentationBackground(.white)
        }
        
    }
}
