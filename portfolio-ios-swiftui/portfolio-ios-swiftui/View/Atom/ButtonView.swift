//
//  ButtonView.swift
//  portfolio-ios-swiftui
//
//  Created by まっすー on 2022/06/27.
//
import SwiftUI

struct ButtonView: View {
    let label: String
    // let color: Int

    enum ColorPattern: String {
        case nomal = "nomal"
        case invite = "invite"
        case new = "new"
        case wip = "wip"
    }

    let colorPattern: ColorPattern.RawValue

    let gradientView = LinearGradient(
        gradient: Gradient(colors: [Color(red: 255 / 255, green: 144 / 255, blue: 179 / 255),
                                    Color(red: 255 / 255, green: 194 / 255, blue: 226 / 255)]),
        startPoint: .top,
        endPoint: .bottom)

    var body: some View {

        let widthSize = getWidthSize(text: label)

        switch colorPattern {
        case ColorPattern.nomal.rawValue:
            Button(action: {
                print("押した")
            }) {
                Text(label)
                    .font(.system(size: 20))
                    .frame(width: widthSize, height: 50)
                    .foregroundColor(Color.white)
                    .background(gradientView)
                    .cornerRadius(25)
            }
        case ColorPattern.invite.rawValue:
            Button(action: {
                print("押した")
            }) {
                Text(label)
                    .font(.system(size: 20))
                    .frame(width: widthSize, height: 50)
                    .foregroundColor(Color(red: 255 / 255, green: 144 / 255, blue: 179 / 255))
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color(red: 255 / 255, green: 144 / 255, blue: 179 / 255), lineWidth: 2)
                    )
            }
        case ColorPattern.new.rawValue:
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
        VStack(spacing: 30) {
            ButtonView(label: "保存", colorPattern: "nomal")
            ButtonView(label: "招待", colorPattern: "invite")
            ButtonView(label: "下書き", colorPattern: "wip")
            ButtonView(label: "新規会員登録", colorPattern: "new")
        }
    }
}
