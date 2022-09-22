//
//  NavBarItems.swift
//  MELI iOS Challenge
//
//  Created by Franco Camilletti on 19/09/2022.
//

import UIKit

class CustomNavBar: UIViewController, UISearchBarDelegate {
    
    lazy var sendLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.text = "Enviar a Franco Camilletti - Garibaldi 619"
        return aLabel
    }()
    
    lazy var backButton: UIBarButtonItem = {
        let aButton = UIBarButtonItem()
        aButton.title = ""
        aButton.tintColor = .black
        aButton.style = .plain
        aButton.image = UIImage(named: "arrow.backward")
        return aButton
    }()
    
    lazy var searchBar: UISearchBar = {
        let aSearchBar = UISearchBar()
        aSearchBar.delegate = self
        aSearchBar.searchTextField.backgroundColor = .white
        aSearchBar.placeholder = "Buscar en Mercado Libre"
        aSearchBar.tintColor = .black
        aSearchBar.layer.cornerRadius = 20
        aSearchBar.layer.shadowColor = UIColor.black.cgColor
        aSearchBar.layer.shadowOpacity = 0.25
        aSearchBar.layer.shadowOffset = CGSize(width: 2, height: 2)
        aSearchBar.layer.shadowRadius = 3
        return aSearchBar
    }()
    
    lazy var cartButton: UIBarButtonItem = {
        let aButton = UIBarButtonItem()
        aButton.image = UIImage(systemName: "cart")
        aButton.tintColor = .black
        aButton.style = .done
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
    
}
