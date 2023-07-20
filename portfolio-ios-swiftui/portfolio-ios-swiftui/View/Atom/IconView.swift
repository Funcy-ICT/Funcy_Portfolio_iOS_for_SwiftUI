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
    let imageName: String
    let iconPattern: IconPattern

    var body: some View {

        switch iconPattern {
            
        case .large:
            Image(imageName)
                .resizable()
                .clipShape(Circle())
                .scaledToFit()
                .frame(width: 148.0, height: 148.0)
            // 74 × 2 = 148.0
            
        case .small:
            Image(imageName)
                .resizable()
                .clipShape(Circle())
                .scaledToFit()
                .frame(width: 108.0, height: 108.0)
            // 54 × 2 = 108.0
            
        case .tiny:
            Image(imageName)
                .resizable()
                .clipShape(Circle())
                .scaledToFit()
                .frame(width: 68.0, height: 68.0)
            // 34 × 2 = 68.0
        }
    }
}

// #if DEBUG
// struct IconView_Previews: PreviewProvider {
//    static var previews: some View {
//        VStack{
//            IconView(imageName: "preview", iconPattern: .large)
//            IconView(imageName: "preview", iconPattern: .small)
//            IconView(imageName: "preview", iconPattern: .tiny)
//        }
//    }
// }
// #endif
