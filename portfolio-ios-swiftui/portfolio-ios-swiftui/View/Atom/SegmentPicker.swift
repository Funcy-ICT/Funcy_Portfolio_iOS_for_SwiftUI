//
//  SegmentPicker.swift
//  portfolio-ios-swiftui
//
//  Created by fun_massu on 2022/10/31.
//

import SwiftUI

struct SegmentPicker: View {
    @State private var selectedIndex = 0

    var body: some View {
        VStack {
            Picker("", selection: self.$selectedIndex) {
                Text("作品一覧").tag(0)
                Text("プロフィール").tag(1)
                Text("スキル").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(10)
            switch selectedIndex {
            case 0:
                Text("hoge")
            case 1:
                Text("fuga")
            default:
                Image("momogamisama")
            }
        }

    }
}

struct SegmentPicker_Previews: PreviewProvider {
    static var previews: some View {
        SegmentPicker()
    }
}
