//
//  ChatView.swift
//  SOPT-38-SwiftUI
//
//  Created by 장지인 on 5/16/26.
//

import SwiftUI

struct ChatView: View {
    let chatList: ChatListModel
    var body: some View {
        HStack {
            Image(chatList.profileImage)
                .resizable()
                .frame(width: 30, height: 30)
                .clipShape(Circle())
            
            VStack(alignment: .leading){
                HStack{
                    Text(chatList.name)
                        .bold()
                    Text(chatList.location)
                        .foregroundColor(.gray)
                }
                Text(chatList.lastMessage)
            }
            
            Spacer()
            
            Image(chatList.productImage)
                .resizable()
                .frame(width: 20, height: 20)
        }
        .padding(.vertical, 16)
        .padding(.horizontal)
        .background(.white)
    }
}
