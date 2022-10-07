//
//  postDataModel.swift
//  IGApp
//
//  Created by AndyLin on 2022/10/6.
//

import Foundation

struct PostData:Decodable{
    let data: [PostItems]
    let total:Int
    let page:Int
    let limit:Int
}

struct PostItems:Decodable{
    let id:String
    let image:URL
    let likes:Int
    //let tags:[TagItems]
    let text:String
    let publishDate :String
    let owner:PostOwner
}

struct TagItems:Decodable{
    
}

struct PostOwner:Decodable{
    let id:String
    let title:String
    let firstName:String
    let lastName:String
    let picture:URL
}
