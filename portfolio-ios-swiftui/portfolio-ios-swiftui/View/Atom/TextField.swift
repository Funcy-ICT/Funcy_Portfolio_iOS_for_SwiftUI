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
    var descriptionText: String
    var fieldHide: Bool = false
    var width: CGFloat = 294
    var height: CGFloat = 48

    var body: some View {
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
    }
}


//#if DEBUG
//struct TextBox_Previews: PreviewProvider {
//    static var previews: some View {
//        VStack {
//            TextBox(text: "メールアドレス")
//            TextBox(text: "メールアドレス", width: 300)
//            TextBox(text: "メールアドレス", height: 80)
//            TextBox(text: "メールアドレス", width: 200, height: 200)
//        }
//    }
//}
//#endif
