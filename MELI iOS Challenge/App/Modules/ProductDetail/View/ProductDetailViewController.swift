//
//  ProductDetailController.swift
//  MELI iOS Challenge
//
//  Created by Franco Camilletti on 13/09/2022.
//

import UIKit
import PaddingLabel

class ProductDetailViewController: UIViewController {
    
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
    
    private lazy var productStatus: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.text = "Usado"
        aLabel.textColor = .systemGray
        aLabel.font = .systemFont(ofSize: 14)
        return aLabel
    }()
    
    private lazy var productName: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.text = "Volkswagen Gol Trend 1.6"
        aLabel.font = .systemFont(ofSize: 20)
        return aLabel
    }()
    
    private lazy var sellerIdentity: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.text = "Vendedor con identidad verificada"
        aLabel.textColor = .systemGray
        aLabel.font = .systemFont(ofSize: 12)
        return aLabel
    }()
    
    private lazy var productImage: UIImageView = {
        let aImage = UIImageView()
        aImage.translatesAutoresizingMaskIntoConstraints = false
        aImage.image = UIImage(named: "auto1")
        aImage.contentMode = .scaleAspectFit
        aImage.clipsToBounds = true
        return aImage
    }()
    
    private lazy var productPrice: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.text = "$2.000.000"
        aLabel.font = .systemFont(ofSize: 30)
        return aLabel
    }()
    
    private lazy var buyButton: UIButton = {
        let aButton = UIButton()
        aButton.translatesAutoresizingMaskIntoConstraints = false
        aButton.setTitle("Comprar", for: .normal)
        aButton.backgroundColor = .systemBlue
        aButton.layer.cornerRadius = 6
        return aButton
    }()
    
    private lazy var callButton: UIButton = {
        let aButton = UIButton()
        aButton.translatesAutoresizingMaskIntoConstraints = false
        aButton.setTitle(" Llamar", for: .normal)
        aButton.setImage(UIImage(systemName: "phone"),for: .normal)
        aButton.tintColor = .white
        aButton.backgroundColor = .systemBlue
        aButton.layer.cornerRadius = 6
        return aButton
    }()
    
    private lazy var addToFavButton: UIButton = {
        let aButton = UIButton()
        aButton.translatesAutoresizingMaskIntoConstraints = false
        aButton.setTitle(" Agregar a favoritos", for: .normal)
        aButton.setTitleColor(.systemBlue, for: .normal)
        aButton.setImage(UIImage(systemName: "heart"), for: .normal)
        aButton.tintColor = .systemBlue
        return aButton
    }()
    
    private lazy var shareButton: UIButton = {
        let aButton = UIButton()
        aButton.translatesAutoresizingMaskIntoConstraints = false
        aButton.setTitle(" Compartir", for: .normal)
        aButton.setTitleColor(.systemBlue, for: .normal)
        aButton.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        aButton.tintColor = .systemBlue
        return aButton
    }()
    
    private lazy var productDescription: PaddingLabel = {
        let aLabel = PaddingLabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.text = """
        Descripción
        
        Volkswagen Gol Trend 1.6 3p Año 2013 - Liv Motors
        
        MUY BUENAS CONDICIONES MECANICAS Y ESTETICAS!!!

        USADOS CON GARANTIA!!!

        VTV VIGENTE - GRABADO DE AUTO PARTES - AL DÍA y CON DOCUMENTACIÓN LISTA PARA TRANSFERIR

        SEÑA: $100.000 y RESERVA EN MERCADO LIBRE (LUEGO DE VER EL AUTO)

        ACEPTO PERMUTAS - FINANCIO - ACEPTO MERCADO PAGO

        ANTICIPO $1.350.000 + CUOTAS FIJAS!!!

        EN LA CUOTA SE INCLUYEN TODOS LOS GASTOS DE TRANSFERENCIA.

        Se puede ver en Av. Mitre 3818 (esquina G. White), Munro - Vicente Lopez
        Horarios de Lunes a Viernes de 9.30 a 13.00 y de 15.00 a 19.00. Sabados de 9.30 a 13.00.
        
        """
        aLabel.textAlignment = .left
        aLabel.font = .systemFont(ofSize: 16)
        aLabel.numberOfLines = 0
        return aLabel
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
        self.contentView.addSubview(productStatus)
        self.contentView.addSubview(productName)
        self.contentView.addSubview(sellerIdentity)
        self.contentView.addSubview(productImage)
        self.contentView.addSubview(productPrice)
        self.contentView.addSubview(buyButton)
        self.contentView.addSubview(callButton)
        self.contentView.addSubview(addToFavButton)
        self.contentView.addSubview(shareButton)
        self.contentView.addSubview(productDescription)
        setupConstraints()
        setupNavBar()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            contentView.heightAnchor.constraint(equalToConstant: 2000),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            
            productStatus.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            productStatus.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),

            productName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            productName.topAnchor.constraint(equalTo: productStatus.bottomAnchor, constant: 8),
            
            sellerIdentity.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            sellerIdentity.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 8),
            
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            productImage.topAnchor.constraint(equalTo: sellerIdentity.bottomAnchor, constant: 24),
            productImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            productImage.heightAnchor.constraint(equalTo: productImage.widthAnchor),
            
            productPrice.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            productPrice.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 24),
            
            buyButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            buyButton.topAnchor.constraint(equalTo: productPrice.bottomAnchor, constant: 24),
            buyButton.widthAnchor.constraint(equalToConstant: 167),
            buyButton.heightAnchor.constraint(equalToConstant: 48),
            
            callButton.leadingAnchor.constraint(equalTo: buyButton.trailingAnchor, constant: 9),
            callButton.topAnchor.constraint(equalTo: productPrice.bottomAnchor, constant: 24),
            callButton.widthAnchor.constraint(equalToConstant: 167),
            callButton.heightAnchor.constraint(equalToConstant: 48),
            
            addToFavButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            addToFavButton.topAnchor.constraint(equalTo: callButton.bottomAnchor, constant: 34),
            
            shareButton.leadingAnchor.constraint(equalTo: addToFavButton.trailingAnchor, constant: 20),
            shareButton.topAnchor.constraint(equalTo: callButton.bottomAnchor, constant: 34),
            
            productDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            productDescription.topAnchor.constraint(equalTo: shareButton.bottomAnchor, constant: 58),
            productDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
        ])
    }
    
    private func setupNavBar() {
        let customNavBar = CustomNavBar()
        navigationItem.backBarButtonItem = customNavBar.backButton
        navigationItem.rightBarButtonItems = [customNavBar.cartButton, customNavBar.searchButton, customNavBar.favButton]
        customNavBar.cartButton.target = self
        customNavBar.cartButton.action = #selector(onCartBeenPressed)
    }
    
    //MARK: - Interactions
    
    @objc private func onCartBeenPressed() {
        let vc = UnderConstructionViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
