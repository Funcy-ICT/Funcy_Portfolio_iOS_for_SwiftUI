//
//  IconView.swift
//  portfolio-ios-swiftui
//
//  Created by 未来大学高度 on 2022/10/03.
//

import SwiftUI

enum IconPattern {
    case large
    case small
    case tiny
}

struct IconView: View {
    
    // Todo: 将来的にURLに置き換える
    let imageName: URL?
    
    let iconPattern: IconPattern
    
    var body: some View {
        
        switch iconPattern {
            
        case .large:
            AsyncImage(url: imageName) { item in
                if let image = item.image {
                    image.resizable()
                        .scaledToFill()
                        .frame(width: 74.0, height: 74.0)
                        .clipShape(Circle())
                }
            }
            
        case .small:
            AsyncImage(url: imageName) { item in
                if let image = item.image {
                    image.resizable()
                        .scaledToFill()
                        .frame(width: 54.0, height: 54.0)
                        .clipShape(Circle())
                }
            }
            
        case .tiny:
            AsyncImage(url: imageName) { item in
                if let image = item.image {
                    image.resizable()
                        .scaledToFill()
                        .frame(width: 44.0, height: 44.0)
                        .clipShape(Circle())
                }
            }
        }
    }
}

// #if DEBUG
// struct IconView_Previews: PreviewProvider {
//    static var previews: some View {
//        VStack {
//            IconView(imageName: URL(string: "http://localhost:3004/9efbc5ad-23a6-4f7b-8133-93a8ed128f2cmasuda.jpeg"), iconPattern: .large)
//
//        }
//    }
// }
// #endif
