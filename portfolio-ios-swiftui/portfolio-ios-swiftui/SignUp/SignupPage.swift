//
//  SignupPage.swift
//  portfolio-ios-swiftui
//
//  Created by 鳥山英峻 on 2023/02/19.
//

import SwiftUI

struct SignupPage: View {
    
    @ObservedObject var signup = SignupViewModel()
    @Environment(\.presentationMode) var presentationMode
    @State var end_register: Bool = false
    
    let gradeList = ["学部1年", "学部2年", "学部3年", "学部4年","修士1年","修士2年","博士1年","博士2年","博士3年","教員"]
    
    let courseList = ["未所属","高度ICTコース","情報システムコース","情報デザインコース","複雑系コース","知能システムコース","情報アーキテクチャ領域","高度ICT領域","メディアデザイン領域","複雑系情報科学領域","知能情報科学領域","教員"]
    
    var body: some View {
        VStack {
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
                            
                            SwiftUI.Image("userIcon_plus")
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
                        TextBox(inputText: $signup.mail, titleText: "メールアドレス", descriptionText: "学内メールを入力してください")
                        TextBox(inputText: $signup.password, titleText: "パスワード", descriptionText: "", fieldHide: true)
                        TextBox(inputText: $signup.checkPassword, titleText: "パスワード確認", descriptionText: "", fieldHide: true)
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
        .navigationBarBackButtonHidden(true) // デフォルトの戻るボタンを隠す
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    SwiftUI.Image(systemName: "chevron.backward")
                        .resizable()
                        .scaledToFit()
                        .font(.system(size: 20, weight: .bold))
                        .frame(height: 20.0)
                        .foregroundColor(.gray)
                }
                .padding(.leading, 20)
            }
        }
    }
}

struct SignupPage_Previews: PreviewProvider {
    static var previews: some View {
        SignupPage()
    }
}

enum Grade: String, CaseIterable, Identifiable {
    case b1 = "学部1年"
    case b2 = "学部2年"
    case b3 = "学部3年"
    case b4 = "学部4年"
    case m1 = "修士1年"
    case m2 = "修士2年"
    case d1 = "博士1年"
    case d2 = "博士2年"
    case d3 = "博士3年"
    case t1 = "教員"
    
    var id: String { self.rawValue }
    var displayName: String {
        switch self {
        case .b1:
            return "学部1年"
        case .b2:
            return "学部2年"
        case .b3:
            return "学部3年"
        case .b4:
            return "学部4年"
        case .m1:
            return "修士1年"
        case .m2:
            return "修士2年"
        case .d1:
            return "博士1年"
        case .d2:
            return "博士2年"
        case .d3:
            return "博士3年"
        case .t1:
            return "教員"
        }
    }
}
