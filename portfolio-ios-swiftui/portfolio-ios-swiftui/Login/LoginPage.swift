//
//  LoginPage.swift
//  portfolio-ios-swiftui
//
//  Created by 鳥山英峻 on 2022/10/24.
//

import SwiftUI

struct LoginPage: View {
    var body: some View {
        VStack {
            BaseButtonView(
                action: {},
                labelText: "ログイン  " ,
                foregroundColor: Color.white,
                backgroundColor: Color.subPink,
                radius: 25
            )
            
            Divider()
                .padding(.top, 30)
            
            BaseButtonView(
                action: {},
                labelText: "新規会員登録",
                foregroundColor: Color.text,
                backgroundColor: Color.grayBottonColor,
                radius: 25
            )
            .padding(.top, 60)
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
