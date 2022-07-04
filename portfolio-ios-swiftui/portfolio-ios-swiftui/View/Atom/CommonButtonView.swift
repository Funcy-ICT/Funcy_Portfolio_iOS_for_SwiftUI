//
//  CommonButtonView.swift
//  portfolio-ios-swiftui
//
//  Created by 工藤 海斗 on 2022/07/04.
//

import SwiftUI

struct CommonButtonView: View {
    var action: () -> Void
    var labelText: String
    var width: CGFloat
    var foregroundColor: Color
    var backgroundColor: Color
    var overlay: AnyView
    var radius: CGFloat
    
    init<V>(action: @escaping () -> Void, labelText: String, width: CGFloat, foregroundColor: Color, backgroundColor: Color? = Color.clear, overlay: V? = nil, radius: CGFloat? = 0) where V: View {
        self.action = action
        self.labelText = labelText
        self.width = width
        self.backgroundColor = backgroundColor ?? Color.clear
        self.foregroundColor = foregroundColor
        self.overlay = AnyView(overlay)
        self.radius = radius ?? 0
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(labelText)
                .font(.system(size: 20))
                .frame(width: width, height: 50)
                .lineLimit(1)
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
                .cornerRadius(radius)
                .overlay(
                    overlay
                )
        }
    }
}

struct CommonButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CommonButtonView(
            action: { print("何か処理をするよー") },
            labelText: "hoge",
            width: 20,
            foregroundColor: Color.clear,
            overlay: EmptyView()
        )
    }
}
