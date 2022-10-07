//
//  FrontPageViewController.swift
//  IGApp
//
//  Created by AndyLin on 2022/9/29.
//

import UIKit
import Kingfisher

class FrontPageViewController: UIViewController {

    @IBOutlet weak var postTableView: UITableView!

    var basePostURL = URL(string: "https://dummyapi.io/data/v1/post")! //貼文url
    var baseImageURL = URL(string: "https://pixabay.com/api/?key=30378899-f29062d01d334bc90cb6d8c84")! //圖片url
    var baseVideoURL = URL(string: "https://pixabay.com/api/videos/")! //影片url
    
    var postData = PostData(data: [PostItems](), total: 0, page: 0, limit: 0) // 空資料 準備接資料
    var postItems = Items(id: "", message: "", owner: Props(id: "", title: "", firstName: "", lastName: "", picture: URL(filePath: "")), post: "", publishDate: "")
    
    var pickCell = 0 // 被選到的cell
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FrontPageSetting()
        getData()
        // Do any additional setup after loading the view.
    }
    
    func FrontPageSetting(){
        postTableView.dataSource = self
        postTableView.delegate = self
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
        }*/
    
        NetWorkController.shared.getVideoResponse(url: self.baseVideoURL) { result in
            switch result{
            case .success(let result):
                print("video success get \(result)")
            case .failure(let error):
                print("video error \(error) ")
            }
        }
        
        /*
        NetWorkController.shared.getResponse(url: self.baseCommentURL) { result in
            switch result{
            case .success(let result):
                print("success get \(result)")
            case .failure(let error):
                print("error \(error) ")
            }
        }
        */
        

    }

    func parseData(){
        print("postData \(postData))")
        print("postData \(postData.data.count)")
    
        DispatchQueue.main.async { // 畫面更新
            self.postTableView.reloadData()
        }
    }
    
    @IBAction func commentAction(_ sender: UIButton) {
        // 判斷使用者點擊第幾個 Cell
        let point = sender.convert(CGPoint.zero, to: postTableView)
        if let indexPath = postTableView.indexPathForRow(at: point) {
            //print("indexPath \(indexPath.row)")
            pickCell = indexPath.row
            // 儲存資料傳給下一頁
            postItems.id = postData.data[indexPath.row].id
            postItems.message = postData.data[indexPath.row].text
            postItems.owner = Props(id: postData.data[indexPath.row].owner.id, title: postData.data[indexPath.row].owner.title, firstName: postData.data[indexPath.row].owner.firstName, lastName: postData.data[indexPath.row].owner.lastName, picture: postData.data[indexPath.row].owner.picture)
            postItems.post = ""
            postItems.publishDate = postData.data[indexPath.row].publishDate
        }
        
    
        
        performSegue(withIdentifier: "toMessageSegue", sender: nil)
    }
    
    
    @IBSegueAction func toCommentSegueAction(_ coder: NSCoder) -> MessageViewController? {

        return MessageViewController(coder: coder,pickValue: pickCell,postInfo: postItems)
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


extension FrontPageViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "FrontPageTableViewCell", for: indexPath) as! FrontPageTableViewCell
        
        cell.avatarImageView.kf.setImage(with: postData.data[indexPath.row].owner.picture)
        cell.nameLabel.text = "\(postData.data[indexPath.row].owner.firstName) \(postData.data[indexPath.row].owner.lastName)"
        cell.pictureImageView.kf.setImage(with: postData.data[indexPath.row].image)
        cell.likeLabel.text = "\(postData.data[indexPath.row].likes) likes"
        cell.contentLabel.text = "\(postData.data[indexPath.row].text)"
        cell.timeLabel.text = "\(postData.data[indexPath.row].publishDate)"
        return cell
    }
}
