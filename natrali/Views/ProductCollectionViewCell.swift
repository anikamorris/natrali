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
        }
    }
    
    fileprivate let bg: UIImageView = {
        let productImage = UIImageView()
        productImage.image = #imageLiteral(resourceName: "browPowderABH")
        productImage.translatesAutoresizingMaskIntoConstraints = false
        productImage.contentMode = .scaleAspectFill
        productImage.clipsToBounds = true
        productImage.layer.cornerRadius = 12
        return productImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(bg)
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
