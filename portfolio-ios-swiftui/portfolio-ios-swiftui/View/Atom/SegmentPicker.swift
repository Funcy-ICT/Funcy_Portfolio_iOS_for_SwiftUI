//
//  SegmentPicker.swift
//  portfolio-ios-swiftui
//
//  Created by fun_massu on 2022/10/31.
//

import SwiftUI

struct SegmentPicker: View {
    @State private var selectedIndex = 0
        //var labelName: [String] = []
    
    enum StatusPattern{
        case privatePage
        case groupPage
        case groupMyPage
    }
    let statusPattern: StatusPattern

    var body: some View {
               
        VStack {
            switch statusPattern{
            case .privatePage:
                Picker("", selection: self.$selectedIndex) {
                    Text("作品一覧").tag(0)
                    Text("グループ紹介").tag(1)
                    Text("メンバー 一覧").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(10)

                switch selectedIndex {
                case 0:
                    Text("hoge")    //後ほどアクションを定義
                case 1:
                    Text("fuga")
                default:
                    Text("piyo")
                }
            case .groupPage:
                Picker("", selection: self.$selectedIndex) {
                    Text("作品一覧").tag(0)
                    Text("プロフィール").tag(1)
                    Text("スキル").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(10)

                switch selectedIndex {
                case 0:
                    Text("hogehoge")
                case 1:
                    Text("fugafuga")
                default:
                    Text("piyopiyo")
                }
            case .groupMyPage:
                Picker("", selection: self.$selectedIndex) {
                    Text("作品一覧").tag(0)
                    Text("グループ紹介").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(10)

                switch selectedIndex {
                case 0:
                    Text("hoge")
                case 1:
                    Text("fuga")
                default:
                    Text("piyo")
                }
            }
            
        }

    }
}

struct SegmentPicker_Previews: PreviewProvider {
    static var previews: some View {
        //let label = ["作品一覧", "プロフィール", "スキル"]
        VStack(spacing: 30){
            SegmentPicker(statusPattern: .privatePage)
            SegmentPicker(statusPattern: .groupPage)
            SegmentPicker(statusPattern: .groupMyPage)
        }
        
    }
}
