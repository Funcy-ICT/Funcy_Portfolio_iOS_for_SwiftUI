//
//  PostView.swift
//  portfolio-ios-swiftui
//
//  Created by Takeru Sakakibara on 2023/06/26.
//

import SwiftUI

struct PostView: View {
    @State private var publishing = false
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var githubLink: String = ""
    @State private var youtubeLink: String = ""

    @FocusState var focus: Bool

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
                    top: 10,
                    leading: 15,
                    bottom: 10,
                    trailing: 0
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
                    // 上記は、.leadingの指定を受け付けてくれないのでこのような実装に
                }
                TextBox(inputText: $title, titleText: "タイトル", width: 300, isRequired: true)
                    .padding(20)
                TextBox(inputText: $description, titleText: "説明文", lines: 6...6)
                    .padding(20)
                TextBox(inputText: $githubLink, titleText: "Githubリンク", width: 300)
                    .padding(20)
                TextBox(inputText: $youtubeLink, titleText: "Youtubeリンク", width: 300)
                    .padding(20)
                // tagのviewはここに
                let item = ["おはよう", "こんにちは", "さようなら"]
               
                HStack {
                    Text("タグの追加")
                        .padding(.leading, 28)
                        .foregroundColor(Color.text)
                    Spacer()
                }
                TagView(item: item, viewPattern: .detail)
                // 写真追加も
                
            }
            .focused(self.$focus)
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    HStack {
                        Spacer()
                        Button("完了") {
                            self.focus = false
                        }
                    }
                }
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
