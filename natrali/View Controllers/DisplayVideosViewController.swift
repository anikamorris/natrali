//
//  ViewController.swift
//  natrali
//
//  Created by Anika Morris on 1/6/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import UIKit
import WebKit

class DisplayVideosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var videos:[Video] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let video = Video(key: "OARVLvQx6OM", title: "NATURAL FALL MODEL MAKEUP for acne + textured skin")
        videos.append(video)
        
        let video2 = Video(key: "wcxzcwNUP8E", title: "Makeup For Finessers!!! \"No Makeup Makeup\" Tutorial")
        videos.append(video2)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // set number of rows to number of videos
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoTableViewCell", for: indexPath) as! VideoTableViewCell
        
        cell.videoTitle.text = videos[indexPath.row].title
        let url = "https://img.youtube.com/vi/\(videos[indexPath.row].key)/0.jpg"
        cell.videoImage.downloaded(from: url)
        
        return cell
    }
    
    struct Video {
        var key:String = ""
        var title:String = ""
    }

}
