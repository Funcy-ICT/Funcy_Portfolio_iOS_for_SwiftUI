//
//  ImageSelectView.swift
//  portfolio-ios-swiftui
//
//  Created by 鳥山英峻 on 2022/12/05.
//

import SwiftUI

struct ImageSelectView: View {
    
    @State var images = [""]
    let bounds = UIScreen.main.bounds
    
    var body: some View {
        
        let width = Double(bounds.width) * 1
        let height = Double(bounds.height) * 0.3
        
        TabView {
            ForEach(images, id: \.self) { item in
                Image(item)
                    .resizable()
                    .scaledToFit()
                    .frame(width: width, height: height)
                    .background(Color(UIColor.systemGray5))
            }
        }
        .frame(height: height + 20)
        .tabViewStyle(PageTabViewStyle())
    }
}

 #if DEBUG
 struct ImageSelectView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSelectView(images: ["Unknown", "Unknown1", "Unknown2"])
    }
 }
 #endif
