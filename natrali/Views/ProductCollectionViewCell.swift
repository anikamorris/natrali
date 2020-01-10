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
    
    var titleLabel:UILabel = {
        let label = UILabel(frame: CGRect(x:100, y: 30, width: UIScreen.main.bounds.width , height: 40))
        label.textAlignment = .left
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
//        let constraints:NSLayoutConstraint = NSLayoutConstraint(item: <#T##Any#>, attribute: <#T##NSLayoutConstraint.Attribute#>, relatedBy: <#T##NSLayoutConstraint.Relation#>, toItem: <#T##Any?#>, attribute: <#T##NSLayoutConstraint.Attribute#>, multiplier: <#T##CGFloat#>, constant: <#T##CGFloat#>)
//        self.titleLabel.addConstraints(<#T##constraints: [NSLayoutConstraint]##[NSLayoutConstraint]#>)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
