//
// TextBox.swift
// portfolio-ios-swiftui
//
// Created by fun_massu on 2022/09/26.
//
import SwiftUI
struct TextBox: View {
    @Binding var inputText: String
    var titleText: String
    var descriptionText: String = "入力してください"
    var fieldHide: Bool = false
    var width: CGFloat = 294
    var height: CGFloat = 48
    var lines: ClosedRange = 1...1
    @FocusState var focus: Bool
    
    var body: some View {
        
        if lines == 1...1 { // 単一行のTextField
            VStack(alignment: .leading) {
                TextView(text: titleText, textPattern: 0)

                if fieldHide {
                    SecureField(descriptionText, text: $inputText)
                        .autocapitalization(.none)
                        .frame(width: width, height: height)
                        .padding(.leading, 15)
                        .overlay(RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.grayBottonColor, lineWidth: 2))
                        .padding(.leading, 25)
                } else {
                    TextField(descriptionText, text: $inputText)
                        .autocapitalization(.none)
                        .frame(width: width, height: height)
                        .padding(.leading, 15)
                        .overlay(RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.grayBottonColor, lineWidth: 2))
                        .padding(.leading, 25)
                }
            }
        } else { // 複数行のTextField
            VStack(alignment: .leading) {
                Text(titleText)
                    .foregroundColor(Color.text)
                TextField(descriptionText, text: $inputText, axis: .vertical)
                    .autocapitalization(.none)
                    .frame(width: width)
                    .padding(.top, 10)
                    .lineLimit(lines)
                    .padding(.leading, 15)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.grayBottonColor, lineWidth: 2))
                    .padding(.leading, 25)
            }
        }
    }
}

//#if DEBUG
//struct TextBox_Previews: PreviewProvider {
//    static var previews: some View {
//        VStack(alignment: .leading) {
//            TextBox(inputText: .constant(""), titleText: "メールアドレス")
//            TextBox(inputText: .constant(""), titleText: "パスワード", descriptionText: "8文字以上記号必須", fieldHide: true)
//            TextBox(inputText: .constant(""), titleText: "メールアドレス", width: 300)
//            TextBox(inputText: .constant(""), titleText: "メールアドレス", lines: 6...6)
//            TextBox(inputText: .constant(""), titleText: "メールアドレス", width: 200, lines: 5...5)
//        }
//    }
//}
//#endif
