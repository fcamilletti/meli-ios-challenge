//
//  ProductListViewController.swift
//  MELI iOS Challenge
//
//  Created by Franco Camilletti on 20/09/2022.
//

import UIKit

class ProductsListViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var searchText: String?
    var viewModel: SearchViewModel!
    var products = [Product]()
    
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
        self.viewModel = SearchViewModel(service: SearchService())
        self.viewModel.delegate = self
        productsTableView.frame = view.bounds
        productsTableView.backgroundColor = .white
        productsTableView.delegate = self
        productsTableView.dataSource = self
        setupNavBar()
        getProducts()
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
        products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as? ProductTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(imageName: products[indexPath.item].body.secure_thumbnail,
                       text: products[indexPath.item].body.title,
                       price: NumberFormatter.localizedString(from: NSNumber(value: products[indexPath.item].body.price), number: .currency))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ProductDetailViewController()
        vc.product = products[indexPath.item]
        productsTableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - Functions
    
    @objc private func onCartBeenPressed() {
        let vc = UnderConstructionViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func getProducts(){
        DispatchQueue.main.async {
            self.viewModel.getProductsDetail(product: self.searchText!) { products in
                self.products = products
                self.productsTableView.reloadData()
            } onError: { error in
                self.didFailWithError(error: error)
            }
        }
    }
    
}

//MARK: - SearchServiceDelegate
extension ProductsListViewController: SearchServiceDelegate {
    func didFailWithError(error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.navigationController?.popToRootViewController(animated: true)
        }))
        self.present(alert, animated: true)
    }
}
