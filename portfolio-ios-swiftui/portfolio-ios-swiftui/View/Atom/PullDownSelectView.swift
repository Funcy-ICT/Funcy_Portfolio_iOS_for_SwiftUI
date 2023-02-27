//
//  PullDownSelectView.swift
//  portfolio-ios-swiftui
//
//  Created by 鳥山英峻 on 2023/02/20.
//

import SwiftUI

struct PullDownSelectView: View {
    
    var labelName: String
    
    @State var selectList: [String]
    @Binding var selectionLabel: String
    
    var body: some View {
        VStack(alignment: .leading) {
            TextView(text: labelName, textPattern: 0)
            
            Picker("", selection: $selectionLabel) {
                ForEach($selectList, id: \.self) { item in
                    // @Stateで参照しているためwrappedValueを用いる
                    Text(item.wrappedValue)
                }
            }
            .accentColor(.black)
            .frame(width: 294, height: 48)
            .padding(.leading, 15)
            .overlay(RoundedRectangle(cornerRadius: 15)
                .stroke(Color.grayBottonColor, lineWidth: 2)
            )
            .padding(.leading, 25)
        }
    }
}

// struct PullDownSelectView_Previews: PreviewProvider {
//     static var previews: some View {
//         PullDownSelectView(labelName: "あああああ", selectList: ["aaa", "bbb", "ccc", "ddd"], startSelection: "")
//     }
// }
