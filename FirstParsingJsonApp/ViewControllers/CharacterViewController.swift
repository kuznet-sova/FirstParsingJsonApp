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
    
    var character: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCharacterImage()
        characterNameLabel.text = character.nameCharacter
        characterClassLabel.text = "Class: \(character.classCharacter)"
        characterDescriptionLabel.text = character.descriptionCharacter
    }
    
    private func getCharacterImage() {
        guard let imageUrl = URL(string: character.imageUrl) else { return }
        
        URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.characterImageViev.image = image
                }
            }
        }.resume()
    }
}
