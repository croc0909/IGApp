//
//  personalModel.swift
//  IGApp
//
//  Created by AndyLin on 2022/10/12.
//

import Foundation
import UIKit

struct basicInformation{
    var id:String
    var account:String
    var posts:Int
    var followers:Int
    var following:Int
    
    init(id: String, account: String, posts: Int, followers: Int, following: Int) {
        self.id = id
        self.account = account
        self.posts = posts
        self.followers = followers
        self.following = following
    }
}

struct postsData{
    //var image:UIImage
    var imageName:String
}

var personalPhotoList = [
    postsData(imageName: "鹿角蕨1"),postsData(imageName: "書"),postsData(imageName: "鹿角蕨2"),postsData(imageName: "鹿角蕨3"),postsData(imageName: "裝飾1"),postsData(imageName: "裝飾2"),postsData(imageName: "烤雞"),postsData(imageName: "觀音蓮"),postsData(imageName: "漢堡"),postsData(imageName: "冰"),postsData(imageName: "松鼠")
]
