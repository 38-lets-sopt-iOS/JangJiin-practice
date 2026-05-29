//
//  EmojiView.swift
//  SOPT-38-SwiftUI
//
//  Created by 장지인 on 5/29/26.
//

import SwiftUI

struct EmojiView: View {
    let ganadi: Ganadi
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            Text(ganadi.name)
            Text(ganadi.emoji)
            
            Button("상세 정보 보기") {
                path.append(ganadi.detail)
            }
        }
        .navigationTitle("\(path.count)번째 view")
    }
}
