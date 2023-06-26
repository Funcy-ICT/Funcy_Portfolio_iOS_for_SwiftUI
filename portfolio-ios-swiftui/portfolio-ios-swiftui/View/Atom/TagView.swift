//
//  tagView.swift
//  portfolio-ios-swiftui
//
//  Created by massu on 2023/06/12.
//

import SwiftUI

struct TagView: View {
    let tag: String
    
    var body: some View {
        TextView(text: tag, textPattern: 0)
            .frame(width: 100, height: 25)
            .foregroundColor(Color.black)   // 後から文字色変更
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                .stroke(Color.tagColor, lineWidth: 1)
            )
    }
}

#if DEBUG
struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        let item = ["hoge", "fuga", "piyo"]

        HStack {
            ForEach(0..<item.count, id: \.self) { index in
                TagView(tag: item[index])
                    .padding(.horizontal, 5)
                    .onTapGesture {
                        let _ = print("tap: \(item[index])") // 押された時のアクション
                    }
            }
        }
    }
}
#endif
