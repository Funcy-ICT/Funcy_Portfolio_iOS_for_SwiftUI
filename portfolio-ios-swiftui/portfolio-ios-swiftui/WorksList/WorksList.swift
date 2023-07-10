//
//  WorksList.swift
//  portfolio-ios-swiftui
//
//  Created by massu on 2023/06/26.
//

import SwiftUI

struct WorksList: View {
    let names = ["Holly", "Josh", "Rhonda", "Ted"]
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
        
        VStack {
            NavigationView {
                List {
                    ForEach(searchResults, id: \.self) { name in
                        NavigationLink(destination: Text(name)) {
                            Text(name)
                        }
                    }
                    .searchable(text: $searchText)
                }
            }
            CollectionView(item: data)
            TabBarView()
                .previewInterfaceOrientation(.portrait)
        }
    }
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return names
        } else {
            return names.filter { $0.contains(searchText) }
        }
    }
}

struct WorksList_Previews: PreviewProvider {
    static var previews: some View {
        WorksList()
    }
}
