//
//  GetUserInfoResponseDTO.swift
//  Sopt-38-practice
//
//  Created by 장지인 on 5/8/26.
//

import Foundation

struct GetUserInfoResponseDTO: Decodable{
    let success: Bool
    let status: Int
    let message: String
    let code: String
    let data: UserInfo
}

struct UserInfo: Decodable{
    let id: Int
    let loginId: String
    let name: String
    let email: String
    let age: Int
    let part: String
}
