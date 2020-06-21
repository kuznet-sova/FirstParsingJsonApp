//
//  LocationViewController.swift
//  FirstParsingJsonApp
//
//  Created by Ирина Кузнецова on 21.06.2020.
//  Copyright © 2020 Irina Kuznetsova. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {

    @IBOutlet var locationImageViev: UIImageView!
    
    var location: Location!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global().async {
            guard let stringURL = self.location.imageURL else { return }
            guard let imageURL = URL(string: stringURL) else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                self.locationImageViev.image = UIImage(data: imageData)
            }
        }
    }
}
