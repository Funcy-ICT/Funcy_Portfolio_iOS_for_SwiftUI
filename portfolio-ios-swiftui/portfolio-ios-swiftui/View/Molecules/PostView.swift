//
//  PostView.swift
//  portfolio-ios-swiftui
//
//  Created by Takeru Sakakibara on 2023/06/26.
//

import SwiftUI

struct PostView: View {
    @State private var publishing = false
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {
                    // ここにアクションを追加する
                }) {
                    Image(systemName: "lessthan")
                        .resizable()
                        .frame(width: 25, height: 40)
                        .foregroundColor(.gray)
                }
                IconView(imageName: "testpic", iconPattern: .small)
                BaseButtonView(
                    action: { print("何か処理をするよー") },
                    labelText: "下書き",
                    foregroundColor: Color.textPinkColor,
                    backgroundColor: Color.clear, radius: 25, lineColor: Color.textPinkColor
                )
                BaseButtonView(
                    action: { print("何か処理をするよー") },
                    labelText: "投稿",
                    foregroundColor: Color.white,
                    backgroundColor: Color.subPink, radius: 25
                )
            }
            Divider()
                .frame(width: 350, height: 1)
                .background(Color.black)
            Text("公開設定")
                .padding(.leading, 22)
                .foregroundColor(Color.text)
            Toggle("公開", isOn: $publishing)
                .toggleStyle(SwitchToggleStyle(tint: .textPinkColor))
                .frame(width: 100)
                .padding(.leading, 30)
            TextBox(text: "タイトル")
                .padding(20)
            TextBox(text: "説明文")
                .padding(20)
            TextBox(text: "Githubリンク")
                .padding(20)
            TextBox(text: "Youtubeリンク")
                .padding(20)
            // tagのviewはここに
            
            // 写真追加も
            
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
