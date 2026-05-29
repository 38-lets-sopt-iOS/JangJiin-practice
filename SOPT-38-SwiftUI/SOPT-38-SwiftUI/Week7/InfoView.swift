//
//  InfoView.swift
//  SOPT-38-SwiftUI
//
//  Created by 장지인 on 5/29/26.
//

import SwiftUI

struct InfoView: View {
    let info: String
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            Text(info)
            
            Button("루트로 돌아가기") {
                path.removeLast(path.count)
            }
        }
        .navigationTitle("\(path.count)번째 view")
    }
}
