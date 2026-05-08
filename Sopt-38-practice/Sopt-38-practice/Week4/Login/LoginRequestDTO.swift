//
//  LoginRequestDTO.swift
//  Sopt-38-practice
//
//  Created by 장지인 on 5/8/26.
//

import Foundation

struct LoginRequestDTO: Encodable{
    let loginId: String
    let password: String
}
