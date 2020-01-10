//
//  ProductCollectionViewCell.swift
//  natrali
//
//  Created by Anika Morris on 1/9/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation
import UIKit

class ProductCell: UICollectionViewCell {
    
    var product:RecommendedProduct? {
        didSet {
            guard let product = product else { return }
            bg.image = product.image
            titleLabel.text = product.name
        }
    }
    
    fileprivate let bg: UIImageView = {
        let productImage = UIImageView()
        productImage.image = #imageLiteral(resourceName: "browPowderABH")
        productImage.translatesAutoresizingMaskIntoConstraints = false
        productImage.contentMode = .scaleAspectFit
        productImage.clipsToBounds = true
        productImage.layer.cornerRadius = 12
        return productImage
    }()
    
    var titleLabel:UILabel = {
        
        let label = UILabel(frame: CGRect(x: 80, y: 230, width: 150, height: 40))
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = UIFont(name: "Futura", size: 17)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(bg)
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50).isActive = true
        
        self.addSubview(self.titleLabel)
//        self.titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
//        self.titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
//        self.titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
//        self.titleLabel.heightAnchor.constraint(equalToConstant: 40)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
