//
//  EditProfileViewController.swift
//  Sopt-38-practice
//
//  Created by 장지인 on 5/8/26.
//

import UIKit

import Then
import SnapKit

final class EditProfileViewController: UIViewController {
    private let idTextField = UITextField()
    private let nameTextField = UITextField()
    private let emailTextField = UITextField()
    private let ageTextField = UITextField()
    private let partTextField = UITextField()
    private lazy var editButton = UIButton()
    private let titleLabel = UILabel()
    
    private var id: String = ""
    private var name: String = ""
    private var email: String = ""
    private var age: Int = 0
    private var part: String = ""
    private var userInfo: UserInfo?
    var userId: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setStyle()
        setAddTarget()
        getUserInfo()
    }
    
    private func setUI() {
        view.addSubviews(
            titleLabel, idTextField, nameTextField, emailTextField, ageTextField, partTextField, editButton
        )
    }
    
    private func setStyle() {
        view.backgroundColor = .white
        
        titleLabel.do {
            $0.text = "내 정보 조회 및 수정"
            $0.font=UIFont(name: "Pretendard-Bold", size: 20)
            $0.textAlignment = .left
        }
        
        let placeholder = ["아이디", "이름", "이메일", "나이", "iOS, 안드로이드, 웹 중 하나를 입력해주세요."]
        
        [idTextField, nameTextField, emailTextField, ageTextField, partTextField]
            .enumerated()
            .forEach { index, textField in
                textField.do {
                    $0.addLeftPadding()
                    $0.placeholder = placeholder[index]
                    $0.borderStyle = .roundedRect
                    $0.autocapitalizationType = .none
                    $0.autocorrectionType = .no
                    $0.spellCheckingType = .no
                }
            }
        [idTextField, partTextField].forEach{
            $0.isEnabled = false
        }
        
        editButton.do {
            $0.setTitle("수정하기", for: .normal)
            $0.backgroundColor = .systemBlue
            $0.layer.cornerRadius = 10
        }
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(140)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        ageTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        partTextField.snp.makeConstraints {
            $0.top.equalTo(ageTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        editButton.snp.makeConstraints {
            $0.top.equalTo(partTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }
    
    private func setAddTarget() {
        [nameTextField, emailTextField, ageTextField].forEach {
            $0.addTarget(self, action: #selector(textFieldDidEditingChanged(_:)), for: .editingChanged)
        }
        
        editButton.addTarget(self, action: #selector(editButtonDidTap), for: .touchUpInside)
    }
    
    private func getUserInfo() {
        guard let userId else {return}
        Task{
            do{
                let response = try await GetUserInfoService.shared.getUserInfo(userId: userId)
                userInfo = response
                print("유저 정보: \(response)")
                updateUI(userInfo: response)
            }catch{
                let alert = UIAlertController(title: "유저 조회 실패", message: error.localizedDescription, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
                
                print("유저 조회 실패",error)
            }
        }
    }
    private func updateUI(userInfo: UserInfo){
        idTextField.text = userInfo.loginId
        nameTextField.text = userInfo.name
        emailTextField.text = userInfo.email
        ageTextField.text = "\(userInfo.age)"
        partTextField.text = userInfo.part
        
        id = userInfo.loginId
        name = userInfo.name
        email = userInfo.email
        age = userInfo.age
        part = userInfo.part
    }
}

extension EditProfileViewController {
    @objc
    private func textFieldDidEditingChanged(_ textField: UITextField) {
        switch textField {
        case nameTextField:
            name = textField.text ?? ""
        case emailTextField:
            email = textField.text ?? ""
        case ageTextField:
            age = Int(textField.text ?? "") ?? 0
        default:
            return
        }
    }
    
    @objc
    private func editButtonDidTap() {
        guard let userId else {return}
        Task{
            do{
                let _ = try await EditProfileService.shared.editUserInfo(userId: userId, name: name, email: email, age: age)
                let alert = UIAlertController(title: "유저 정보를 수정했습니다 ", message: "수정 완료", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
                print("수정 성공")
            }catch{
                let alert = UIAlertController(title: "수정 실패", message: error.localizedDescription, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
                
                print("수정 실패",error)
            }
        }
    }
}
