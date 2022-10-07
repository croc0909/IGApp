//
//  ImageData.swift
//  IGApp
//
//  Created by AndyLin on 2022/10/5.
//

import Foundation

struct ImageData:Decodable{
    let total: Int
    let totalHits:Int
    let hits:[ImageItems]
}

struct ImageItems:Decodable{
    let id:Int
    let pageURL:URL
    let type:String
    let tags:String
    let previewURL:URL
    let previewWidth:Int
    let previewHeight:Int
    let webformatURL:URL
    let webformatWidth:Int
    let webformatHeight:Int
    let largeImageURL:URL
    let imageWidth:Int
    let imageHeight:Int
    let imageSize:Int
    let views:Int
    let downloads:Int
    let collections:Int
    let likes:Int
    let comments:Int
    let user_id:Int
    let user:String
    let userImageURL:URL
}

