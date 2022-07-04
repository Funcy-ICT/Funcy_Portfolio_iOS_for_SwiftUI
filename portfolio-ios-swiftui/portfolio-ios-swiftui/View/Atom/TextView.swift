//
//  TextView.swift
//  portfolio-ios-swiftui
//
//  Created by 鳥山英峻 on 2022/06/27.
//

import SwiftUI

struct TextView: View {

    enum TextPattern {
        case normal
        case bold
        case title
    }

    let text: String
    let textPattern: TextPattern

    var body: some View {
        switch textPattern {
        //ベーシックフォント
        case TextPattern.normal:
            Text(text)
                .font(.headline)
                .fontWeight(.light)
            
        //ボールドフォント
        case TextPattern.bold:
            Text(text)
                .font(.headline)
                .fontWeight(.bold)

        //タイトルフォント
        case TextPattern.title:
            Text(text)
                .font(.title)
                .fontWeight(.bold)
        }
    }
}

//#if DEBUG
//struct TextView_Previews: PreviewProvider {
//    static var previews: some View {
//
//        VStack(spacing: 20) {
//            TextView(text: "こんにちわ", textPattern: 0)
//            TextView(text: "こんにちわ", textPattern: 1)
//            TextView(text: "こんにちわ", textPattern: 2)
//        }
//    }
//}
//#endif
