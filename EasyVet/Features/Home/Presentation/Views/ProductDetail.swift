//
//  ProductDetail.swift
//  EasyVet
//
//  Created by Jorge Mayta on 2/05/26.
//

import SwiftUI

struct ProductDetail: View {
    var product: Product
    var onTapGesture: () -> Void
    
    var body: some View {
        
        VStack {
            HStack {
                AsyncImage(url: URL(string: product.image)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 128, height: 128)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 128, height: 128)
                    case .failure:
                        EmptyView()
                        
                    @unknown default:
                        EmptyView()
                    }
                }
                
                VStack (alignment: .leading){
                    Text(product.name)
                        .font(.headline)
                    Text("$\(product.price, specifier: "%.2f")")
                    
                }
                Spacer()
            }
            FilledButton(text: "Add to cart") {
                onTapGesture()
            }
        }
        
    }
}
