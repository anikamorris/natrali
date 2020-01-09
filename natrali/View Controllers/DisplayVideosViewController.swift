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
    var category:String = ""
    var video:Video = Video()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationItem.title = self.category
        setVideosByCategory()
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let video = videos[indexPath.row]
        self.video = video
        
        performSegue(withIdentifier: "toVideo", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toVideo" {
            let vc = segue.destination as! VideoViewController
            vc.video = self.video
        }
    }
    
    func setVideosByCategory() {
        
        if self.category == "Full Face Tutorials" {
            
            let video = Video(key: "Yi_ZHBpKmvE", title: "The Best Makeup for Everyday")
            videos.append(video)
            
            let video2 = Video(key: "xZuytMLbRDE", title: "Quick & Easy 5 Min Makeup")
            videos.append(video2)
            
        } else if self.category == "Complexion" {
            
            let video = Video(key: "OARVLvQx6OM", title: "Natural Fall Makeup for Textured Skin")
            videos.append(video)
            
            let video2 = Video(key: "wcxzcwNUP8E", title: "\"No Makeup Makeup\" Tutorial")
            videos.append(video2)
            
        } else if self.category == "Eyes" {
            
            let video = Video(key: "W4W-4VL1ABU", title: "How to Apply Eyeshadow PERFECTLY")
            videos.append(video)
            
            let video2 = Video(key: "pPqySxcuSbo", title: "Beginner Eye Makeup Tips & Tricks")
            videos.append(video2)
            
        } else if self.category == "Brows" {
            
            let video = Video(key: "cjdtysezq5w", title: "How to Fill in Your Eyebrows for Beginners")
            videos.append(video)
            
            let video2 = Video(key: "cmhSam6L3lU", title: "Natural Looking Eyebrow Tutorial")
            videos.append(video2)
            
        } else if self.category == "Lips" {
            
            let video = Video(key: "MyK2d8s07YQ", title: "How To Choose The Perfect Nude Lipstick")
            videos.append(video)
            
            let video2 = Video(key: "rh1utMY2u88", title: "Lip Prep & How To Pick Your Lip Color")
            videos.append(video2)
            
        }
    }
}

struct Video {
    var key:String = ""
    var title:String = ""
}
