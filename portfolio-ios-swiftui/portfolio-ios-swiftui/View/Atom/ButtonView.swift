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
    var foregroundColor: Color
    var backgroundColor: Color
    var overlay: AnyView
    var radius: CGFloat

    init<V>(action: @escaping () -> Void, labelText: String, foregroundColor: Color, backgroundColor: Color, overlay: V? = nil, radius: CGFloat? = 0) where V: View {
        self.action = action
        self.labelText = labelText
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.overlay = AnyView(overlay)
        self.radius = radius ?? 0
    }

    var body: some View {
        Button {
            action()
        } label: {
            let words = limit(text: self.labelText)
            let widthSize = getWidthSize(text: words)

            Text(words)
                .font(.system(size: 20))
                .frame(width: widthSize, height: 50)
                .lineLimit(1)
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
                .cornerRadius(radius)
                .overlay(
                    overlay
                )
        }
    }
}

struct GradientButtonView: View {
    var action: () -> Void
    var labelText: String
    var foregroundColor: Color
    var backgroundColor: LinearGradient
    var overlay: AnyView
    var radius: CGFloat

    init<V>(action: @escaping () -> Void, labelText: String, foregroundColor: Color, backgroundColor: LinearGradient, overlay: V? = nil, radius: CGFloat? = 0) where V: View {
        self.action = action
        self.labelText = labelText
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.overlay = AnyView(overlay)
        self.radius = radius ?? 0
    }

    var body: some View {
        Button {
            action()
        } label: {
            let words = limit(text: self.labelText)
            let widthSize = getWidthSize(text: words)

            Text(words)
                .font(.system(size: 20))
                .frame(width: widthSize, height: 50)
                .lineLimit(1)
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
                .cornerRadius(radius)
                .overlay(
                    overlay
                )
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

struct CommonButtonView_Previews: PreviewProvider {

    static var previews: some View {
        let gradientPink = LinearGradient(
            gradient: Gradient(colors: [Color.textPinkColor,
                                        Color.subPink]),
            startPoint: .top,
            endPoint: .bottom)

        VStack(spacing: 30) {
            GradientButtonView(
                action: { print("何か処理をするよー") },
                labelText: "登録登録登録登録登録",
                foregroundColor: Color.white,
                backgroundColor: gradientPink,
                overlay: EmptyView(), radius: 25
            )
            BaseButtonView(
                action: { print("何か処理をするよー") },
                labelText: "hoge",
                foregroundColor: Color.textPinkColor,
                backgroundColor: Color.clear, overlay: EmptyView(), radius: 25
            )
            BaseButtonView(
                action: { print("何か処理をするよー") },
                labelText: "hoge",
                foregroundColor: Color.text,
                backgroundColor: Color.grayBottonColor, overlay: EmptyView(), radius: 25
            )

        }
    }
}
