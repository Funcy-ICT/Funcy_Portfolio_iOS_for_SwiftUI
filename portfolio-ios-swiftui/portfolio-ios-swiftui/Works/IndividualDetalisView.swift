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
        
        VStack {
            NavigationView {
                ScrollView {
                    HStack {
                        IconView(imageName: workinfo.work.user_icon, iconPattern: .small)
                        TextView(text: "\(workinfo.work.user_name)", textPattern: 1)
                    }
                    .frame(height: 54.0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 20)
                    
                    ImageSelectView(images: workinfo.work.images.compactMap{ $0.image })
                        .padding(.top, -20)
                    
                    VStack(alignment: .leading) {
                        TextView(text: workinfo.work.title, textPattern: 1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, -20)
                            .padding(.bottom, 20)
                        
                        TextView(text: "\(workinfo.work.description)", textPattern: 0)
                            .padding(.bottom, 20)
                        
                        // work_urlに変える
                        Link(destination: workinfo.work.work_url) {
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
                    
                    YouTubePlayerView(YouTubePlayer(stringLiteral: "\(workinfo.work.movie_url)")) { state in
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
            .padding(.top, 10)
            .navigationBarTitle("Your Title", displayMode: .inline)
            .navigationBarItems(
                leading: Button(action: {
                    print("左のボタンが押されたよ")
                }) {
                    SwiftUI.Image(systemName: "chevron.backward")
                        .resizable()
                        .frame(height: 20.0)
                        .padding(.leading, 20)
                },
                trailing: Button(action: {
                    print("右のボタンが押されたよ")
                }) {
                    SwiftUI.Image(systemName: "square.and.pencil")
                        .resizable()
                        .frame(width: 20.0, height: 20.0)
                        .padding(.trailing, 15)
                }
            )
        }
    }
}

//struct IndividualDetalisView_Previews: PreviewProvider {
//    static var previews: some View {
//        IndividualDetalisView()
//    }
//}
