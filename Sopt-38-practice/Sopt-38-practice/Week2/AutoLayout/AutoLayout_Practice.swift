
//
//  LoginViewController.swift
//  Sopt38-Seminar
//
//  Created by 장지인 on 4/4/26.
//

import UIKit

class AutoLayout_Practice : UIViewController{
    private let yellowView = UIView()
    private let greenView = UIView()
    private let blackView = UIView()
    private let blueView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    private func setUI() {
        view.backgroundColor = .white
        blueView.backgroundColor = .blue
        greenView.backgroundColor = .green
        blackView.backgroundColor = .black
        yellowView.backgroundColor = .yellow
        [greenView, blueView,yellowView,blackView].forEach {$0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        let height = UIScreen.main.bounds.height / 4
        let width = UIScreen.main.bounds.width / 2

        NSLayoutConstraint.activate([
            yellowView.topAnchor.constraint(equalTo: view.topAnchor),
            yellowView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            yellowView.widthAnchor.constraint(equalToConstant: width),
            yellowView.heightAnchor.constraint(equalToConstant: height)
        ])
            
        NSLayoutConstraint.activate([
            greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor),
            greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            greenView.widthAnchor.constraint(equalToConstant: width),
            greenView.heightAnchor.constraint(equalToConstant: height)
        ])
            
        NSLayoutConstraint.activate([
            blackView.topAnchor.constraint(equalTo: greenView.bottomAnchor),
            blackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blackView.widthAnchor.constraint(equalToConstant: width),
            blackView.heightAnchor.constraint(equalToConstant: height)
        ])
            
        NSLayoutConstraint.activate([
            blueView.topAnchor.constraint(equalTo: blackView.bottomAnchor),
            blueView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blueView.widthAnchor.constraint(equalToConstant: width),
            blueView.heightAnchor.constraint(equalToConstant: height)
        ])
    }
}
