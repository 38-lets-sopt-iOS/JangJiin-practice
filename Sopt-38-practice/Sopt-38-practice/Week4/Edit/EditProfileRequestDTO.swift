//
//  EditProfileRequestDTO.swift
//  Sopt-38-practice
//
//  Created by 장지인 on 5/8/26.
//

import Foundation

struct EditProfileRequestDTO: Encodable{
    let name: String
    let email: String
    let age : Int
}
