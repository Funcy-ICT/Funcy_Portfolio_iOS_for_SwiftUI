//
//  WorksList.swift
//  portfolio-ios-swiftui
//
//  Created by massu on 2023/06/26.
//

import SwiftUI

struct WorksList: View {
    let tags = ["Hoge", "fuga", "piyo"]
    @State private var searchText = ""
    
    var body: some View {
        let data: [CustomCell] = [
            CustomCell(
                title: "bag",
                content: "バッグ",
                urlString: "https://www.totebag.jp/img/01product/01ready-made/H50110.jpg"
            ),
            CustomCell(
                title: "bag",
                content: "バッグ",
                urlString: "https://img20.shop-pro.jp/PA01323/160/etc/osanpoM202209-1.jpg?cmsp_timestamp=20220918135740"
            ),
            CustomCell(
                title: "bag",
                content: "バッグ",
                urlString: "https://www.wirebag.jp/assets/upload/imgupload/2023/02/13/subbag_600_760.jpg"
            ),
            CustomCell(
                title: "bag",
                content: "バッグ",
                urlString: "https://media.townwork.net/uploads/2023/02/5d1b5bb302899a2916e99544aaf169e6.jpg"
            )
        ]
        
        /*
        var filterWord: [String] {
            return tags.filter {$0.uppercased().contains(searchText.uppercased())}
        }
         */
        
        ZStack(alignment: .bottomTrailing) {
            VStack {
                TextField("search", text: $searchText)
                    .padding(8)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                
                ForEach(searchResults, id: \.self) { tag in
                    VStack(alignment: .leading) {
                        Text(tag).padding(.leading, 12)
                        Divider()
                    }
                }
                CollectionView(item: data)
            }
            FloatingActionButtonView()
        }
        
    }
    
    var searchResults: [String] {
        /*
        if searchText.isEmpty {
            return tags
        } else {
            return tags.filter { $0.contains(searchText) }
        }
         */
        return tags.filter { $0.contains(searchText) }
    }
}

#if DEBUG
struct WorksList_Previews: PreviewProvider {
    static var previews: some View {
        WorksList()
    }
}
#endif
