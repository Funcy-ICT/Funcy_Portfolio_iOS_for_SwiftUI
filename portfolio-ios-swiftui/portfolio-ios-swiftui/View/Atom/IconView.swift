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
    
    let imageName: String // TODO: 将来的にはURLに置き換える
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
            
        default:
            Image(imageName)
                .resizable()
                .clipShape(Circle())
                .scaledToFit()
                .frame(width: 148.0, height: 148.0)
            
        }
    }
}

#if DEBUG
struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        IconView(imageName: "IMG_6788", iconPattern: .small)
    }
}
#endif
