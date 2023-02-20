//
// TextBox.swift
// portfolio-ios-swiftui
//
// Created by fun_massu on 2022/09/26.
//

import SwiftUI

struct TextBox: View {
    
    let fieldHide: Bool
    let titleText: String
    let descriptionText: String
    
    @Binding var inputText: String
    
    var body: some View {
        VStack(alignment: .leading) {
            TextView(text: titleText, textPattern: 0)
            
            if fieldHide {
                SecureField(descriptionText, text: $inputText)
                    .frame(width: 294, height: 48)
                    .padding(.leading, 15)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.grayBottonColor, lineWidth: 2)
                    )
                    .padding(.leading, 25)
            } else {
                TextField(descriptionText, text: $inputText)
                    .frame(width: 294, height: 48)
                    .padding(.leading, 15)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.grayBottonColor, lineWidth: 2)
                    )
                    .padding(.leading, 25)
            }
        }
    }
}

//struct TextBox_Previews: PreviewProvider {
//    @State private var test = ""
//
//    static var previews: some View {
//        TextBox(titleText: "メールアドレス", inputText: $test)
//    }
//}
