//
//  ChatUserListView.swift
//  SOPT-38-SwiftUI
//
//  Created by 장지인 on 5/16/26.
//

import SwiftUI

struct ChatUserListView: View {
    let chatUsers: [ChatListModel]
    
    var body: some View {
        List(chatUsers) { chatUser in
            ChatView(chatList: chatUser)
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.visible)
            
        }
        .listStyle(.plain)
    }
}
