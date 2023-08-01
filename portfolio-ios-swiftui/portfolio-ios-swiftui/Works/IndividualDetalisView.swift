//
//  IndividualDetalisView.swift
//  portfolio-ios-swiftui
//
//  Created by 鳥山英峻 on 2023/02/14.
//

import SwiftUI
import YouTubePlayerKit

struct IndividualDetalisView: View {
    @ObservedObject var workinfo = WorkViewModel()
    
    init() {
        workinfo.fetchWorkDatailService()
    }
    
    let bounds = UIScreen.main.bounds
    var body: some View {
        
        let mobileWidth = bounds.width * 1
        let mobileHeight = bounds.height * 0.3
        
        NavigationView {
            VStack {
                ScrollView {
                    HStack {
                        IconView(imageName: workinfo.work.icon, iconPattern: .small)
                            .shadow(radius: 10)
                        TextView(text: "\(workinfo.work.userName)", textPattern: 1)
                    }
                    .frame(height: 54.0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 20)
                    
                    ImageSelectView(images: workinfo.work.images.compactMap { $0.image })
                        .padding(.top, -20)
                        .shadow(radius: 10)
                    
                    VStack(alignment: .leading) {
                        TextView(text: workinfo.work.title, textPattern: 1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, -20)
                            .padding(.bottom, 20)
                        
                        TextView(text: "\(workinfo.work.description)", textPattern: 0)
                            .padding(.bottom, 20)
                        
                        TagView(item: workinfo.work.tags.compactMap { $0.tag }, viewPattern: .detail)
                            .padding(.bottom, 25)
                        
                        Link(destination: workinfo.work.work) {
                            SwiftUI.Image("github")
                                .resizable()
                                .frame(width: 45, height: 45)
                                .foregroundColor(.white)
                        }
                        Divider().background(.black)
                            .padding(.top, -27)
                            .padding(.leading, 60)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(20)
                    
                    YouTubePlayerView(YouTubePlayer(stringLiteral: "\(workinfo.work.movie)")) { state in
                        switch state {
                        case .idle:
                            ProgressView()
                        case .ready:
                            EmptyView()
                        case .error(_):
                            Text(verbatim: "動画が読み込めませんでした。詳しくは運営までお問い合わせください。")
                        }
                    }
                    .padding(.horizontal)
                    .frame(width: mobileWidth, height: mobileHeight)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .navigationBarItems(
                leading: Button(action: {
                    // 戻るアクションを追加してください
                }) {
                    SwiftUI.Image(systemName: "chevron.backward")
                        .resizable()
                        .frame(height: 20.0)
                        .foregroundColor(Color.gray)
                },
                trailing:
                    HStack {
                        Button(action: {
                            // アクションを追加してください
                        }) {
                            SwiftUI.Image(systemName: "square.and.pencil")
                                .resizable()
                                .frame(width: 20.0, height: 20.0)
                                .foregroundColor(Color.gray)
                        }
                        Button(action: {
                            // アクションを追加してください
                        }) {
                            SwiftUI.Image(systemName: "square.and.arrow.up")
                                .resizable()
                                .frame(width: 18.0, height: 23.0)
                                .foregroundColor(Color.gray)
                        }
                    }
            )
        }
    }
}
