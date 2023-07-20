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
                .frame(width: 74.0, height: 74.0)
            
        case .small:
            Image(imageName)
                .resizable()
                .clipShape(Circle())
                .scaledToFit()
                .frame(width: 54.0, height: 54.0)
            
        case .tiny:
            Image(imageName)
                .resizable()
                .clipShape(Circle())
                .scaledToFit()
                .frame(width: 40.0, height: 40.0)
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
