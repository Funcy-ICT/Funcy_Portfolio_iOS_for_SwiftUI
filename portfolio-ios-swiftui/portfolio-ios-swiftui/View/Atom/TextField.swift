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
    var width: CGFloat = 240
    var height: CGFloat = 40
    
    var body: some View {

        VStack(alignment: .leading) {
            Text(text)
                .foregroundColor(Color.text)
            TextField("入力してください", text: $inputText)
                .frame(width: width, height: height)
                .padding(.leading, 15)
                .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.grayBottonColor, lineWidth: 2)
                )
                .padding(.leading, 25)
        }
    }
}

// // if DEBUG
//
//struct TextBox_Previews: PreviewProvider {
//    static var previews: some View {
//        TextBox(text: "メールアドレス")
//    }
//}
//
// // end if
