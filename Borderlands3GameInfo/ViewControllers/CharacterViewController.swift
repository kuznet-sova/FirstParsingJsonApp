//
//  CharacterViewController.swift
//  FirstParsingJsonApp
//
//  Created by Ирина Кузнецова on 20.06.2020.
//  Copyright © 2020 Irina Kuznetsova. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {

    @IBOutlet var characterImageViev: UIImageView!
    @IBOutlet var characterNameLabel: UILabel!
    @IBOutlet var characterClassLabel: UILabel!
    @IBOutlet var characterDescriptionLabel: UILabel!
    
    private var spinnerView: UIActivityIndicatorView?
    
    var character: Character!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCharacterImage()
        characterNameLabel.text = character.nameCharacter
        characterClassLabel.text = "Class: \(character.classCharacter)"
        characterDescriptionLabel.text = character.descriptionCharacter
        spinnerView = showSpinner(in: characterImageViev)
    }
    
    private func getCharacterImage() {
        guard let imageUrl = URL(string: character.imageUrl) else { return }
        
        URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.spinnerView?.stopAnimating()
                    self.characterImageViev.image = image
                }
            }
        }.resume()
    }
    
    private func showSpinner(in view: UIView) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .gray
        activityIndicator.startAnimating()
        activityIndicator.center = characterImageViev.center
        activityIndicator.hidesWhenStopped = true
        
        view.addSubview(activityIndicator)
        
        return activityIndicator
    }
}
