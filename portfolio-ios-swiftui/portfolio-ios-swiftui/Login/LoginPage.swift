//
//  LoginPage.swift
//  portfolio-ios-swiftui
//
//  Created by 鳥山英峻 on 2022/10/24.
//

import SwiftUI

struct LoginPage: View {
    @ObservedObject var login = LoginViewModel()
    @State private var isLinkActive = false
    @State private var isSignupLinkActive = false
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                VStack {
                    VStack(alignment: .leading) {
                        Text("メールアドレス")
                            .foregroundColor(Color.text)
                        TextField("入力してください", text: $login.mail)
                            .frame(width: 240, height: 40)
                            .padding(.leading, 15)
                            .overlay(RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.grayBottonColor, lineWidth: 2)
                            )
                            .padding(.leading, 25)
                    }
                    .padding(.trailing, 30)
                    .padding(.bottom)
                    
                    VStack(alignment: .leading) {
                        Text("パスワード")
                            .foregroundColor(Color.text)
                        TextField("入力してください", text: $login.password)
                            .frame(width: 240, height: 40)
                            .padding(.leading, 15)
                            .overlay(RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.grayBottonColor, lineWidth: 2)
                            )
                            .padding(.leading, 25)
                    }
                    .padding(.trailing, 30)
                    .padding(.bottom)
                    
                    BaseButtonView(
                        action: {
                            login.fetchLoginService()
                        },
                        labelText: "ログイン　　",
                        foregroundColor: Color.white,
                        backgroundColor: Color.subPink,
                        radius: 25
                    )
                    .padding(.top)
                    
                    Divider()
                        .padding(.top, 30)
                    
                    // 新規会員登録ボタン
                    NavigationLink(destination: SignupPage(), isActive: $isSignupLinkActive) {
                        EmptyView()
                    }
                    
                    BaseButtonView(
                        action: {
                            isSignupLinkActive = true
                        },
                        labelText: "新規会員登録",
                        foregroundColor: Color.text,
                        backgroundColor: Color.grayBottonColor,
                        radius: 25
                    )
                    .padding(.top, 60)
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

// #if DEBUG
// struct LoginPage_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginPage()
//    }
// }
// #endif
