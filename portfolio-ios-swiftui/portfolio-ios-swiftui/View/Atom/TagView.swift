//
//  tagView.swift
//  portfolio-ios-swiftui
//
//  Created by massu on 2023/06/12.
//

import SwiftUI

enum ViewPattern {
    case main
    case detail
}

struct TagView: View {
    var item = [String]()
    let viewPattern: ViewPattern
    let columns = [GridItem(.fixed(100)), GridItem(.fixed(100)), GridItem(.fixed(100))]
    
    var body: some View {
        switch viewPattern {
        case .main:
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<item.count, id: \.self) { index in
                        TextView(text: item[index], textPattern: 0)
                            .frame(width: 90, height: 25)
                            .foregroundColor(Color.black)   // 後から文字色変更
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.tagColor, lineWidth: 1)
                                    .frame(width: 100, height: 25)
                            )
                            .padding(.horizontal, 12)
                            .onTapGesture {
                                print("tap: \(item[index])")
                            }
                    }
                }
            }
            
        case .detail:
            LazyVGrid(columns: columns) {
                ForEach(0..<item.count, id: \.self) { index in
                    TextView(text: item[index], textPattern: 0)
                        .frame(width: 90, height: 25)
                        .foregroundColor(Color.black)   // 後から文字色変更
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.tagColor, lineWidth: 1)
                                .frame(width: 100, height: 25)
                        )
                        .padding(.horizontal, 12)
                        .onTapGesture {
                            print("tap: \(item[index])")
                        }
                }
            }
        }
        
    }
}

//#if DEBUG
//struct TagView_Previews: PreviewProvider {
//    static var previews: some View {
//        let item = ["hoあeあoehoge", "hogehogeho", "うみねこ", "コーラ", "ランドセル", "ルーレット族"]
//
//        TagView(item: item, viewPattern: .detail)
//
//    }
//}
//#endif
