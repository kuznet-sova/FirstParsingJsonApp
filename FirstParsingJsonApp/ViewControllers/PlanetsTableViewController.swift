//
//  PlanetsTableViewController.swift
//  FirstParsingJsonApp
//
//  Created by Ирина Кузнецова on 20.06.2020.
//  Copyright © 2020 Irina Kuznetsova. All rights reserved.
//

import UIKit

class PlanetsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 60
    }

    var planet = Planet.getPlanet()

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planet.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "planet", for: indexPath)
        
        cell.textLabel?.text = planet[indexPath.row].namePlanet
        cell.imageView?.image = UIImage(named: planet[indexPath.row].namePlanet)

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow
            else { return }
        guard let planetView = segue.destination as? PlanetViewController
            else { return }
        planetView.planet = planet[indexPath.row]
    }

    @IBAction func BackButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
