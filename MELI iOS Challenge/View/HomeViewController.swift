//
//  ViewController.swift
//  MELI iOS Challenge
//
//  Created by Franco Camilletti on 13/09/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - View Code
    
    private lazy var scrollView: UIScrollView = {
        let aScrollView = UIScrollView()
        aScrollView.translatesAutoresizingMaskIntoConstraints = false
        return aScrollView
    }()
    
    private lazy var contentView: UIView = {
        let aView = UIView()
        aView.translatesAutoresizingMaskIntoConstraints = false
        return aView
    }()
    
    private lazy var searchTextField: MeliTextField = {
        let aTextField = MeliTextField()
        aTextField.translatesAutoresizingMaskIntoConstraints = false
        aTextField.icon = UIImage(systemName: "magnifyingglass")
        return aTextField
    }()
    
    private lazy var cartButton: UIButton = {
        let aButton = UIButton()
        aButton.translatesAutoresizingMaskIntoConstraints = false
        aButton.setImage(UIImage(systemName: "cart"), for: .normal)
        return aButton
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        self.view.backgroundColor = .white
        self.view.addSubview(scrollView)
        self.view.addSubview(contentView)
        self.view.addSubview(searchTextField)
        self.view.addSubview(cartButton)
    }
    
    //MARK: - View Build
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            contentView.heightAnchor.constraint(equalToConstant: 600),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            
            searchTextField.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            searchTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant:  16),
            searchTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  -56),
            searchTextField.heightAnchor.constraint(equalToConstant: 48),
            
            cartButton.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            cartButton.leadingAnchor.constraint(equalTo: searchTextField.trailingAnchor, constant: 5),
            cartButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -14),
            cartButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    //MARK: - Interactions
    
    
    //MARK: - Navigations
    
}

