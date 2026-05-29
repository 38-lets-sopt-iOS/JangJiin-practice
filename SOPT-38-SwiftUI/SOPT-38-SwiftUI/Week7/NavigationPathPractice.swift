//
//  NavigationPathPractice.swift
//  SOPT-38-SwiftUI
//
//  Created by 장지인 on 5/29/26.
//

import SwiftUI

struct NavigationPathPractice: View {
    let ganadi = Ganadi.friends
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List(ganadi, id: \.self) { friend in
                Button(friend.name) {
                    path.append(friend)
                }
            }
            .navigationTitle("\(path.count)번째 view")
            .navigationDestination(for: Ganadi.self) { ganadi in
                EmojiView(ganadi: ganadi, path: $path)
            }
            .navigationDestination(for: String.self) { info in
                InfoView(info: info, path: $path) 
            }
        }
    }
}
