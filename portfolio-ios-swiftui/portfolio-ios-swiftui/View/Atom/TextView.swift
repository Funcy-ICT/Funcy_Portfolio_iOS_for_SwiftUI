//
//  TextView.swift
//  portfolio-ios-swiftui
//
//  Created by 鳥山英峻 on 2022/06/27.
//
import SwiftUI

struct TextView: View {

    enum TextPattern: Int {
        case normal = 0
        case bold = 1
        case title = 2
    }

    let text: String
    let textPattern: TextPattern.RawValue

    var body: some View {
        switch textPattern {
        // ベーシックフォント
        case TextPattern.normal.rawValue:
            Text(text)
                .font(.headline)
                .fontWeight(.light)

        // ボールドフォント
        case TextPattern.bold.rawValue:
            Text(text)
                .font(.headline)
                .fontWeight(.bold)

        // タイトルフォント
        case TextPattern.title.rawValue:
            Text(text)
                .font(.title)
                .fontWeight(.bold)

        default:
            Text(text)
                .font(.headline)
                .fontWeight(.light)
        }
    }
}

// #if DEBUG
 struct TextView_Previews: PreviewProvider {
    static var previews: some View {

        VStack(spacing: 20) {
            TextView(text: "こんにちわ", textPattern: 0)
            TextView(text: "こんにちわ", textPattern: 1)
            TextView(text: "こんにちわ", textPattern: 2)
        }
    }
 }
// #endif
