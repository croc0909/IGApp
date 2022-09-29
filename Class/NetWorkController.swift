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
        self.header = "6333ec7e307d65808394ccb8"
        print("getUrlResponse init")
    }
    
    func setClass(url: URL, apiKey: String, header: String){
        self.url = url
        self.apiKey = apiKey
        self.header = header
    }
    
    // Get Data
    func getResponse(url: URL, completion: @escaping (Result<String, Error>) -> Void){
        
        var request = URLRequest(url: url)
        
        request.setValue(self.apiKey, forHTTPHeaderField: self.header)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            if let content = String(data: data! , encoding: .utf8){
              print("content \(content)")
            }
            
            if let data{
                // 將資料轉型成 Model 格式
                do{
                    //let shopResponse = try decoder.decode(shoppingCartResponse.self, from: data)
                    completion(.success("Success"/*shopResponse.records*/))
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
