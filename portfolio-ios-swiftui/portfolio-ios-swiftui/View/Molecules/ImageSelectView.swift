//
//  ImageSelectView.swift
//  portfolio-ios-swiftui
//
//  Created by 鳥山英峻 on 2022/12/05.
//

import SwiftUI

struct ImageSelectView: View {
  
   @State var images: [URL?] = []
   let bounds = UIScreen.main.bounds
   
   var body: some View {
       
       let width = bounds.width * 1
       let height = bounds.height * 0.3
       
       TabView {
           ForEach(images, id: \.self) { item in
               AsyncImage(url: item) { phase in
                   if let image = phase.image {
                       image.resizable()
                           .resizable()
                           .scaledToFill()
                           .frame(width: width, height: height)
                           .background(Color(UIColor.white))
                   } else if let error = phase.error {
                       Text(error.localizedDescription)
                   } else {
                       ProgressView()
                   }
               }
           }
       }
       .frame(height: height + 90)
       .tabViewStyle(PageTabViewStyle())
       .onAppear {
           setupAppearance()
       }
   }
   
   func setupAppearance() {
       UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.systemPink
       UIPageControl.appearance().pageIndicatorTintColor = UIColor.systemPink.withAlphaComponent(0.2)
   }
}
