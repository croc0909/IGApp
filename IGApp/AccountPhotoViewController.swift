//
//  AccountPhotoViewController.swift
//  IGApp
//
//  Created by AndyLin on 2022/10/12.
//

import UIKit

class AccountPhotoViewController: UIViewController {

    @IBOutlet weak var accountPhotoTableView: UITableView!
    
    var allpostData = [postsData]()
    // 初始化
    init?(coder: NSCoder,postsData:[postsData]) {
        super.init(coder: coder)
        allpostData = postsData
        print("allpostData \(allpostData)")
    }
    // 初始化失敗時
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        // Do any additional setup after loading the view.
    }
    
    func setTableView(){
        accountPhotoTableView.delegate = self
        accountPhotoTableView.dataSource = self
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

extension AccountPhotoViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allpostData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountPhotoTableViewCell.reuseIdentifier, for: indexPath) as! AccountPhotoTableViewCell
        cell.accountImageView.image = UIImage(named: "鹿角蕨3")
        cell.postImageView.image = UIImage(named: allpostData[indexPath.row].imageName)
        
        return cell
    }
    
    
}
