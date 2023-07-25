//
//  ButtonView.swift
//  portfolio-ios-swiftui
//
//  Created by まっすー on 2022/06/27.
//
import SwiftUI

struct BaseButtonView: View {
    var action: () -> Void
    var labelText: String
    var textSize: CGFloat?
    var foregroundColor: Color
    var backgroundColor: Color
    var radius: CGFloat
    var lineColor: Color
    var width: CGFloat?
    var height: CGFloat?

    init(action: @escaping () -> Void, labelText: String, textSize: CGFloat? = nil, foregroundColor: Color, backgroundColor: Color, radius: CGFloat? = 0, lineColor: Color? = Color.clear, width: CGFloat? = nil, height: CGFloat? = nil) {
        self.action = action
        self.labelText = labelText
        self.textSize = textSize
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.radius = radius ?? 0
        self.lineColor = lineColor ?? Color.clear
        self.width = width
        self.height = height
    }

    private func getWidthSize(text: String) -> CGFloat {
        var widthSize: CGFloat
        if text.count > 5 {
            widthSize = 190
        } else {
            widthSize = 100
        }
        // 日本語7文字以上は改行になる, エラーハンドリング
        return widthSize
    }

    private func limit(text: String) -> String {
        var word = text
        word = String(word.prefix(7))
        return word
    }

    var body: some View {
        Button {
            action()
        } label: {
            let words = limit(text: self.labelText)
            let widthSize = getWidthSize(text: words)

            Text(words)
                .font(.system(size: textSize ?? 20))
                .frame(width: width ?? getWidthSize(text: words), height: height ?? 50)
                .lineLimit(1)
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
                .cornerRadius(radius)
                .overlay(
                    // overlay
                    RoundedRectangle(cornerRadius: radius).stroke(lineColor, lineWidth: 2)
                )
        }
    }
}

struct CommonButtonView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 30) {
            BaseButtonView(
                action: { print("何か処理をするよー") },
                labelText: "新規会員登録",
                foregroundColor: Color.white,
                backgroundColor: Color.subPink, radius: 25
            )
            BaseButtonView(
                action: { print("何か処理をするよー") },
                labelText: "保存",
                foregroundColor: Color.textPinkColor,
                backgroundColor: Color.clear, radius: 25, lineColor: Color.textPinkColor
            )
            BaseButtonView(
                action: { print("何か処理をするよー") },
                labelText: "hoge",
                foregroundColor: Color.text,
                backgroundColor: Color.grayBottonColor, radius: 25
            )
            BaseButtonView(
                action: { print("何か処理をするよー") },
                labelText: "投稿",
                textSize: 15,
                foregroundColor: Color.white,
                backgroundColor: Color.subPink, radius: 25,
                height: 40
            )
        }
    }
}
