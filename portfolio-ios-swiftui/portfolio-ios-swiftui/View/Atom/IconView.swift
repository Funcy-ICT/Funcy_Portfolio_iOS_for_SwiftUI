//
//  IconView.swift
//  portfolio-ios-swiftui
//
//  Created by 未来大学高度 on 2022/10/03.
//

import SwiftUI

struct IconView: View {
    
    enum IconPattern: Int {
        case large = 0
        case small = 1
    }
    
    let image: String
    let iconPattern: IconPattern.RawValue
    
    var body: some View {
        
        switch iconPattern {
            
        case IconPattern.large.rawValue:
            Image(image)
                .resizable()
                .clipShape(Circle())
                .scaledToFit()
                .frame(width: 148.0, height: 148.0)
                // 74 × 2 = 148.0
            
        case IconPattern.small.rawValue:
            Image(image)
                .resizable()
                .clipShape(Circle())
                .scaledToFit()
                .frame(width: 108.0, height: 108.0)
                // 54 × 2 = 108.0
            
            
        default:
            Image(image)
                .resizable()
                .clipShape(Circle())
                .scaledToFit()
                .frame(width: 148.0, height: 148.0)
            
        }
    }
}

struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        IconView(image: "IMG_6788", iconPattern: 0)
    }
}
