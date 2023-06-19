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
    let urlString: String
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            let imgPath = URL(string: urlString)
            AsyncImage(url: imgPath) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 100, alignment: .top)
                        .clipped()
                        .cornerRadius(20)
                } else if let error = phase.error {
                    let _ = print(error.localizedDescription)
                }
            }
            .padding(.bottom, 50)
            VStack(alignment: .leading, spacing: 4) {
                TextView(text: title, textPattern: 3).foregroundColor(.text).padding(.leading, 10)
                TextView(text: content, textPattern: 0).foregroundColor(.text).padding(.leading, 10)
            }
            .frame(width: 150, height: 50, alignment: .leading)
            .background(Color.backGroundCellColor)
            .mask(PartlyRoundedCornerView(cornerRadius: 20,
                                              maskedCorners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]))
        }
        // 枠線
        .frame(width: 150, height: 152)
        .onTapGesture {
            print("tap: \(title)")
        }
    }
}

// 文字背景の図形を角丸にするやつ
struct PartlyRoundedCornerView: UIViewRepresentable {
    let cornerRadius: CGFloat
    let maskedCorners: CACornerMask

    func makeUIView(context: UIViewRepresentableContext<PartlyRoundedCornerView>) -> UIView {
        // 引数で受け取った値を利用して、一部の角のみを丸くしたViewを作成する
        let uiView = UIView()
        uiView.layer.cornerRadius = cornerRadius
        uiView.layer.maskedCorners = maskedCorners
        uiView.backgroundColor = .white
        return uiView
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PartlyRoundedCornerView>) {
    }
}

struct CollectionView: View {
    // .fixed(item同士の間隔), count 横にいくつ表示するか
    var colums: [GridItem] = Array(repeating: .init(.fixed(165)), count: 2)
    
    let item: [CustomCell]

    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: colums, alignment: .center, spacing: 20) {
                ForEach((0..<item.count), id: \.self) { num in
                    HStack {
                        item[num]
                    }
                }
            }
        }
    }
}

#if DEBUG
struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        let data: [CustomCell] = [
            CustomCell(
                title: "bag",
                content: "バッグ",
                urlString: "https://www.totebag.jp/img/01product/01ready-made/H50110.jpg"
            ),
            CustomCell(
                title: "bag",
                content: "バッグ",
                urlString: "https://www.totebag.jp/img/01product/01ready-made/H50110.jpg"
            ),
            CustomCell(
                title: "bag",
                content: "バッグ",
                urlString: "https://www.totebag.jp/img/01product/01ready-made/H50110.jpg"
            ),
            CustomCell(
                title: "bag",
                content: "バッグ",
                urlString: "https://www.totebag.jp/img/01product/01ready-made/H50110.jpg"
            )
        ]
        
        CollectionView(item: data)
    }
}
#endif
