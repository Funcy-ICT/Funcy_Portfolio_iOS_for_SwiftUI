//
//  ButtonView.swift
//  portfolio-ios-swiftui
//
//  Created by まっすー on 2022/06/27.
//
import SwiftUI

struct ButtonView: View {
    @State var label: String

    enum ColorPattern: Int {
        case normal = 0
        case invite = 1
        case new = 2
        case wip = 3
    }

    let colorPattern: ColorPattern.RawValue

    let gradientView = LinearGradient(
        gradient: Gradient(colors: [Color(red: 255 / 255, green: 144 / 255, blue: 179 / 255),
                                    Color(red: 255 / 255, green: 194 / 255, blue: 226 / 255)]),
        startPoint: .top,
        endPoint: .bottom)

    var body: some View {
        let words = limit(text: label)

        let widthSize = getWidthSize(text: words)

        switch colorPattern {
        case ColorPattern.normal.rawValue:
            Button(action: {
                print("押した")
            }) {
                Text(words)
                    .font(.system(size: 20))
                    .foregroundColor(Color.white)
                    .lineLimit(1)
            }
            .frame(width: widthSize, height: 50)
            .background(gradientView)
            .cornerRadius(25)
            .padding(.horizontal, 30)

        case ColorPattern.invite.rawValue:
            Button(action: {
                print("押した")
            }) {
                Text(words)
                    .font(.system(size: 20))
                    .frame(width: widthSize, height: 50)
                    .foregroundColor(Color(red: 255 / 255, green: 144 / 255, blue: 179 / 255))
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color(red: 255 / 255, green: 144 / 255, blue: 179 / 255), lineWidth: 2)
                    )
                    .lineLimit(1)
            }
        case ColorPattern.new.rawValue:
            Button(action: {
                print("押した")
            }) {
                Text(words)
                    .font(.system(size: 20))
                    .frame(width: widthSize, height: 50)
                    .foregroundColor(Color(red: 112 / 255, green: 127 / 255, blue: 137 / 255))
                    .background(Color(red: 229 / 255, green: 229 / 255, blue: 229 / 255))
                    .cornerRadius(25)
                    .lineLimit(1)
            }
        default:
            Button(action: {
                print("押した")
            }) {
                Text(words)
                    .font(.system(size: 20))
                    .foregroundColor(Color(red: 255 / 255, green: 144 / 255, blue: 179 / 255))
                    .lineLimit(1)
            }
        }
    }
}

func getWidthSize(text: String) -> CGFloat {

    let textCount = text.count
    var widthSize: CGFloat
    if textCount > 5 {
        widthSize = 190
    } else {
        widthSize = 100
    }
    // 日本語7文字以上は改行になる, エラーハンドリング
    return widthSize
}

func limit(text: String) -> String {
    var word = text
    word = String(word.prefix(7))
    return word
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 30) {
            ButtonView(label: "保存保存保存保存保", colorPattern: 0)
            ButtonView(label: "招待", colorPattern: 1)
            ButtonView(label: "下書き", colorPattern: 3)
            ButtonView(label: "新規会員登録", colorPattern: 2)
        }
    }
}
