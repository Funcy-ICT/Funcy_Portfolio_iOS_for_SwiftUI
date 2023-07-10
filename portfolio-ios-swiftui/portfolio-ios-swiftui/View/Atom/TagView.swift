//
//  tagView.swift
//  portfolio-ios-swiftui
//
//  Created by massu on 2023/06/12.
//

import SwiftUI

enum ViewPattern {
    case main
    case detail
}

struct TagView: View {
    //let tag: String
    var item = [String]()
    let viewPattern: ViewPattern
    
    var body: some View {
        switch viewPattern {
        case .main:
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<item.count, id: \.self) { index in
                        TextView(text: item[index], textPattern: 0)
                            .frame(width: 100, height: 25)
                            .foregroundColor(Color.black)   // 後から文字色変更
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.tagColor, lineWidth: 1)
                            )
                    }
                }
            }
            
        case .detail:
            HStack {
                ForEach(0..<item.count, id: \.self) { index in
                    TextView(text: item[index], textPattern: 0)
                        .frame(width: 100, height: 25)
                        .foregroundColor(Color.black)   // 後から文字色変更
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.tagColor, lineWidth: 1)
                        )
                }
            }
        }
        
    }
}

#if DEBUG
struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        let item = ["hoge", "fuga", "piyo", "hogehoge"]
            
        TagView(item: item, viewPattern: .main)
        
    }
}
#endif
