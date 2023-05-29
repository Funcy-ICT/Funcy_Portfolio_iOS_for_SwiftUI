//
//  GroupPageView.swift
//  portfolio-ios-swiftui
//
//  Created by massu on 2023/05/29.
//

import SwiftUI

struct GroupPageView: View {
    @State private var selectedIndex = 0
    var body: some View {
        VStack(){
            Picker("", selection: self.$selectedIndex) {
                Text("作品一覧").tag(0)
                Text("グループ紹介").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(10)
            
            switch selectedIndex {
            case 0:
                Text("hoge")    // 後ほどアクションを定義
                //ここで作品一覧の子ビューを呼び出し
            default:
                Text("piyo")
                //ここでスキルの子ビューを呼び出し
            }
        }
    }
}

struct GroupPageView_Previews: PreviewProvider {
    static var previews: some View {
        GroupPageView()
    }
}
