//
//  VideoViewController.swift
//  IGApp
//
//  Created by AndyLin on 2022/10/11.
//

import UIKit
import Kingfisher
import AVKit
import AVFoundation

var player:AVPlayer?
var controller = AVPlayerViewController()

class VideoViewController: UIViewController {

    @IBOutlet weak var VideoView: UIView!
    
    
    var baseVideoURL = URL(string: "https://pixabay.com/api/videos/")! //影片url
    
    var videoData = VideoData(total: 0, totalHits: 0, hits: [VideoItems]()) // 空資料
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        // Do any additional setup after loading the view.
    }
    
    func getData(){
        NetWorkController.shared.getVideoResponse(url: self.baseVideoURL) { result in
            switch result{
            case .success(let result):
                print("video success get \(result)")
                self.videoData = result
                self.parseData()
            case .failure(let error):
                print("video error \(error) ")
            }
        }
    }
    
    func parseData(){
        print("videoData \(videoData.hits.count)")
        
        DispatchQueue.main.async{
            self.playVideo()
        }
    }
    
    func playVideo(){
        
        if let videoUrl = videoData.hits[0].videos["large"]{
            print("Play \(videoUrl.url)")
            //player = AVPlayer(url:URL(string: "https://video-ssl.itunes.apple.com/apple-assets-us-std-000001/Video128/v4/ac/7c/62/ac7c6274-60ea-5b7c-4c99-f08d78bfe574/mzvf_484000410198456586.640x352.h264lc.U.p.m4v")!)
            player = AVPlayer(url:videoUrl.url)
            let layer = AVPlayerLayer(player: player)
            layer.frame = VideoView.bounds
            VideoView.layer.addSublayer(layer)
            player?.play()
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
