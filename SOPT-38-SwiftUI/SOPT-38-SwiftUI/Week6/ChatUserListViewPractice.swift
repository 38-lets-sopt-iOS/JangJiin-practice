//
//  ChatUserListView.swift
//  SOPT-38-SwiftUI
//
//  Created by 장지인 on 5/16/26.
//

import SwiftUI

struct ChatUserListViewPractice: View {
    let chatUsers: [ChatUser]
    
    @State private var activeStates: [Bool] = [true, false, false, true, true]
    
    var body: some View {
        VStack(spacing: 0) {
            StoryScrollView(
                chatUsers: chatUsers,
                activeStates: $activeStates
            )
            
            ChatList(
                chatUsers: chatUsers,
                activeStates: activeStates
            )
        }
    }
}

struct StoryScrollView: View {
    let chatUsers: [ChatUser]
    @Binding var activeStates: [Bool]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(chatUsers.indices, id: \.self) { index in
                    StoryView(
                        chatUser: chatUsers[index],
                        isActive: $activeStates[index]
                    )
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
        }
    }
}

struct StoryView: View {
    let chatUser: ChatUser
    @Binding var isActive: Bool
    
    var body: some View {
        Button {
            isActive.toggle()
        } label: {
            ProfileIcon(isActive: isActive)
        }
        .buttonStyle(.plain)
    }
}

struct ChatList: View {
    let chatUsers: [ChatUser]
    let activeStates: [Bool]
    
    var body: some View {
        List(chatUsers) { chatUser in
            if let index = chatUsers.firstIndex(where: { $0.id == chatUser.id }) {
                ChatViewPractice(
                    chatUser: chatUser,
                    isActive: activeStates[index]
                )
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.visible)
                
            }
        }
        .listStyle(.plain)
    }
}

struct ProfileIcon: View {
    let isActive: Bool
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundStyle(isActive ? .blue : .gray)
            
            Circle()
                .fill(isActive ? .green : .gray)
                .frame(width: 11, height: 11)
                .offset(x: 2, y: 2)
        }
    }
}
