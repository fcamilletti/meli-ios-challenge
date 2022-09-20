//
//  ProductListViewController.swift
//  MELI iOS Challenge
//
//  Created by Franco Camilletti on 20/09/2022.
//

import UIKit

class ProductsListViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
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
    
    private let productsTableView: UITableView = {
        let aTableView = UITableView()
        aTableView.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.identifier)
        return aTableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.addSubview(productsTableView)
        
        productsTableView.frame = view.bounds
        productsTableView.backgroundColor = .white
        productsTableView.delegate = self
        productsTableView.dataSource = self
        
        navigationItem.titleView = searchBar
        navigationItem.rightBarButtonItem = cartButton
        navigationItem.backBarButtonItem = backButton
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier,
                                                       for: indexPath) as? ProductTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(imageName: indexPath.row % 2 == 0 ? "auto1" : "auto2",
                       text: "Nombre de producto \(indexPath.row)",
                       price: "$20000")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ProductDetailViewController()
        productsTableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(vc, animated: true)
        print("cell tapped")
    }
    
    @objc private func onCartBeenPressed() {
        let vc = UnderConstructionViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
