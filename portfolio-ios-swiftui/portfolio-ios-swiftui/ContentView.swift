//
//  ContentView.swift
//  portfolio-ios-swiftui
//
//  Created by 鳥山英峻 on 2022/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            TextBox(text: "メールアドレス", textFieldPattern: 0)
            TextBox(text: "パスワード", textFieldPattern: 1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
