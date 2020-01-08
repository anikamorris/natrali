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
    
    var video:Video = Video()
    
    @IBOutlet weak var videoWebView: WKWebView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var creatorLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = video.title
        getVideo(withVideoKey: video.key)
    }
    
    func getVideo(withVideoKey: String) {
        
        let url = URL(string: "https://www.youtube.com/embed/\(withVideoKey)")
        videoWebView.load(URLRequest(url: url!))
        
    }
}
