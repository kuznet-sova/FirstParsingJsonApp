//
//  PlanetViewController.swift
//  FirstParsingJsonApp
//
//  Created by Ирина Кузнецова on 20.06.2020.
//  Copyright © 2020 Irina Kuznetsova. All rights reserved.
//

import UIKit

class PlanetViewController: UIViewController {

    @IBOutlet var planetImageViev: UIImageView!
    @IBOutlet var planetNameLabel: UILabel!
    @IBOutlet var planetDescriptionLabel: UILabel!
    
    var planet: Planet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPlanetImage()
        planetNameLabel.text = planet.namePlanet
        planetDescriptionLabel.text = planet.descriptionPlanet
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationController = segue.destination as? UINavigationController,
            let locationsView = navigationController.topViewController as? LocationsTableViewController
            else { return }
        locationsView.planetName = planetNameLabel.text
    }
      
    private func getPlanetImage() {
        guard let imageUrl = URL(string: planet.imageUrl) else { return }
        
        URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.planetImageViev.image = image
                }
            }
        }.resume()
    }
}
