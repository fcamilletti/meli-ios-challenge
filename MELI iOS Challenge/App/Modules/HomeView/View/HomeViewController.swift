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
        let customBack = customNavBar.backButton
        let customSearchBar = customNavBar.searchBar
        let customCart = customNavBar.cartButton
        navigationItem.backBarButtonItem = customBack
        navigationItem.titleView = customSearchBar
        customSearchBar.delegate = self
        navigationItem.rightBarButtonItem = customNavBar.cartButton
        customCart.target = self
        customCart.action = #selector(onCartBeenPressed)
    }
    
    
    //MARK: - Interactions
    
    @objc private func onCartBeenPressed() {
        let vc = UnderConstructionViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

//MARK: - Search

extension HomeViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        let vc = ProductsListViewController()
        vc.searchText = text
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.searchTextField.text = ""
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
        searchBar.showsCancelButton = false
        searchBar.becomeFirstResponder()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
    }
}

