//
//  ViewController.swift
//  GOONS＿practice
//
//  Created by Eric chung on 2022/6/24.
//

import UIKit

class RootViewController: UIViewController {
    
    private let button = UIButton()
    
    private let fontSize:CGFloat = 16.0
    
    private let inset: CGFloat = 16.0

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavBar()
    }
    
    private func configureNavBar() {
        self.navigationItem.title = "第一頁"
        self.navigationItem.backButtonTitle = ""
        let yourBackImage = UIImage(named: "icons8-back-24")
        self.navigationController?.navigationBar.backIndicatorImage = yourBackImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
        self.navigationController?.navigationBar.tintColor = .black
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        let titleAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize, weight: .bold), NSAttributedString.Key.foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1)]
        appearance.titleTextAttributes = titleAttribute
        appearance.shadowColor = .clear
        appearance.shadowImage = UIImage()
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func configureButton() {
        button.addTarget(self, action: #selector(didTouchButton), for: .touchUpInside)
        
        button.setTitle("下一頁", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.font = UIFont(name: "PingFangTC-Regular", size: fontSize)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: fontSize*3 + inset).isActive = true
        button.heightAnchor.constraint(equalToConstant: fontSize + inset).isActive = true
        
    }
    
    @objc func didTouchButton () {
        let secondVC = SecondViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }

}

