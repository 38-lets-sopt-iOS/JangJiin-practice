//
//  UITextField+.swift
//  Sopt-38-practice
//
//  Created by 장지인 on 5/2/26.
//

import UIKit

extension UITextField {

        // 텍스트필드 왼쪽에 여백 추가
    func addLeftPadding(_ width: CGFloat = 20) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
    
      // 텍스트필드 오른쪽에 여백 추가
    func addRightPadding(_ width: CGFloat = 20) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.rightView = paddingView
        self.rightViewMode = ViewMode.always
    }
}
