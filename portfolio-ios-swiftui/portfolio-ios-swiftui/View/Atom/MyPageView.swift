//
//  MyPageView.swift
//  portfolio-ios-swiftui
//
//  Created by massu on 2023/05/29.
//

import SwiftUI

struct MyPageView: View {
    @State public var selectedIndex = 0
    
    var body: some View {
        VStack(){
            Picker("", selection: self.$selectedIndex) {
                Text("作品一覧").tag(0)
                Text("プロフィール").tag(1)
                Text("スキル").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(10)
            .onChange(of: selectedIndex) { newValue in
                print("\(newValue)")
            }
            
            switch selectedIndex {
            case 0:
                Text("hoge")    // 後ほどアクションを定義
                //ここで作品一覧の子ビューを呼び出し
            case 1:
                Text("fuga")
                //ここでプロフィールの子ビューを呼び出し
            default:
                Text("piyo")
                //ここでスキルの子ビューを呼び出し
            }
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
