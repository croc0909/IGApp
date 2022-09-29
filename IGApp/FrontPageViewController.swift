//
//  FrontPageViewController.swift
//  IGApp
//
//  Created by AndyLin on 2022/9/29.
//

import UIKit

class FrontPageViewController: UIViewController {

    var baseURL = URL(string: "https://dummyapi.io/data/v1")!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func getUrlAction(_ sender: Any) {
        
        NetWorkController.shared.getResponse(url: self.baseURL) { result in
            switch result{
            case .success(let string):
                print("success \(string)")
            case .failure(let error):
                print("error \(error) ")
            }
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
