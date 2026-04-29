//
//  ScrollView.swift
//  Sopt-38-practice
//
//  Created by 장지인 on 4/11/26.
//
import UIKit

import SnapKit

class ScrollViewPractice2: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let grennView = UIView()
    private let blueView = UIView()
    private let redView = UIView()
    private let orangeView = UIView()
    private let yellowView = UIView()
    private let purpleView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    private func setUI() {
        view.backgroundColor = .white
        grennView.backgroundColor = .green
        blueView.backgroundColor = .blue
        redView.backgroundColor = .red
        orangeView.backgroundColor = .orange
        yellowView.backgroundColor = .yellow
        purpleView.backgroundColor = .purple
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [grennView, blueView,redView,orangeView,yellowView,purpleView].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        
        let width = UIScreen.main.bounds.width/2
        redView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalTo(337)
            $0.width.equalTo(width)
        }
        orangeView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(redView.snp.trailing)
            $0.height.equalTo(337)
            $0.width.equalTo(width)
        }
        yellowView.snp.makeConstraints {
            $0.top.equalTo(redView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.height.equalTo(337)
            $0.width.equalTo(width)
        }
        grennView.snp.makeConstraints {
            $0.top.equalTo(orangeView.snp.bottom)
            $0.leading.equalTo(yellowView.snp.trailing)
            $0.height.equalTo(337)
            $0.width.equalTo(width)
        }
        
        blueView.snp.makeConstraints {
            $0.top.equalTo(yellowView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.height.equalTo(337)
            $0.width.equalTo(width)
            $0.bottom.equalToSuperview()

        }
       
        
        purpleView.snp.makeConstraints {
            $0.top.equalTo(grennView.snp.bottom)
            $0.leading.equalTo(blueView.snp.trailing)
            $0.height.equalTo(337)
            $0.width.equalTo(width)
            $0.bottom.equalToSuperview()
        }
    }
    
    
}
