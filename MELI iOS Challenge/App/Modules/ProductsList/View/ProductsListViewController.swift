//
//  ProductListViewController.swift
//  MELI iOS Challenge
//
//  Created by Franco Camilletti on 20/09/2022.
//

import UIKit

class ProductsListViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
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
        setupNavBar()
    }
    
    private func setupNavBar() {
        let customNavBar = CustomNavBar()
        navigationItem.backBarButtonItem = customNavBar.backButton
        navigationItem.titleView = customNavBar.searchBar
        navigationItem.rightBarButtonItem = customNavBar.cartButton
        customNavBar.cartButton.target = self
        customNavBar.cartButton.action = #selector(onCartBeenPressed)
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
                       price: "$2.000.000")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ProductDetailViewController()
        productsTableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(vc, animated: true)
        print("cell tapped")
    }
    
    //MARK: - Interactions
    
    @objc private func onCartBeenPressed() {
        let vc = UnderConstructionViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
