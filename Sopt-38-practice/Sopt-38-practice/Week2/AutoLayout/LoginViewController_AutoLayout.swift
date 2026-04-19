
//
//  LoginViewController.swift
//  Sopt38-Seminar
//
//  Created by 장지인 on 4/4/26.
//

import UIKit

class LoginViewController_AutoLayout : UIViewController{
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        //label.font = .boldSystemFont(ofSize: 16)
        label.font=UIFont(name: "Pretendard-Bold", size: 16)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    let loginTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        //textField.font = .boldSystemFont(ofSize: 14)
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.leftView = UIView()
        textField.leftViewMode = .always
        return textField
    }()
    
    let passwordTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        //textField.font = .boldSystemFont(ofSize: 14)
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        

//        ////비밀번호 칠 때 안보이게/////////////////////
//        textField.isSecureTextEntry = true
//        ////비밀번호 한꺼번에 없애는 버튼 추가///////
//        textField.clearButtonMode = .whileEditing
//        /////////////////////////////////////////////////////
//                
        
        
        textField.leftView = UIView()
        textField.leftViewMode = .always
        return textField
    }()
    
    lazy var loginButton : UIButton = {
        let button = UIButton()
        button.setTitle("로그인하기", for: .normal)
        button.backgroundColor = .orange
        //button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 16)
        button.titleLabel?.textColor = .white
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(loginButtonDidTap),for: .touchUpInside)
        return button
    }()
    
    
//    ////////////////////////////////////자동 로그인 기능 표현///////////////////////////////////////////////
//        let autoLoginLabel: UILabel = {
//            let label = UILabel()
//            label.text = "자동 로그인"
//            label.font = UIFont(name: "Pretendard-Bold", size: 14)
//            label.textColor = .darkGray
//            return label
//        }()
//        let autoLoginSwitch: UISwitch = {
//            let uiSwitch = UISwitch()
//            uiSwitch.isOn = true
//            uiSwitch.onTintColor = .orange
//            uiSwitch.thumbTintColor = .white
//            return uiSwitch
//        }()
//        ////////////////////////////////////////////////////////////////////////////////////////////////////////////
//        
//    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setLayout()
    }
    
    
    func setUI() {
        view.addSubview(titleLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        
        
        
//        //////////////////////화면에 자동 로그인 추가/////////////////////////////////
//         view.addSubview(autoLoginLabel)
//         view.addSubview(autoLoginSwitch)
//        //////////////////////////////////////////////////////////////////////////////////
        titleLabel.translatesAutoresizingMaskIntoConstraints=false
        loginButton.translatesAutoresizingMaskIntoConstraints=false
        loginTextField.translatesAutoresizingMaskIntoConstraints=false
        passwordTextField.translatesAutoresizingMaskIntoConstraints=false
//        autoLoginLabel.translatesAutoresizingMaskIntoConstraints=false
//        autoLoginSwitch.translatesAutoresizingMaskIntoConstraints=false


        
        
    }
    
    private func setLayout() {
          NSLayoutConstraint.activate([titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                titleLabel.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 169)])
               
               NSLayoutConstraint.activate([loginTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 63),
                loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    loginTextField.heightAnchor.constraint(equalToConstant: 52)])
               
               NSLayoutConstraint.activate([passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 7),
                                            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                                            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                                            passwordTextField.heightAnchor.constraint(equalToConstant: 52)])
               
               NSLayoutConstraint.activate([loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 128),
                                            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                                            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                                            loginButton.heightAnchor.constraint(equalToConstant: 57)])
           }
    
    @objc func loginButtonDidTap() {
        //presentToWelcomeVC()
        navaigationToWelcomeVC()
    }
    
    private func presentToWelcomeVC() {
        let welcomeVC = WelcomeViewController()
        welcomeVC.modalPresentationStyle = .formSheet
        self.present(welcomeVC, animated: true)
    }
    
    private func navaigationToWelcomeVC(){
        let welcomeViewController = WelcomeViewController()
        //welcomeViewController.id=loginTextField.text
        welcomeViewController.configure(id: loginTextField.text)
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}
