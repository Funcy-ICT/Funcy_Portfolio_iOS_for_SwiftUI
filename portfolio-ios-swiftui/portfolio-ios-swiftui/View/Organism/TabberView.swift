//
//  TabberView.swift
//  portfolio-ios-swiftui
//
//  Created by Takeru Sakakibara on 2022/10/31.
//

import SwiftUI

struct TabberView: View {
    
    init() {
        // TabViewの背景色の設定
        UITabBar.appearance().backgroundColor = UIColor(Color.tabberColor)
        
    }
    
    var body: some View {
        TabView {
            TestView1() // メイン画面のView
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("検索")
                    
                }
            TestView2() // マイページ（個人）のView
                .tabItem {
                    Image(systemName: "person")
                    Text("ユーザー")
                    
                }
            TestView1() // マイページ（グループ）のView
                .tabItem {
                    Image(systemName: "person.3")
                    Text("グループ")
                    
                }
            TestView2() // 設定画面のView
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("設定")
                    
                }
            
        }.accentColor(.subPink)
        
    }
    
}

struct TabberView_Previews: PreviewProvider {
    static var previews: some View {
        TabberView()
            .previewInterfaceOrientation(.portrait)
        
    }
}
