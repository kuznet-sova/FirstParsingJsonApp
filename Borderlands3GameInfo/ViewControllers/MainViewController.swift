//
//  MainViewController.swift
//  FirstParsingJsonApp
//
//  Created by Ирина Кузнецова on 27.06.2020.
//  Copyright © 2020 Irina Kuznetsova. All rights reserved.
//

import UIKit
import WebKit

class MainViewController: UIViewController {

    @IBOutlet var startVideoWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startVideoWebView.frame.size.height = startVideoWebView.frame.size.width/2
        getVideo(videoCode: "2hwkQTmB33k")
        getBackgroundImage(imageName: "start background.png")
    }
    
    func getVideo(videoCode: String) {
        guard let url = URL(string: "https://www.youtube.com/embed/\(videoCode)")
            else { return }
        startVideoWebView.load(URLRequest(url: url))
    }
    
    private func getBackgroundImage(imageName: String) {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: imageName)
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
}
