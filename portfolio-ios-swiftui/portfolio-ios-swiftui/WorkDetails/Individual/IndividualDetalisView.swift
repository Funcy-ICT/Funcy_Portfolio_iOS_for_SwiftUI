//
//  IndividualDetalisView.swift
//  portfolio-ios-swiftui
//
//  Created by 鳥山英峻 on 2023/02/14.
//

import SwiftUI
import YouTubePlayerKit

struct IndividualDetalisView: View {
    
    let youTubePlayer: YouTubePlayer = "https://youtube.com/watch?v=psL_5RIBqnY"
    let bounds = UIScreen.main.bounds
    
    var body: some View {
        
        let mobileWidth = Double(bounds.width) * 1
        let mobileHeight = Double(bounds.height) * 0.3
        
        VStack {
            HStack {
                Image(systemName: "chevron.backward")
                    .resizable()
                    .scaledToFit()
                    .font(.system(size: 20, weight: .bold))
                    .frame(height: 20.0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .scaledToFit()
                    .font(.system(size: 20, weight: .bold))
                    .frame(width: 20.0, height: 20.0)
                    .padding(.trailing, 15)
                
                Image(systemName: "square.and.arrow.up")
                    .resizable()
                    .scaledToFit()
                    .font(.system(size: 20, weight: .bold))
                    .frame(width: 20.0, height: 23.0)
                    .padding(.bottom, 2)
                    .padding(.trailing, 25)
            }
            
            HStack {
                IconView(imageName: "Unknown", iconPattern: .small)
                TextView(text: "田中 太郎", textPattern: 1)
            }
            .frame(height: 54.0)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 20)
            
            ScrollView {
                ImageSelectView(images: ["Unknown", "Unknown1", "Unknown2"])
                
                Group {
                    TextView(text: "タイトル", textPattern: 1)
                    
                    HStack {
                        TextView(text: "説明文", textPattern: 0)
                    }
                    
                    HStack {
                        TextView(text: "Github", textPattern: 0)
                        Link(destination: URL(string: "https://github.com/zekuta-x")!) {
                            Image(systemName: "link")
                                .frame(width: 32, height: 32)
                                .background(Color.blue)
                                .mask(Circle())
                                .foregroundColor(.white)
                                .padding(.leading)
                        }
                    }

                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(20)
                
                YouTubePlayerView(self.youTubePlayer) { state in
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
    }
}

struct IndividualDetalisView_Previews: PreviewProvider {
    static var previews: some View {
        IndividualDetalisView()
    }
}
