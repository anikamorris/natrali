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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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
    
    func setVideosByCategory() {
        
        if self.category == "Full face tutorials" {
            
            let video = Video(key: "Yi_ZHBpKmvE", title: "The Best Makeup for Work/School/Everyday")
            videos.append(video)
            
            let video2 = Video(key: "xZuytMLbRDE", title: "QUICK & EASY 5 MINUTE MAKEUP TUTORIAL!")
            videos.append(video2)
            
        } else if self.category == "Complexion" {
            
            let video = Video(key: "OARVLvQx6OM", title: "NATURAL FALL MODEL MAKEUP for acne + textured skin")
            videos.append(video)
            
            let video2 = Video(key: "wcxzcwNUP8E", title: "Makeup For Finessers!!! \"No Makeup Makeup\" Tutorial")
            videos.append(video2)
            
        } else if self.category == "Eyes" {
            
            let video = Video(key: "W4W-4VL1ABU", title: "How to Apply Eyeshadow PERFECTLY (beginner friendly hacks)")
            videos.append(video)
            
            let video2 = Video(key: "pPqySxcuSbo", title: "Beginner Eye Makeup Tips & Tricks")
            videos.append(video2)
            
        } else if self.category == "Brows" {
            
            let video = Video(key: "cjdtysezq5w", title: "How to Fill in Your Eyebrows for Beginners")
            videos.append(video)
            
            let video2 = Video(key: "cmhSam6L3lU", title: "Natural Looking Eyebrow Tutorial - Microblade Effect")
            videos.append(video2)
            
        } else if self.category == "Lips" {
            
            let video = Video(key: "MyK2d8s07YQ", title: "How To Choose The Perfect Nude Lipstick")
            videos.append(video)
            
            let video2 = Video(key: "rh1utMY2u88", title: "LIP PREP, HOW TO PICK YOUR LIP COLOR & HOW TO DO A OMBRE LIP")
            videos.append(video2)
            
        }
    }

}

struct Video {
    var key:String = ""
    var title:String = ""
}
