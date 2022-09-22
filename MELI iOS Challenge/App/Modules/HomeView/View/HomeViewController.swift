//
//  ViewController.swift
//  MELI iOS Challenge
//
//  Created by Franco Camilletti on 13/09/2022.
//

import UIKit

class HomeViewController: UIViewController, UISearchResultsUpdating {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: - View Build
    
    private func setupView() {
        self.view.backgroundColor = .white
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        
        setupConstraints()
        setupNavBar()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            
        ])}
    
    private func setupNavBar() {
        let customNavBar = CustomNavBar()
        navigationItem.backBarButtonItem = customNavBar.backButton
        navigationItem.titleView = customNavBar.searchBar
        navigationItem.rightBarButtonItem = customNavBar.cartButton
        customNavBar.cartButton.target = self
        customNavBar.cartButton.action = #selector(onCartBeenPressed)
    }
    
    //MARK: - Search Controller
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        print(text)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Text Did Change to:", searchText)
    }
    
    //MARK: - Interactions
    
    @objc private func onCartBeenPressed() {
        let vc = ProductsListViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

