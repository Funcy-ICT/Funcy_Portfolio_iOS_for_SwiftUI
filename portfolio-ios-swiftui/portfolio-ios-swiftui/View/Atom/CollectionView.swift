//
//  CollectionView.swift
//  portfolio-ios-swiftui
//
//  Created by fun_massu on 2022/11/29.
//

import SwiftUI

struct CustomCell: View, Identifiable {
    var id = UUID()
    var title: String
    var content: String
    var imgPath: String

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(imgPath)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150, alignment: .top)
                .clipped()
                .cornerRadius(20)

            VStack(alignment: .leading, spacing: 4) {
                TextView(text: title, textPattern: 3).foregroundColor(.text).padding(.leading, 10)
                TextView(text: content, textPattern: 0).foregroundColor(.text).padding(.leading, 10)
            }
            .frame(width: 150, height: 50, alignment: .leading)
            .background(Color.white)
            
        }
        //枠線
        .frame(width: 150, height: 152)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}

struct CollectionView: View {
    // .fixed(item同士の間隔), count 横にいくつ表示するか
    var colums: [GridItem] = Array(repeating: .init(.fixed(165)), count: 2)

    // 後々サーバから画像を取得
    let data: [CustomCell] = [
        CustomCell(title: "garden_strand", content: "ネックレス", imgPath: "garden_strand"),
        CustomCell(title: "gatsby_hat", content: "ハット", imgPath: "gatsby_hat"),
        CustomCell(title: "stella_sunglasses", content: "グラス", imgPath: "stella_sunglasses"),
        CustomCell(title: "strut_earrings", content: "イヤリング", imgPath: "strut_earrings"),
        CustomCell(title: "vagabond_sack", content: "リュックサック", imgPath: "vagabond_sack"),
        CustomCell(title: "varsity_socks", content: "ソックス", imgPath: "varsity_socks"),
        CustomCell(title: "whitey_belt", content: "ベルト", imgPath: "whitey_belt"),
        CustomCell(title: "copper_wire_rack", content: "ラック", imgPath: "copper_wire_rack"),
        CustomCell(title: "gilt_desk_trio", content: "小物入れ", imgPath: "gilt_desk_trio"),
        CustomCell(title: "shrug_bag", content: "バッグ", imgPath: "shrug_bag")

    ]

    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: colums, alignment: .center, spacing: 20) {
                ForEach((0..<data.count), id: \.self) { num in
                    HStack {
                        data[num]
                    }
                }
            }
        }
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}
