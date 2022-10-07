//
//  CommentModel.swift
//  IGApp
//
//  Created by AndyLin on 2022/10/5.
//

import Foundation

struct CommentData:Decodable{
    var data: [Items]
}

struct Items:Decodable{
    var id:String
    var message:String
    var owner:Props
    var post:String
    var publishDate :String
}

struct Props:Decodable{
    var id:String
    var title:String
    var firstName:String
    var lastName:String
    var picture:URL
}
