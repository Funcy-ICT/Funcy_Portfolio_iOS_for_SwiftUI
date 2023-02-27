//
//  SignupPage.swift
//  portfolio-ios-swiftui
//
//  Created by 鳥山英峻 on 2023/02/19.
//

import SwiftUI

struct SignUpPage: View {
    
    @State private var input = ""
    @State private var ikkk = ""
    
    @State var end_register: Bool = false
    
    var body: some View {
        VStack {
            Button(action: {
                var transaction = Transaction()
                transaction.disablesAnimations = true
                withTransaction(transaction) {
                    end_register = true
                }
            }) {
                Image(systemName: "chevron.backward")
                    .resizable()
                    .scaledToFit()
                    .font(.system(size: 20, weight: .bold))
                    .frame(height: 20.0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                    .foregroundColor(.gray)
            }
            .fullScreenCover(isPresented: $end_register) {
                LoginPage()
            }
            
            ScrollView {
                VStack {
                    VStack {
                        HStack {
                            TextView(text: "表示名", textPattern: 0)
                            TextField("", text: $input)
                                .frame(width: 140, height: 50)
                                .padding(.leading, 15)
                                .overlay(RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.grayBottonColor, lineWidth: 2)
                                )
                                .padding(.leading, 10)
                            
                            Image("userIcon_plus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 90, height: 90)
                                .padding(.leading, 25)
                        }
                        Text("※ '表示名'は第三者に公開されます")
                            .foregroundColor(.gray)
                    }
                    .padding(.bottom, 20)
                    
                    VStack(spacing: 15) {
                        HStack {
                            TextView(text: "姓", textPattern: 0)
                            TextField("", text: $input)
                                .frame(width: 240, height: 48)
                                .padding(.leading, 15)
                                .overlay(RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.grayBottonColor, lineWidth: 2)
                                )
                                .padding(.leading, 25)
                        }
                        
                        HStack {
                            TextView(text: "名", textPattern: 0)
                            TextField("", text: $input)
                                .frame(width: 240, height: 48)
                                .padding(.leading, 15)
                                .overlay(RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.grayBottonColor, lineWidth: 2)
                                )
                                .padding(.leading, 25)
                        }
                    }
                    .padding(.bottom, 20)
                    
                    VStack(spacing: 20) {
                        TextBox(fieldHide: false, titleText: "メールアドレス", descriptionText: "学内メールを入力してください", inputText: $ikkk)
                        TextBox(fieldHide: true, titleText: "パスワード", descriptionText: "", inputText: $ikkk)
                        TextBox(fieldHide: true, titleText: "パスワード確認", descriptionText: "", inputText: $ikkk)
                        PullDownSelectView(labelName: "学年", selectList: ["学部1年", "学部2年", "学部3年", "学部4年"], startSelection: "学部1年")
                        PullDownSelectView(labelName: "所属コース", selectList: ["aaa", "bbb", "ccc", "ddd"], startSelection: "bbb")
                    }
                    .padding(.bottom, 40)
                    
                    BaseButtonView(
                        action: {},
                        labelText: "新規会員登録",
                        foregroundColor: Color.white,
                        backgroundColor: Color.subPink, radius: 25
                    )
                }
            }
        }
    }
}

struct SignUpPage_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPage()
    }
}
