//
//  SignupPage.swift
//  portfolio-ios-swiftui
//
//  Created by 鳥山英峻 on 2023/02/19.
//

import PhotosUI
import SwiftUI

struct SignupPage: View {
    
    // MARK: - バリデーション
    
    private func validateAll() {
        // 入力フィールドのバリデーション
        if signup.displayName.isEmpty || signup.mail.isEmpty || signup.password.isEmpty ||
            signup.checkPassword.isEmpty || signup.displayName.isEmpty ||
            signup.grade.isEmpty || signup.course.isEmpty {
            alertMessage = "全てのフィールドを入力してください。"
            showAlert = true
            return
        }
        
        // メールアドレスのバリデーション
        if !signup.mail.hasSuffix("@fun.ac.jp") {
            alertMessage = "学内メールアドレスは@fun.ac.jpで終わる必要があります。"
            showAlert = true
            return
        }
        
        // パスワードのバリデーション
        if !isValidPassword(signup.password) {
            alertMessage = "英大文字、小文字数字、記号を組み合わせて、10桁以上最大64文字までのパスワードを設定してください。"
            showAlert = true
            return
        }
        
        // 学年とコースの組み合わせバリデーション
        if !isValidCombination() {
            alertMessage = "学年とコースの組み合わせが正しくありません。"
            showAlert = true
            return
        }
                
        // パスワードと確認用パスワードの一致バリデーション
        if signup.password != signup.checkPassword {
            alertMessage = "パスワードが一致しません。"
            showAlert = true
            return
        }
        
        if signup.userIcon.isEmpty {
            alertMessage = "アイコンを設定してください。"
            showAlert = true
            return
        }
        
        // 全てのバリデーションを通過した場合
        showAlert = false
        // 適切な処理を実行
    }
    
    private func validateEmail() {
        if !signup.mail.hasSuffix("@fun.ac.jp") {
            showAlert = true
        } else {
            showAlert = false
        }
    }
    
    private func isValidPassword(_ password: String) -> Bool {
        let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*()_+{}:\"<>?\\[\\];',.])[A-Za-z\\d!@#$%^&*()_+{}:\"<>?\\[\\];',.]{10,64}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        let result = passwordTest.evaluate(with: password)
        
        return result
    }
    
    private func isValidCombination() -> Bool {
        switch signup.grade {
        case "学部1年":
            return signup.course == "未所属"
        case "学部2年":
            return ["情報システムコース", "情報デザインコース", "複雑系コース", "知能システムコース"].contains(signup.course)
        case "学部3年", "学部4年":
            return ["高度ICTコース", "情報システムコース", "情報デザインコース", "複雑系コース", "知能システムコース"].contains(signup.course)
        case "修士1年", "修士2年", "博士1年", "博士2年", "博士3年":
            return ["高度ICTコース", "情報アーキテクチャ領域", "高度ICT領域", "メディアデザイン領域", "複雑系情報科学領域", "知能情報科学領域"].contains(signup.course)
        case "教員":
            return signup.course == "教員"
        default:
            return false
        }
    }
    
    // MARK: - 定義
    
    @ObservedObject var signup = SignupViewModel()
    @Environment(\.presentationMode) var presentationMode
    @State var end_register: Bool = false
    @State private var selectedImage: UIImage?
    @State private var isPickerPresented = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    let gradeList = ["学部1年", "学部2年", "学部3年", "学部4年",
                     "修士1年", "修士2年",
                     "博士1年", "博士2年", "博士3年",
                     "教員"]
    
    let courseList = ["未所属",
                      "高度ICTコース", "情報システムコース", "情報デザインコース", "複雑系コース", "知能システムコース",
                      "情報アーキテクチャ領域", "高度ICT領域", "メディアデザイン領域", "複雑系情報科学領域", "知能情報科学領域", "教員"]
    
    var body: some View {
        VStack {
            
            // MARK: - 入力フォーム処理
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    VStack {
                        HStack(spacing: 15) {
                            TextView(text: "表示名", textPattern: 0)
                            TextField("", text: $signup.displayName)
                                .frame(width: 140, height: 50)
                                .padding(.leading, 15)
                                .overlay(RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.grayBottonColor, lineWidth: 2)
                                )
                                .padding(.trailing, 25)
                            
                            if let selectedImage = selectedImage {
                                Button(action: {
                                    isPickerPresented = true
                                }, label: {
                                    SwiftUI.Image(uiImage: selectedImage)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 74.0, height: 74.0)
                                        .clipShape(Circle())
                                })
                            } else {
                                Button(action: {
                                    isPickerPresented = true
                                }, label: {
                                    SwiftUI.Image("user_plus")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 74.0, height: 74.0)
                                })}
                        }
                        .sheet(isPresented: $isPickerPresented) {
                            PhotoPicker(selectedImage: $selectedImage)
                        }
                        Text("※ '表示名'は第三者に公開されます")
                            .foregroundColor(.gray)
                            .padding(.top, 10)
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
                        TextBox(
                            inputText: $signup.mail,
                            titleText: "メールアドレス",
                            descriptionText: "学内メールを入力してください"
                        )
                        TextBox(
                            inputText: $signup.password,
                            titleText: "パスワード",
                            descriptionText: "",
                            fieldHide: true
                        )
                        TextBox(
                            inputText: $signup.checkPassword,
                            titleText: "パスワード確認",
                            descriptionText: "",
                            fieldHide: true
                        )
                        PullDownSelectView(
                            labelName: "学年",
                            selectList: gradeList,
                            selectionLabel: $signup.grade
                        )
                        PullDownSelectView(
                            labelName: "所属コース",
                            selectList: courseList,
                            selectionLabel: $signup.course
                        )
                    }
                    .padding(.bottom, 40)
                    
                    // MARK: - 登録処理
                    BaseButtonView(
                        action: {
                            validateAll()
                            signup.fetchSignupService()
                        },
                        labelText: "新規会員登録",
                        foregroundColor: Color.white,
                        backgroundColor: Color.subPink, radius: 25
                    )
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("エラー"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                    }
                }
                .padding(.top)
            }
        }
        // デフォルトの戻るボタンを隠す
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    SwiftUI.Image(systemName: "chevron.backward")
                        .resizable()
                        .scaledToFit()
                        .font(.system(size: 20, weight: .bold))
                        .frame(height: 20.0)
                        .foregroundColor(.gray)
                })
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
