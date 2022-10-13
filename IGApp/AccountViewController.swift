//
//  AccountViewController.swift
//  IGApp
//
//  Created by AndyLin on 2022/10/11.
//

import UIKit

class AccountViewController: UIViewController {

    
    @IBOutlet weak var accountCollectionView: UICollectionView!
    @IBOutlet weak var accountScrollView: UIScrollView!
    @IBOutlet weak var accountContentView: UIView!
    
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var accountImageView: UIImageView!
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var postsLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    

    var postsData = personalPhotoList
    var informationData = basicInformation(id: "AndyLin", account: "croc0909", posts: 20, followers: 99, following: 370)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAccountViewController()
        setScrollView()
        setCollectionView()
        // Do any additional setup after loading the view.
    }
    
    func setAccountViewController(){
        accountLabel.text = informationData.account
        accountImageView.image = UIImage(named: "鹿角蕨3")
        accountImageView.layer.cornerRadius = accountImageView.frame.width/2
        userIdLabel.text = informationData.id
        postsLabel.text = "\(informationData.posts)"
        followersLabel.text = "\(informationData.followers)"
        followingLabel.text = "\(informationData.following)"
    }
    
    func setScrollView(){
        accountScrollView.delegate = self
        // 設定 ScrollView contentSize
        let ScrollViewContentWidth = accountScrollView.layer.frame.width
        let ScrollViewContentHeight = accountScrollView.layer.frame.height
        
        accountScrollView.contentSize = CGSize(width: ScrollViewContentWidth, height: ScrollViewContentHeight + 500)
        
    }
    
    func setCollectionView(){
        accountCollectionView.delegate = self
        accountCollectionView.dataSource = self
    
        configureCellSize()
    }

    func configureCellSize() {
        
        let itemSpace: Double = 4 //間距
        let columnCount: Double = 3 // 每行 cell 的數量
        let flowLayout = accountCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        let width = floor((accountCollectionView.bounds.width - itemSpace * (columnCount-1)) / columnCount)
        flowLayout?.itemSize = CGSize(width: width, height: width)
        flowLayout?.estimatedItemSize = .zero
        flowLayout?.minimumInteritemSpacing = itemSpace // cell 左右間距
        flowLayout?.minimumLineSpacing = itemSpace // cell 上下間距
        

        var heightQuantity = postsData.count / Int(columnCount)
        if (postsData.count%3 != 0){
            heightQuantity += 1
        }

        // CollectionView 圖片寬度
        let imageWidth = floor((accountCollectionView.bounds.width - itemSpace * (columnCount-1)) / columnCount)
        // 計算 CollectionView 寬度
        let collectionContentWidth = imageWidth * columnCount + itemSpace * (columnCount - 1)
        // 計算 CollectionView 高度
        let collectionContentHight = Double(heightQuantity) * width + Double(heightQuantity - 1) * itemSpace
    
        // 設定 CollectionView contentSize
        accountCollectionView.contentSize = CGSize(width: collectionContentWidth, height: collectionContentHight)
        // 設定 CollectionView Size 與 content 一致
        accountCollectionView.layer.frame = CGRect(x: accountCollectionView.frame.origin.x, y: accountCollectionView.frame.origin.y, width: collectionContentWidth, height: collectionContentHight)
    }
    
    @IBSegueAction func toAccountPhotoSegueAction(_ coder: NSCoder) -> AccountPhotoViewController? {
        return AccountPhotoViewController(coder: coder,postsData: self.postsData)
    }
    
}

extension AccountViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return postsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:AccountCollectionViewCell.reuseIdentifier , for: indexPath) as! AccountCollectionViewCell
        
        let image = postsData[indexPath.item].imageName
        cell.imageView.image = UIImage(named: image)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("collection pick \(indexPath.row)") // 點選 collectionView
        performSegue(withIdentifier: "toAccountPhotoSegue", sender: nil)
    }
}
