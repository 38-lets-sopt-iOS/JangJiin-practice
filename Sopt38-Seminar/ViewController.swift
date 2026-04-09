//
//  ViewController.swift
//  Sopt38-Seminar
//
//  Created by 장지인 on 4/10/26.
//


import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
    }
}

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getFontName()
    }
    
    func getFontName() {
        for family in UIFont.familyNames {

            let sName: String = family as String
            print("family: \(sName)")
                    
            for name in UIFont.fontNames(forFamilyName: sName) {
                print("name: \(name as String)")
            }
        }
    }
}
