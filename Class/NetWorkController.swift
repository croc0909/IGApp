//
//  NetWorkController.swift
//  IGApp
//
//  Created by AndyLin on 2022/9/28.
//

import Foundation

class NetWorkController{
    static let shared = NetWorkController()
    
    var url:URL
    var apiKey:String
    var header:String
    
    let baseURL = URL(string: "https://dummyapi.io/data/v1")!
    
    init(){
        self.url = baseURL
        self.apiKey = ""
        self.header = ""
        print("NetWorkController init")
        print("url \(self.url) apiKey \(self.apiKey) header \(self.header)")
    }
    
    func setClass(url: URL, apiKey: String, header: String){
        self.url = url
        self.apiKey = apiKey
        self.header = header
    }
    
    // Get Data
    func getResponse(url: URL, completion: @escaping (Result<CommentData, Error>) -> Void){
        var request = URLRequest(url: url)
        request.setValue("6333ec7e307d65808394ccb8", forHTTPHeaderField: "app-id")
        //request.httpMethod = "post"
        print("request \(request)")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            if let content = String(data: data! , encoding: .utf8){
              print("content \(content)")
            }
            
            if let data{
                // 將資料轉型成 Model 格式
                do{
                    let shopResponse = try decoder.decode(CommentData.self, from: data)
                    completion(.success(shopResponse))
                    //print("shopResponse \(shopResponse)")
                }catch{
                    completion(.failure(error))
                    //print("error \(error)")
                }
            }
        }.resume()
    }
    
    func getPostResponse(url: URL, completion: @escaping (Result<PostData, Error>) -> Void){
        var request = URLRequest(url: url)
        request.setValue("6333ec7e307d65808394ccb8", forHTTPHeaderField: "app-id")
        print("request \(request)")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            if let content = String(data: data! , encoding: .utf8){
              print("content \(content)")
            }
            
            if let data{
                // 將資料轉型成 Model 格式
                do{
                    let shopResponse = try decoder.decode(PostData.self, from: data)
                    completion(.success(shopResponse))
                    //print("shopResponse \(shopResponse)")
                }catch{
                    completion(.failure(error))
                    //print("error \(error)")
                }
            }
        }.resume()
    }
    
    func getVideoResponse(url: URL, completion: @escaping (Result<VideoData, Error>) -> Void){
        
        let videoUrl = URL(string:"\(url)?key=30378899-f29062d01d334bc90cb6d8c84")!
        var request = URLRequest(url: videoUrl)
        //request.setValue("30378899-f29062d01d334bc90cb6d8c84", forHTTPHeaderField: "key")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            if let content = String(data: data! , encoding: .utf8){
              print("video content \(content)")
            }
            
            if let data{
                // 將資料轉型成 Model 格式
                do{
                    let shopResponse = try decoder.decode(VideoData.self, from: data)
                    completion(.success(shopResponse))
                    //print("shopResponse \(shopResponse)")
                }catch{
                    completion(.failure(error))
                    //print("error \(error)")
                }
            }
        }.resume()
    }
    /*
    // POST
    func uploadOrder(data:Order,completion:@escaping (Result<String,Error>)->()){
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("\(apiKey)", forHTTPHeaderField: "\(self.header)")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(data)
        URLSession.shared.dataTask(with: request) { (data,response,error) in
            
            if data != nil {
                completion(.success("發送成功"))
                if let content = String(data: data! , encoding: .utf8){
                 //print("response\(String(describing: response)) error\(String(describing: error))")
                  print("content \(content)")
                }
                
            }else if let error = error{
                completion(.failure(error))
            }
        }.resume()
    }
    
    // PATCH
    func updateOrder(urlString:String,data:ReviseOrder,completion:@escaping (Result<String,Error>)->()){
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue("\(apiKey)", forHTTPHeaderField: "\(self.header)")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(data)
        
        URLSession.shared.dataTask(with: request) { (data,response,error) in
            
            if data != nil {
                completion(.success("修改成功"))
                if let content = String(data: data! , encoding: .utf8){
                 //print("response\(String(describing: response)) error\(String(describing: error))")
                  print("content \(content)")
                }
                
            }else if let error = error{
                completion(.failure(error))
            }
        }.resume()
    }
    
    // DELETE
    func deleteOrder(urlString: String) {
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "DELETE"
        request.setValue("\(apiKey)", forHTTPHeaderField: "\(self.header)")
        URLSession.shared.dataTask(with: request) { (data,response,error) in
            if let response = response as? HTTPURLResponse, error == nil {
              print("Delete success")
              print(response.statusCode)
            } else {
              print(error!)
            }
        }.resume()
    }
     */
}
