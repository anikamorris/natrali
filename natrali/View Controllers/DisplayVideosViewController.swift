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

    var videos:[MyVideo] = []
    var category:String = ""
    var video:MyVideo = MyVideo()
    
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
            
            let video = MyVideo(key: "Yi_ZHBpKmvE", title: "The Best Makeup for School/Work/Everyday")
            videos.append(video)
            
            let video2 = MyVideo(key: "xZuytMLbRDE", title: "Quick & Easy 5 Min Makeup")
            videos.append(video2)
            
            let video3 = MyVideo(key: "wcxzcwNUP8E", title: "\"No Makeup Makeup\" Tutorial")
            videos.append(video3)
            
        } else if self.category == "Complexion" {
            
            let video = MyVideo(key: "OARVLvQx6OM", title: "Natural Fall Makeup for Textured Skin")
            videos.append(video)
            
            let video2 = MyVideo(key: "VXQTOtLVTDI", title: "Flawless + Natural Glowy Skin")
            videos.append(video2)
            
            let video3 = MyVideo(key: "WSuTOpPG6I0", title: "How to Apply Bronzer Like a Pro")
            videos.append(video3)
            
        } else if self.category == "Eyes" {
            
            let video = MyVideo(key: "W4W-4VL1ABU", title: "How to Apply Eyeshadow PERFECTLY")
            videos.append(video)
            
            let video2 = MyVideo(key: "pPqySxcuSbo", title: "Beginner Eye Makeup Tips & Tricks")
            videos.append(video2)
            
            let video3 = MyVideo(key: "TfxJCQfcMkk", title: "How To: Apply Mascara For Beginners")
            videos.append(video3)
            
        } else if self.category == "Brows" {
            
            let video = MyVideo(key: "cjdtysezq5w", title: "How to Fill in Your Eyebrows for Beginners")
            videos.append(video)
            
            let video2 = MyVideo(key: "cmhSam6L3lU", title: "Natural Looking Eyebrow Tutorial")
            videos.append(video2)
            
            let video3 = MyVideo(key: "tsnwUG6glEU", title: "Brow Tips You Need to Know")
            videos.append(video3)
            
        } else if self.category == "Lips" {
            
            let video = MyVideo(key: "MyK2d8s07YQ", title: "How To Choose The Perfect Nude Lipstick")
            videos.append(video)
            
            let video2 = MyVideo(key: "rh1utMY2u88", title: "Lip Prep & How To Pick Your Lip Color")
            videos.append(video2)
            
            let video3 = MyVideo(key: "7OCes9Eubxs", title: "One Lipstick, Many Ways to Wear it!")
            videos.append(video3)
            
        }
    }
}

struct MyVideo {
    var key:String = ""
    var title:String = ""
    
}
