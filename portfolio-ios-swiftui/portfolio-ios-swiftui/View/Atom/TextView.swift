//
//  TextView.swift
//  portfolio-ios-swiftui
//
//  Created by 鳥山英峻 on 2022/06/27.
//

import SwiftUI

struct TextView: View {

    let text: String
    let pattern: Int

    var body: some View {
        switch pattern {
        case 0:
            Text(text)
                .font(.headline)
                .fontWeight(.light)

        case 1:
            Text(text)
                .font(.headline)
                .fontWeight(.bold)

        case 2:
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

#if DEBUG
struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            TextView(text: "こんにちわ", pattern: 0)
            TextView(text: "こんにちわ", pattern: 1)
            TextView(text: "こんにちわ", pattern: 2)
        }
    }
}
#endif
