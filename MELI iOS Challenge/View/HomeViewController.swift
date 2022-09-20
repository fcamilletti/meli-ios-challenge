//
//  ViewController.swift
//  MELI iOS Challenge
//
//  Created by Franco Camilletti on 13/09/2022.
//

import UIKit

class HomeViewController: UIViewController, UISearchBarDelegate {
    
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
    
    private lazy var backButton: UIBarButtonItem = {
        let aButton = UIBarButtonItem()
        aButton.title = ""
        aButton.tintColor = .black
        aButton.style = .plain
        return aButton
    }()
    
    private lazy var searchBar: UISearchBar = {
        let aSearchBar = UISearchBar()
        aSearchBar.delegate = self
        aSearchBar.searchTextField.backgroundColor = .white
        aSearchBar.text = "Buscar en Mercado Libre"
        return aSearchBar
    }()
    
    private lazy var cartButton: UIBarButtonItem = {
        let aButton = UIBarButtonItem()
        aButton.image = UIImage(systemName: "cart")
        aButton.tintColor = .black
        aButton.style = .done
        aButton.target = self
        aButton.action = #selector(onCartBeenPressed)
        return aButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: - View Build
    
    private func setupView() {
        self.view.backgroundColor = .white
        self.view.addSubview(scrollView)
        self.view.addSubview(contentView)
        
        navigationItem.title = "Enviar a Franco Camilletti - Garibaldi 619"
        navigationItem.titleView = searchBar
        navigationItem.rightBarButtonItem = cartButton
        navigationItem.backBarButtonItem = backButton
        
        setupConstraints()
    }
    
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
            
        ])}
    
    //MARK: - Interactions
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Text Did Change to:", searchText)
    }
    
    @objc private func onCartBeenPressed() {
        let vc = ProductsListViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

