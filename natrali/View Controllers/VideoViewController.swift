//
//  VideoViewController.swift
//  natrali
//
//  Created by Anika Morris on 1/6/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class VideoViewController: UIViewController {
    
    var video:MyVideo = MyVideo(key: "", title: "")
    var products:[RecommendedProduct]?
    
    @IBOutlet weak var videoWebView: WKWebView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var creatorLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var productView: UIView!
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(ProductCell.self, forCellWithReuseIdentifier: "productCell")
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = video.title
        getVideo(withVideoKey: video.key)
        
        productView.addSubview(collectionView)
    
        collectionView.backgroundColor = .white
        collectionView.topAnchor.constraint(equalTo: productView.topAnchor, constant: 20).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: productView.leadingAnchor, constant: 20).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: productView.trailingAnchor, constant: -20).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: productView.bottomAnchor, constant: -20).isActive = true

        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    func getVideo(withVideoKey: String) {
        
        let url = URL(string: "https://www.youtube.com/embed/\(withVideoKey)")
        videoWebView.load(URLRequest(url: url!))
        
    }
}

extension VideoViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.height/1.2, height: collectionView.frame.height/1.2)
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let products = video.products {
            return products.count
        } else {
            return 0
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! ProductCell

        guard let products = video.products else { return cell }
        cell.product = products[indexPath.row]
        cell.titleLabel.text = cell.product!.name
        return cell
    }
    
}
