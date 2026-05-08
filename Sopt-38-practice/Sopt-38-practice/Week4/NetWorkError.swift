//
//  NetWorkError.swift
//  Sopt-38-practice
//
//  Created by 장지인 on 5/2/26.
//

//
//  NetworkError.swift
//  Sopt38-Seminar
//
//  Created by 이나연 on 4/15/26.
//

enum NetworkError: Int, Error, CustomStringConvertible {
    var description: String { self.errorDescription }
    case requestEncodingError
    case responseDecodingError
    case responseError
    case urlError
    case unknownError
    case partError = 400
    case internalServerError = 500
    case notFoundError = 404
    case unauthorized = 401
    case duplicatedId = 409
    var errorDescription: String {
        switch self {
        case .partError: return "파트 에러"
        case .duplicatedId: return "이미 사용중인 아이디"
        case .requestEncodingError: return "REQUEST_ENCODING_ERROR"
        case .responseError: return "RESPONSE_ERROR"
        case .urlError: return "URL_ERROR"
        case .responseDecodingError: return "RESPONSE_DECODING_ERROR"
        case .unknownError: return "UNKNOWN_ERROR"
        case .internalServerError: return "500:INTERNAL_SERVER_ERROR"
        case .notFoundError: return "404:NOT_FOUND_ERROR"
        case .unauthorized: return "아이디/비밀번호 오류"
        }
    }
}
