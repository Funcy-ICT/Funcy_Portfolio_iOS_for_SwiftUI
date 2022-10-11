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
                .frame(width: 120.0, height: 120.0)
                .position(x: 80, y: 70)
            
        case IconPattern.small.rawValue:
            Image(image)
                .resizable()
                .clipShape(Circle())
                .scaledToFit()
                .frame(width: 100.0, height: 100.0)
                .position(x: 70, y: 70)
            
            
        default:
            Image(image)
                .resizable()
                .clipShape(Circle())
                .scaledToFit()
                .frame(width: 120.0, height: 120.0)
                .position(x: 80, y: 70)
            
        }
    }
}

struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        IconView(image: "IMG_6788", iconPattern: 0)
    }
}
