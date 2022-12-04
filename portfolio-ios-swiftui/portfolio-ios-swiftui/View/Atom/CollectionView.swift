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
                .frame(width: 150, height: 150)
            // .padding(.top, -40)

            VStack(alignment: .leading) {
                Text(title).font(.system(size: 14)).padding(.leading, 10)
                Text(content).font(.system(size: 14)).padding(.leading, 10)
            }
            .frame(width: 150, height: 50, alignment: .leading)
            .background(Color.white)
        }
        .frame(width: 150, height: 152)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 2)
        )
        .cornerRadius(20)
    }
}

struct CollectionView: View {
    // .fixed(item同士の間隔), count 横にいくつ表示するか
    var colums: [GridItem] = Array(repeating: .init(.fixed(165)), count: 2)

    // 後々サーバから画像を取得
    let data: [CustomCell] = [
        CustomCell(title: "ももがみさま", content: "hogehoge", imgPath: "garden_strand"),
        CustomCell(title: "hoge", content: "hogehoge", imgPath: "gatsby_hat"),
        CustomCell(title: "fuga", content: "fugafuga", imgPath: "stella_sunglasses"),
        CustomCell(title: "fuga", content: "fugafuga", imgPath: "strut_earrings"),
        CustomCell(title: "fuga", content: "fugafuga", imgPath: "vagabond_sack"),
        CustomCell(title: "fuga", content: "fugafuga", imgPath: "varsity_socks"),
        CustomCell(title: "fuga", content: "fugafuga", imgPath: "whitey_belt"),
        CustomCell(title: "fuga", content: "fugafuga", imgPath: "copper_wire_rack")

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
