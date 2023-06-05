//
// TextBox.swift
// portfolio-ios-swiftui
//
// Created by fun_massu on 2022/09/26.
//
import SwiftUI
struct TextBox: View {
    @State private var inputText = ""
    
    enum TextFieldPattern: Int {
        case normal = 0
        case hide = 1
    }

    let text: String
    let textFieldPattern: TextFieldPattern.RawValue
    @State  var show: Bool = false
    @FocusState  var focusText: Bool
    @FocusState  var focusSecure: Bool
    
    var body: some View {

        switch textFieldPattern{
        case TextFieldPattern.hide.rawValue:
            
            VStack(alignment: .leading) {
                Text(text)
                    .foregroundColor(Color.text)
                
                HStack{
                    ZStack(alignment: .trailing) {
                        TextField("入力してください", text: $inputText)
                            .autocapitalization(.none)
                            .focused($focusText)
                            .opacity(show ? 1 : 0)
                            .frame(width: 240, height: 40)
                            .padding(.leading, 15)
                            .overlay(RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.grayBottonColor, lineWidth: 2)
                            )
                            .padding(.leading, 25)
                        
                        SecureField("入力してください", text: $inputText)
                            .autocapitalization(.none)
                            .focused($focusText)
                            .opacity(show ? 0 : 1)
                            .frame(width: 240, height: 40)
                            .padding(.leading, 15)
                            .overlay(RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.grayBottonColor, lineWidth: 2)
                            ).padding(.leading, 25)
                         
                        Button(action: {
                            show.toggle()
                            if show {
                                focusText = true
                            } else {
                                focusSecure = true
                            }
                        }, label: {
                            Image(systemName: self.show ? "eye.slash.fill" : "eye.fill")
                            .padding()
                            .font(.system(size: 15))
                            
                        })
                        }
                    }
                }
        
        default:
            VStack(alignment: .leading) {
                Text(text)
                    .foregroundColor(Color.text)
                TextField("入力してください", text: $inputText)
                    .autocapitalization(.none)
                    .focused($focusText)
                    .frame(width: 240, height: 40)
                    .padding(.leading, 15)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.grayBottonColor, lineWidth: 2)
                    )
                    .padding(.leading, 25)
            }
        }
    }
}

struct TextBox_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            TextBox(text: "メールアドレス", textFieldPattern: 0)
            TextBox(text: "パスワード", textFieldPattern: 1)
        }
    }
}
