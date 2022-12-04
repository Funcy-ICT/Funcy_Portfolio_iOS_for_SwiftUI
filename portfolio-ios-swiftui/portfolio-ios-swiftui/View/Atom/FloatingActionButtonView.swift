//
//  FloatingActionButtonView.swift
//  portfolio-ios-swiftui
//
//  Created by Takeru Sakakibara on 2022/10/03.
//

import SwiftUI

struct FloatingActionButtonView: View {
    // 上位ViewにNavigationViewが必要です

    var buttonSize: CGFloat = 50 // ボタンの大きさ
    var buttonColor: Color = Color.fabColor // ボタンの色

    var isNewGroupPostView: Bool = false // 対象がグループのものかどうか

    var body: some View {
        NavigationLink(
            destination: {
                switch isNewGroupPostView {
                case true:
                    TestView2() // グループの新規投稿View
                default:
                    TestView1() // 個人の新規投稿View

                }
            },
            label: {
                ZStack {
                    Circle()
                        .fill(buttonColor)
                        .frame(width: buttonSize, height: buttonSize)
                        .shadow(radius: 2, x: 1, y: 2)

                    Image(systemName: "plus")
                        .frame(width: buttonSize, height: buttonSize)
                        .foregroundColor(.white)
                        .font(.system(size: buttonSize * 0.7))

                }
            })
    }
}

struct FloatingActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VStack {
                FloatingActionButtonView()
                FloatingActionButtonView(isNewGroupPostView: true)
                FloatingActionButtonView(buttonSize: 30, buttonColor: Color.red, isNewGroupPostView: true)

            }
        }
    }
}
