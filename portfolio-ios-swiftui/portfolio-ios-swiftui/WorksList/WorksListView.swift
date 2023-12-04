//
//  WorksList.swift
//  portfolio-ios-swiftui
//
//  Created by massu on 2023/06/26.
//

import SwiftUI

struct WorksListView: View {
    let tags = ["Hoge", "fuga", "piyo"]
    
    @State private var searchText = ""
    @ObservedObject var worksinfo = WorksListViewModel()
    
    init() {
        worksinfo.fetchWorksListService()
    }
    
    var body: some View {
        if worksinfo.isLoading {
            ProgressView()
        } else if let error = worksinfo.error {
            Text("Error: \(error.localizedDescription)")
        } else {
            let customCellData = getCustomCellList(worksinfo: worksinfo)    //api呼び出し後、CustomCell型の配列に追加
            ZStack(alignment: .bottomTrailing) {
                VStack {
                    TextField("search", text: $searchText)
                        .padding(8)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                    
                    ForEach(searchResults, id: \.self) { tag in
                        VStack(alignment: .leading) {
                            /*
                            Text(tag).padding(.leading, 12)
                            Divider()
                             */
                            TagView(item: [tag], viewPattern: .detail)
                        }
                    }
                    CollectionView(item: customCellData)
                }
                FloatingActionButtonView()
                    .padding(.trailing, 15)
                    .padding(.bottom, 20)
            }
        }
         
        /*
        var filterWord: [String] {
            return tags.filter {$0.uppercased().contains(searchText.uppercased())}
        }
         */
    }
    
    var searchResults: [String] {
        return tags.filter { $0.contains(searchText) }
    }
}

func getCustomCellList(worksinfo: WorksListViewModel) -> [CustomCell] {
    var data: [CustomCell] = []

    for number in 0 ..< worksinfo.workList.works.count {
        data.append(
                CustomCell(
                    title: worksinfo.workList.works[number].title,
                    content: worksinfo.workList.works[number].title,   // 名前がapiにないので暫定
                    urlString: worksinfo.workList.works[number].thumbnail,
                    articleid: worksinfo.workList.works[number].workID
                )
            )
        print("customCell data")
        print(worksinfo.workList.works[number].title)
    }
    print(data)
    
    return data
}

#if DEBUG
struct WorksListView_Previews: PreviewProvider {
    static var previews: some View {
        WorksListView()
    }
}
#endif
