
//
//  LoginViewController.swift
//  Sopt38-Seminar
//
//  Created by 장지인 on 4/4/26.
//

import UIKit

class LoginViewController_DelegatePattern : UIViewController, RetryLoginDelegateProtocol{
    func retryLogin(id: String) {
        loginTextField.text=""
        passwordTextField.text=""
        titleLabel.text="\(id)님, 다시 로그인해야해요!"
    }
    
    let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 76, y: 169, width: 236, height: 42))
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        //label.font = .boldSystemFont(ofSize: 16)
        label.font=UIFont(name: "Pretendard-Bold", size: 16)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    let loginTextField : UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 276, width: 335, height: 52))
        textField.placeholder = "아이디"
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        //textField.font = .boldSystemFont(ofSize: 14)
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 0))
        textField.leftViewMode = .always
        return textField
    }()
    
    let passwordTextField : UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 335, width: 335, height: 52))
        textField.placeholder = "비밀번호"
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        //textField.font = .boldSystemFont(ofSize: 14)
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        

        ////비밀번호 칠 때 안보이게/////////////////////
        textField.isSecureTextEntry = true
        ////비밀번호 한꺼번에 없애는 버튼 추가///////
        textField.clearButtonMode = .whileEditing
        /////////////////////////////////////////////////////
                
        
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 0))
        textField.leftViewMode = .always
        return textField
    }()
    
    lazy var loginButton : UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 515, width: 335, height: 57))
        button.setTitle("로그인하기", for: .normal)
        button.backgroundColor = .orange
        //button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 16)
        button.titleLabel?.textColor = .white
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(loginButtonDidTap),for: .touchUpInside)
        return button
    }()
    
    
    ////////////////////////////////////자동 로그인 기능 표현///////////////////////////////////////////////
        let autoLoginLabel: UILabel = {
            let label = UILabel(frame: CGRect(x: 20, y: 399, width: 100, height: 24))
            label.text = "자동 로그인"
            label.font = UIFont(name: "Pretendard-Bold", size: 14)
            label.textColor = .darkGray
            return label
        }()
        let autoLoginSwitch: UISwitch = {
            let uiSwitch = UISwitch(frame: CGRect(x: 295, y: 395, width: 49, height: 31))
            uiSwitch.isOn = true
            uiSwitch.onTintColor = .orange
            uiSwitch.thumbTintColor = .white
            return uiSwitch
        }()
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
    }
    func setUI() {
        view.addSubview(titleLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        
        
        
        //////////////////////화면에 자동 로그인 추가/////////////////////////////////
         view.addSubview(autoLoginLabel)
         view.addSubview(autoLoginSwitch)
         //////////////////////////////////////////////////////////////////////////////////
        
        
    }
    
    @objc func loginButtonDidTap() {
        //presentToWelcomeVC()
        navaigationToWelcomeVC()
    }
    
    private func presentToWelcomeVC() {
        let welcomeVC = WelcomeViewController_DelegatePattern()
        welcomeVC.modalPresentationStyle = .formSheet
        self.present(welcomeVC, animated: true)
    }
    
    private func navaigationToWelcomeVC(){
        let welcomeViewController = WelcomeViewController_DelegatePattern()
        //welcomeViewController.id=loginTextField.text
        welcomeViewController.configure(id: loginTextField.text)
        welcomeViewController.delegate=self

        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}
