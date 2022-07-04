//
//  ButtonView.swift
//  portfolio-ios-swiftui
//
//  Created by まっすー on 2022/06/27.
//
import SwiftUI

struct ButtonView: View {
    @State var label: String

    enum ColorPattern {
        case normal
        case invite
        case new
        case wip
        
    }

    let colorPattern: ColorPattern

    let gradientView = LinearGradient(
        gradient: Gradient(colors: [Color(red: 255 / 255, green: 144 / 255, blue: 179 / 255),
                                    Color(red: 255 / 255, green: 194 / 255, blue: 226 / 255)]),
        startPoint: .top,
        endPoint: .bottom)

    var body: some View {
        let words = limit(text: label)

        let widthSize = getWidthSize(text: words)

        switch colorPattern {
        case ColorPattern.normal:
            CommonButtonView(action: { print("保存")},
                             labelText: words,
                             width: widthSize,
                             foregroundColor: Color.white, overlay: EmptyView()
            )
            .background(gradientView)
            .cornerRadius(25)
            .padding(.horizontal, 30)

        case ColorPattern.invite:
            CommonButtonView(
                action: { print("招待")},
                labelText: words,
                width: widthSize,
                foregroundColor: Color(red: 255 / 255, green: 144 / 255, blue: 179 / 255),
                overlay:
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color(red: 255 / 255, green: 144 / 255, blue: 179 / 255), lineWidth: 2)
            )
            
        case ColorPattern.new:
            CommonButtonView(
                action: { print("下書き")},
                labelText: words,
                width: widthSize,
                foregroundColor: Color(red: 112 / 255, green: 127 / 255, blue: 137 / 255),
                backgroundColor: Color(red: 229 / 255, green: 229 / 255, blue: 229 / 255),
                overlay: EmptyView(),
                radius: 20.0
            )
            
        default:
            CommonButtonView(
                action: { print("新規会員登録")},
                labelText: words,
                width: widthSize,
                foregroundColor: Color(red: 255 / 255, green: 144 / 255, blue: 179 / 255),
                overlay: EmptyView()
            )
        }
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
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 30) {
            ButtonView(label: "保存保存保存保存保", colorPattern: .normal)
            ButtonView(label: "招待", colorPattern: .invite)
            ButtonView(label: "下書き", colorPattern: .wip)
            ButtonView(label: "新規会員登録", colorPattern: .new)
        }
    }
}
