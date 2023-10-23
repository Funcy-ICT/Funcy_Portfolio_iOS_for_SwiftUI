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
                Button(
                    action: {
                        // ここにアクションを追加する
                    },
                    label: {
                        SwiftUI.Image(systemName: "lessthan")
                            .resizable()
                            .frame(width: 15, height: 30)
                            .foregroundColor(.gray)
                    }
                )
                .padding(.leading)
                
                IconView(
                    imageName: URL(
                        string: "https://pbs.twimg.com/media/Fx_ZC9saQAAI4Z5?format=jpg&name=large"),
                    iconPattern: .small
                )
                Spacer()
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
                .padding(.trailing)
            }
            Divider()
                .frame(width: 360, height: 1)
                .background(Color.black)
                .padding(EdgeInsets(
                    top: 10,        // 上の余白
                    leading: 15,    // 左の余白
                    bottom: 10,     // 下の余白
                    trailing: 0    // 右の余白
                ))
            
            ScrollView {
                HStack {
                    Text("公開設定")
                        .padding(.leading, 28)
                        .foregroundColor(Color.text)
                    Spacer()
                }
                HStack {
                    Toggle("公開", isOn: $publishing)
                        .toggleStyle(SwitchToggleStyle(tint: .textPinkColor))
                        .frame(width: 100, alignment: .leading)
                        .padding(.leading, 35)
                    Spacer()
                }
                // 上記は、.leadingの指定を受け付けてくれないのでこのような実装に
                TextBox(text: "タイトル", width: 300)
                    .padding(20)
                TextBox(text: "説明文", width: 300, height: 200)
                    .padding(20)
                TextBox(text: "Githubリンク", width: 300)
                    .padding(20)
                TextBox(text: "Youtubeリンク", width: 300)
                    .padding(20)
                // tagのviewはここに
                let item = ["おはよう","こんにちは","さようなら"]
               
                HStack {
                    Text("タグの追加")
                        .padding(.leading, 28)
                        .foregroundColor(Color.text)
                    Spacer()
                }
                TagView(item: item, viewPattern: .detail)
                // 写真追加も
                
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
