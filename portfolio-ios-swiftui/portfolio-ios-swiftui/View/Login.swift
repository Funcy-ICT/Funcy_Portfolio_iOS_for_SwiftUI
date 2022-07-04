//
//  Login.swift
//  portfolio-ios-swiftui
//
//  Created by 鳥山英峻 on 2022/06/20.
//

import SwiftUI

struct Login: View {
    var body: some View {
        VStack {
            Text("メールアドレス")
                .font(.system(.subheadline, design: .default))
                .fontWeight(.light)

            Text("パスワード")
                .font(.system(.subheadline, design: .default))
                .fontWeight(.light)
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
