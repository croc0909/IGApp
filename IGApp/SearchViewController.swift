//
//  SearchViewController.swift
//  IGApp
//
//  Created by AndyLin on 2022/10/13.
//

import UIKit
import Kingfisher

class SearchViewController: UIViewController {

    @IBOutlet weak var SearchCollectionView: UICollectionView!
    
    var basePostURL = URL(string: "https://dummyapi.io/data/v1/post")! //貼文url
    
    var postData = PostData(data: [PostItems](), total: 0, page: 0, limit: 0) // 空資料 準備接資料
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        getData()
        // Do any additional setup after loading the view.
    }
    
    func setCollectionView(){
        SearchCollectionView.delegate = self
        SearchCollectionView.dataSource = self
        
        configureCellSize()
    }
    
    func configureCellSize() {
        
        let itemSpace: Double = 4 //間距
        let columnCount: Double = 3 // 每行 cell 的數量
        let flowLayout = SearchCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        let width = floor((SearchCollectionView.bounds.width - itemSpace * (columnCount-1)) / columnCount)
        flowLayout?.itemSize = CGSize(width: width, height: width)
        flowLayout?.estimatedItemSize = .zero
        flowLayout?.minimumInteritemSpacing = itemSpace // cell 左右間距
        flowLayout?.minimumLineSpacing = itemSpace // cell 上下間距
        
    }
    
    func getData(){
        
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
    }

    func parseData(){
        DispatchQueue.main.async { // 畫面更新
            self.SearchCollectionView.reloadData()
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

extension SearchViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  postData.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:SearchCollectionViewCell.reuseIdentifier , for: indexPath) as! SearchCollectionViewCell
        
        cell.imageView.kf.setImage(with: postData.data[indexPath.row].image)
        
        return cell
    }
    
    
}
