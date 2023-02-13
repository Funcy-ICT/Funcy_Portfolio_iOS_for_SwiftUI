//
//  ContentView.swift
//  portfolio-ios-swiftui
//
//  Created by 鳥山英峻 on 2022/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image("IMG_6788")
            .resizable()
            .clipShape(Circle())
            .scaledToFit()
            .frame(width: 120.0, height: 100.0)
            .position(x: 70, y: 70)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
