//
//  ButtonView.swift
//  portfolio-ios-swiftui
//
//  Created by まっすー on 2022/06/27.
//

import SwiftUI

struct ButtonView: View {
    let label: String
    let color: Int

    var body: some View {

        var widthSize = getWidthSize(text: label)
        switch color {
        case 0:
            Button(action: {
                print("押した")
            }) {
                Text(label)
                    .font(.system(size: 20))
                    .frame(width: widthSize, height: 50)
                    .foregroundColor(Color.white)
                    .background(Color(red: 253 / 255, green: 179 / 255, blue: 202 / 255))
                    .cornerRadius(25)
            }
        case 1:
            Button(action: {
                print("押した")
            }) {
                Text(label)
                    .font(.system(size: 20))
                    .frame(width: widthSize, height: 50)
                    .foregroundColor(Color(red: 112 / 255, green: 127 / 255, blue: 137 / 255))
                    .background(Color(red: 229 / 255, green: 229 / 255, blue: 229 / 255))
                    .cornerRadius(25)
            }
        default:
            Button(action: {
                print("押した")
            }) {
                Text(label)
                    .font(.system(size: 20))
                    .foregroundColor(Color(red: 255 / 255, green: 144 / 255, blue: 179 / 255))
            }
        }
    }
}

func getWidthSize(text: String) -> CGFloat {
    let textCount = text.count
    var widthSize: CGFloat
    if textCount > 5 {
        widthSize = 170
    } else {
        widthSize = 100
    }
    return widthSize
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(label: "投稿", color: 0)
        ButtonView(label: "登録", color: 1)
        ButtonView(label: "下書き", color: 2)
        ButtonView(label: "新規会員登録", color: 1)
    }
}
