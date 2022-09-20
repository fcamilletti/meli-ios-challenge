//
//  ProductDetailController.swift
//  MELI iOS Challenge
//
//  Created by Franco Camilletti on 13/09/2022.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    private lazy var backButton: UIBarButtonItem = {
        let aButton = UIBarButtonItem()
        aButton.title = ""
        aButton.tintColor = .black
        aButton.style = .plain
        return aButton
    }()
        
    lazy var favButton: UIBarButtonItem = {
        let aButton = UIBarButtonItem()
        aButton.image = UIImage(systemName: "heart")
        aButton.tintColor = .black
        aButton.style = .plain
        return aButton
    }()
    
    lazy var searchButton: UIBarButtonItem = {
        let aButton = UIBarButtonItem()
        aButton.image = UIImage(systemName: "magnifyingglass")
        aButton.tintColor = .black
        aButton.style = .plain
        return aButton
    }()
    
    lazy var cartButton: UIBarButtonItem = {
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
    
    func setupView() {
        self.view.backgroundColor = .white
        navigationItem.backBarButtonItem = backButton
        navigationItem.rightBarButtonItem = cartButton
    }
    
    @objc private func onCartBeenPressed() {
        let vc = UnderConstructionViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}
