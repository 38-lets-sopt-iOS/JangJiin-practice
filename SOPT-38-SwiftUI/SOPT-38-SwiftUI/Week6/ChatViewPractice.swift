//
//  ChatViewPractice.swift
//  SOPT-38-SwiftUI
//
//  Created by 장지인 on 5/16/26.
//

import SwiftUI

struct ChatViewPractice: View {
    let chatUser: ChatUser
    let isActive: Bool
    
    var body: some View {
        HStack(spacing: 12) {
            ProfileIcon(isActive: isActive)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(chatUser.name)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(.black)
                
                Text(chatUser.message)
                    .font(.system(size: 13))
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Text("오전 9:41")
                .font(.caption)
                .foregroundStyle(.gray)
        }
        .padding(.vertical, 14)
        .padding(.horizontal, 20)
        .background(.white)
    }
}
