//
//  SignupPage.swift
//  portfolio-ios-swiftui
//
//  Created by 鳥山英峻 on 2023/02/19.
//

import SwiftUI

struct SignupPage: View {
    
    @ObservedObject var signup = SignupViewModel()
    @State var end_register: Bool = false
    
    let gradeList = ["学部1年", "学部2年", "学部3年", "学部4年","修士1年","修士2年","博士1年","博士2年","博士3年"]
    let courseList = ["情報システムコース","情報デザインコース","複雑系コース","知能システムコース","情報アーキテクチャ領域","高度ICT領域","メディアデザイン領域","複雑系情報科学領域","知能情報科学領域"]
    
    var body: some View {
        VStack {
            // MARK: - backbutton処理
            Button(action: {
                // アニメーションを削除する処理
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
            // MARK: - 入力フォーム処理
            
            ScrollView {
                VStack {
                    VStack {
                        HStack {
                            TextView(text: "表示名", textPattern: 0)
                            TextField("", text: $signup.displayName)
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
                            TextField("", text: $signup.familyName)
                                .frame(width: 240, height: 48)
                                .padding(.leading, 15)
                                .overlay(RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.grayBottonColor, lineWidth: 2)
                                )
                                .padding(.leading, 25)
                        }
                        
                        HStack {
                            TextView(text: "名", textPattern: 0)
                            TextField("", text: $signup.firstName)
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
                        TextBox(fieldHide: false, titleText: "メールアドレス", descriptionText: "学内メールを入力してください", inputText: $signup.mail)
                        TextBox(fieldHide: true, titleText: "パスワード", descriptionText: "", inputText: $signup.password)
                        TextBox(fieldHide: true, titleText: "パスワード確認", descriptionText: "", inputText: $signup.checkPassword)
                        PullDownSelectView(labelName: "学年", selectList: gradeList, selectionLabel: $signup.grade)
                        PullDownSelectView(labelName: "所属コース", selectList: courseList, selectionLabel: $signup.course)
                    }
                    .padding(.bottom, 40)
                    
                    // MARK: - 登録処理
                    
                    BaseButtonView(
                        action: {
                            signup.fetchSignupService()
                        },
                        labelText: "新規会員登録",
                        foregroundColor: Color.white,
                        backgroundColor: Color.subPink, radius: 25
                    )
                }
            }
        }
    }
}

struct SignupPage_Previews: PreviewProvider {
    static var previews: some View {
        SignupPage()
    }
}
