//
//  SOPT_38_SwiftUIApp.swift
//  SOPT-38-SwiftUI
//
//  Created by 장지인 on 5/16/26.
//

import SwiftUI

@main
struct SOPT_38_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ChatUserListViewPractice(chatUsers: ChatUser.users)
        }
    }
}
