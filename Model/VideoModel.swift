//
//  VideoModel.swift
//  IGApp
//
//  Created by AndyLin on 2022/10/7.
//

import Foundation

struct VideoData:Decodable{
    let total:Int
    let totalHits:Int
    let hits:[VideoItems]
}

struct VideoItems:Decodable{
    let id:Int
    let pageURL:URL
    let type:String
    //let tags:
    let duration:Int
    let picture_id:String
    let videos:Dictionary<String,Videos>
    let views:Int
    let downloads:Int
    let likes:Int
    let comments:Int
    let user_id:Int
    let user:String
    let userImageURL:URL?
}

struct Videos:Decodable{
    let url:URL
    let width:Int
    let height:Int
    let size:Int
}


