//
//  SecondViewController.swift
//  GOONS＿practice
//
//  Created by Eric chung on 2022/6/24.
//

import UIKit

class SecondViewController: UIViewController, UIScrollViewDelegate {
    
    private var topbarHeight: CGFloat = 0
    
    private var fontSize: CGFloat = 14
    
    private let scrollView = UIScrollView()
    
    private let contentView = UIView()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dog")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        return imageView
    }()
    
    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 24
        view.heightAnchor.constraint(equalToConstant: 900).isActive = true
        return view
    }()
    
    var sizeOfBackButton:CGFloat = 24.0
    
    var alpha: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        scrollView.delegate = self
        configureNavBar()
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        topbarHeight = (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
               (self.navigationController?.navigationBar.frame.height ?? 0.0)
        configureScrollView()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    private func configureNavBar() {
        self.navigationItem.title = "果思設計"
        let yourBackImage = UIImage(named: "icons8-back-24")
        self.navigationController?.navigationBar.backIndicatorImage = yourBackImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
        self.navigationController?.navigationBar.tintColor = .black
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: alpha)
        let titleAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize, weight: .bold), NSAttributedString.Key.foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: alpha)]
        appearance.titleTextAttributes = titleAttribute
        appearance.shadowColor = .clear
        appearance.shadowImage = UIImage()
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func configureScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: -topbarHeight).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor ).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        configureSubviews()
    }
    
    private func configureSubviews() {
        contentView.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        let title = UILabel()
        title.text = "果思設計"
        title.textColor = .white
        title.font = UIFont(name:"HelveticaNeue-Medium", size: 20)
        title.translatesAutoresizingMaskIntoConstraints = false
        imageView.addSubview(title)
        
        let subTitle = UILabel()
        subTitle.textColor = .white
        subTitle.text = "iOS APP"
        subTitle.font = UIFont(name:"HelveticaNeue", size: 20)
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        imageView.addSubview(subTitle)
        
        title.topAnchor.constraint(equalTo: imageView.topAnchor, constant: sizeOfBackButton+40).isActive = true
        title.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 14).isActive = true
        
        subTitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 14).isActive = true
        subTitle.leadingAnchor.constraint(equalTo: title.leadingAnchor).isActive = true
        
        contentView.addSubview(redView)
        redView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -50).isActive = true
        redView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 20).isActive = true
        redView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -20).isActive = true
        redView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        redView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
    }
    
    @objc private func didTouchButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        alpha = (scrollView.contentOffset.y + 64) / 100
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.shadowColor = .clear
        appearance.shadowImage = UIImage()
        appearance.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: alpha)
        let titleAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize, weight: .bold), NSAttributedString.Key.foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: alpha)]
        appearance.titleTextAttributes = titleAttribute
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        setNeedsStatusBarAppearanceUpdate()
        
    }
    
}
