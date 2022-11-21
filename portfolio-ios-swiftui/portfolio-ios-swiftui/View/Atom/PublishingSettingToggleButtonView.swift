//
//  PublishingSettingToggleButtonView.swift
//  portfolio-ios-swiftui
//
//  Created by Takeru Sakakibara on 2022/11/14.
//

import SwiftUI

struct PublishingSettingToggleButtonView: View {
    
    @State var publishing: Bool = false // 公開設定
    
    var body: some View {
        Toggle("公開", isOn: $publishing).frame(width: 120)
            .tint(Color.textPinkColor)
    }
    
}

struct PublishingSettingToggleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PublishingSettingToggleButtonView(publishing: true)
    }
}
