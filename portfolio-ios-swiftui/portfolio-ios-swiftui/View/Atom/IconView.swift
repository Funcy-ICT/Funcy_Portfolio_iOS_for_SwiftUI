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
}

struct IconView: View {
    
    // Todo: 将来的にURLに置き換える
    let imageName: URL
    let iconPattern: IconPattern
    
    var body: some View {
        
        switch iconPattern {
            
        case .large:
            AsyncImage(url: imageName) { image in
                image
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 148.0, height: 148.0)
                    .scaledToFit()
                    
            } placeholder: {
                ProgressView()
            }
            // 74 × 2 = 148.0
            
        case .small:
            AsyncImage(url: imageName) { image in
                image
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 108.0, height: 108.0)
                    .scaledToFit()
                    
            } placeholder: {
                ProgressView()
            }
            // 54 × 2 = 108.0
        }
    }
}

// #if DEBUG
// struct IconView_Previews: PreviewProvider {
//    static var previews: some View {
//        IconView(imageName: "IMG_6788", iconPattern: .small)
//    }
// }
// #endif
