
//
//  LoginViewController.swift
//  Sopt38-Seminar
//
//  Created by 장지인 on 4/4/26.
//

import UIKit
import SnapKit

class LoginViewController_SnapKit : UIViewController{
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        label.font=UIFont(name: "Pretendard-Bold", size: 18)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    let loginTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.leftView = UIView()
        textField.leftViewMode = .always
        return textField
    }()
    
    let passwordTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.leftView = UIView()
        textField.leftViewMode = .always
        return textField
    }()
    
    lazy var loginButton : UIButton = {
        let button = UIButton()
        button.setTitle("로그인하기", for: .normal)
        button.backgroundColor = .orange
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 16)
        button.titleLabel?.textColor = .white
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(loginButtonDidTap),for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setLayout()
    }
    
    
    func setUI() {
        view.addSubviews(titleLabel,loginTextField,passwordTextField,loginButton)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(169)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(57)
        }
        loginTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(63)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(loginTextField.snp.bottom).offset(7)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(128)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(57)
        }
        
        }
    
    @objc func loginButtonDidTap() {
        navaigationToWelcomeVC()
    }
    
    private func presentToWelcomeVC() {
        let welcomeVC = WelcomeViewController()
        welcomeVC.modalPresentationStyle = .formSheet
        self.present(welcomeVC, animated: true)
    }
    
    private func navaigationToWelcomeVC(){
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.configure(id: loginTextField.text)
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}
