//
//  LoginPage.swift
//  portfolio-ios-swiftui
//
//  Created by 鳥山英峻 on 2022/10/24.
//

import SwiftUI

struct LoginPage: View {
    @ObservedObject var login = LoginViewModel()
    
    @State var new_login: Bool = false
    @State var new_register: Bool = false
    
    var body: some View {
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
            
            BaseButtonView(
                action: {
                    self.new_register.toggle()
                },
                labelText: "新規会員登録",
                foregroundColor: Color.text,
                backgroundColor: Color.grayBottonColor,
                radius: 25
            )
            .fullScreenCover(isPresented: self.$new_register) {
                SignupPage()
            }
            .padding(.top, 60)
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
