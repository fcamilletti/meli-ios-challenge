//
//  UnderConstructionViewController.swift
//  MELI iOS Challenge
//
//  Created by Franco Camilletti on 14/09/2022.
//

import UIKit

class UnderConstructionViewController: UIViewController {
    
    // MARK: - View Code
    
    private lazy var contentView: UIView = {
        let aView = UIView()
        aView.translatesAutoresizingMaskIntoConstraints = false
        return aView
    }()
    
    private lazy var underConstructionLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.text = "This site is under construction"
        aLabel.textColor = .systemGray
        aLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return aLabel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    //MARK: - View Build
    
    private func setupView() {
        self.view.addSubview(contentView)
        self.view.addSubview(underConstructionLabel)
        self.view.backgroundColor = .white
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            underConstructionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            underConstructionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            
        ])}
    
    // MARK: - Navigation

}
