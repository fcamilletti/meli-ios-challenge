//
//  ProductTableCell.swift
//  MELI iOS Challenge
//
//  Created by Franco Camilletti on 19/09/2022.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    static let identifier = "ProductTableViewCell"
    
    private lazy var productImage: UIImageView = {
        let aImage = UIImageView()
        aImage.translatesAutoresizingMaskIntoConstraints = false
        aImage.contentMode = .scaleAspectFit
        aImage.clipsToBounds = true
        return aImage
    }()
    
    private lazy var productName: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.font = .systemFont(ofSize: 14)
        return aLabel
    }()
    
    private lazy var productPrice: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.text = "$20000"
        aLabel.font = .systemFont(ofSize: 26)
        return aLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(imageName: String, text: String, price: String) {
        productImage.image = UIImage(named: imageName)
        productName.text = text
        productPrice.text = price
    }
    
    override func prepareForReuse() {
        productImage.image = nil
        productName.text = nil
        productPrice.text = nil
    }
    
    private func setupView() {
        contentView.backgroundColor = .white
        contentView.addSubview(productImage)
        contentView.addSubview(productName)
        contentView.addSubview(productPrice)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        super.layoutSubviews()
        
        productImage.frame = CGRect(x: 5,
                                    y: 5,
                                    width: 100,
                                    height: 90)
        
        productName.frame = CGRect(x: 110,
                                    y: 10,
                                    width: 200,
                                    height: 20)
        
        productPrice.frame = CGRect(x: 110,
                                    y: 40,
                                    width: 200,
                                    height: 20)
        
    }
}
