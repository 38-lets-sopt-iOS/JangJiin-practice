//
//  EditProfileResponseDTO.swift
//  Sopt-38-practice
//
//  Created by 장지인 on 5/8/26.
//
import Foundation

struct EditProfileResponseDTO: Decodable{
    let success: Bool
    let status: Int
    let message: String
    let code: String
    let data: UserInfo
}
