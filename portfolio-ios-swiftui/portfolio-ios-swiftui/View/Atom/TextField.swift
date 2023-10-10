//
// TextBox.swift
// portfolio-ios-swiftui
//
// Created by fun_massu on 2022/09/26.
//
import SwiftUI
struct TextBox: View {
    @State private var inputText = ""
    let text: String
    var width: CGFloat = 250
    var height: CGFloat = 40 // TextFieldの時にのみ使用可能
    var lines: ClosedRange = 1...1
    @FocusState  var isActive: Bool
    
    var body: some View {
        
        if lines == 1...1 {
            VStack(alignment: .leading) {
                Text(text)
                    .foregroundColor(Color.text)
                TextField("入力してください", text: $inputText)
                    .autocapitalization(.none)
                    .frame(width: width, height: height)
                    .lineLimit(lines)
                    .padding(.leading, 10)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.grayBottonColor, lineWidth: 2))
                    .padding(.leading, 25)
            }
        } else {
            VStack(alignment: .leading) {
                Text(text)
                    .foregroundColor(Color.text)
                TextField("入力してください", text: $inputText, axis: .vertical)
                    .autocapitalization(.none)
                    .frame(width: width)
                    .padding(.top, 10)
                    .lineLimit(lines)
                    .padding(.leading, 10)
                    .overlay(RoundedRectangle(cornerRadius: 20)
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
//            TextBox(text: "メールアドレス")
//            TextBox(text: "メールアドレス", width: 300)
//            TextBox(text: "メールアドレス", lines: 6...6)
//            TextBox(text: "メールアドレス", width: 200, lines: 5...5)
//        }
//    }
//}
//#endif
