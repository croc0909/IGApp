//
//  MessageViewController.swift
//  IGApp
//
//  Created by AndyLin on 2022/10/6.
//

import UIKit
import Kingfisher

class MessageViewController: UIViewController {

    
    @IBOutlet weak var messageTableView: UITableView!
    
    var baseCommentURL = URL(string: "https://dummyapi.io/data/v1/comment")! //留言url
    var finalCommentURL = URL(string: "123")!
    
    var commentData = CommentData(data: [Items]()) // 空資料 準備接資料
    var post = Items(id: "", message: "", owner: Props(id: "", title: "", firstName: "", lastName: "", picture: URL(filePath: "")), post: "", publishDate: "")
    
    var limitNumber = 20 // 顯示幾則留言
    
    // 初始化
    init?(coder: NSCoder,pickValue:Int,postInfo:Items) {
        super.init(coder: coder)
        
        finalCommentURL = URL(string: "\(baseCommentURL)?page=\(pickValue)&limit=\(limitNumber)")!
        print("URL \(finalCommentURL)")
        post = postInfo
    }
    // 初始化失敗時
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MessageViewSetting()
        getData()
        // Do any additional setup after loading the view.
    }
    
    func MessageViewSetting(){
        messageTableView.dataSource = self
        messageTableView.delegate = self
    }
    
    func getData(){
        /*
        NetWorkController.shared.getPostResponse(url: self.basePostURL) { result in
            switch result{
            case .success(let result):
                print("success get \(result)")
                self.postData = result
                self.parseData()
            case .failure(let error):
                print("error \(error) ")
            }
        }
        */
        
        NetWorkController.shared.getResponse(url: self.finalCommentURL) { result in
            switch result{
            case .success(let result):
                print("success get \(result)")
                self.commentData = result
                self.parseData()
            case .failure(let error):
                print("error \(error) ")
            }
        }
        
        
        /*
        NetWorkController.shared.getImageResponse(url: self.baseImageURL) { result in
            switch result{
            case .success(let result):
                print("success get \(result)")
            case .failure(let error):
                print("error \(error) ")
            }
        }*/
    }
    
    func parseData(){
        print("commentData \(commentData)")
        print("comment \(commentData.data.count)")
        
        commentData.data.insert(post, at: 0) // 將 post 文章放到第一個留言
        
        DispatchQueue.main.async { // 畫面更新
            self.messageTableView.reloadData()
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension MessageViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentData.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCommentTableViewCell", for: indexPath) as! FirstCommentTableViewCell
            cell.avatarImageView.kf.setImage(with: commentData.data[indexPath.row].owner.picture)
            cell.messageContentLabel.text =  "\(commentData.data[indexPath.row].owner.firstName) \(commentData.data[indexPath.row].owner.lastName) \(commentData.data[indexPath.row].message)"
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "MessageTableViewCell", for: indexPath) as! MessageTableViewCell
            
            cell.avatarImageView.kf.setImage(with: commentData.data[indexPath.row].owner.picture)
            cell.messageContentLabel.text = "\(commentData.data[indexPath.row].owner.firstName) \(commentData.data[indexPath.row].owner.lastName) \(commentData.data[indexPath.row].message)"
            return cell
        }
    }
    
    
}
