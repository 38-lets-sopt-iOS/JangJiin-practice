//
//  WelcomeViewController.swift
//  Sopt38-Seminar
//
//  Created by 장지인 on 4/4/26.
//

import UIKit



protocol RetryLoginDelegateProtocol : AnyObject{
    func retryLogin(id : String)
}


class WelcomeViewController_DelegatePattern : UIViewController{
    
    weak var delegate : RetryLoginDelegateProtocol?
    
    let picture : UIImageView = {
        let image = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        image.image = UIImage(named: "image 52-1")
        return image
    }()
    
    private var id : String?
    
    func configure(id : String?){
        self.id = id
        
        if let id = id, !id.isEmpty {
            welcomeLabel.text="\(id)님\n반가워요"
        }else{
            welcomeLabel.text="사용자님\n반가워요"
        }
    }
    let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 295, width: 95, height: 60))
        label.font = UIFont(name: "Pretendard-ExtraBold", size: 25)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    let mainButton : UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 57))
        button.setTitle("메인으로", for: .normal)
        button.backgroundColor = .orange
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 16)
        button.titleLabel?.textColor = .white
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    lazy var loginAgainButton : UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 498, width: 335, height: 57))
        button.setTitle("다시 로그인", for: .normal)
        button.backgroundColor = .gray
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 16)
        button.titleLabel?.textColor = .darkGray
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
    }
    
    func setUI() {
        view.addSubviews(picture,welcomeLabel,loginAgainButton,mainButton)
    }
    
    @objc
    private func backToLoginButtonDidTap(){
        if let id = id{
            delegate?.retryLogin(id: id)
        }
        if self.navigationController == nil{
            self.dismiss(animated: true)
        }
        else{
            self.navigationController?.popViewController(animated: true)
        }
    }
}

