//
//  LoginResponseDTO.swift
//  Sopt-38-practice
//
//  Created by 장지인 on 5/8/26.
//

import Foundation

struct LoginResponseDTO: Decodable{
    let success: Bool
    let status: Int
    let message: String
    let code: String
    let data: UserID
    let meta: ErrorResponseDTO?
}

struct UserID: Decodable{
    let userId: Int
}
