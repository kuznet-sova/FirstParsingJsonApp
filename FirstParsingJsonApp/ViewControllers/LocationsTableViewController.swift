//
//  LocationsTableViewController.swift
//  FirstParsingJsonApp
//
//  Created by Ирина Кузнецова on 21.06.2020.
//  Copyright © 2020 Irina Kuznetsova. All rights reserved.
//

import UIKit

class LocationsTableViewController: UITableViewController {
    
    private let locationsUrl = "https://borderlands.com/en-US/data-media-items/index.json"
    var locations: [Location] = []
    var planetName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 60
        fetchData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        locations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "location", for: indexPath)
        
        let location = locations[indexPath.row]
        cell.textLabel?.text = location.slug
        cell.imageView?.image = UIImage(systemName: "globe")

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow
        else { return }
        guard let locationView = segue.destination as? LocationViewController
            else { return }
        locationView.location = locations[indexPath.row]
    }
    
    func fetchData() {
        guard let url = URL(string: locationsUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let decoder = JSONDecoder()

            do {
                self.locations = try decoder.decode([Location].self, from: data)
                self.filteringLocations()
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func filteringLocations() {
        var locationsList = [Location]()
        
        for index in 0 ..< locations.count {
            let availabilityName = locations[index].tags?.contains(
                planetName
                    .lowercased()
                    .replacingOccurrences(
                        of: " ",
                        with: "-",
                        options: .literal,
                        range: nil)
            )
            
            if locations[index].type == "picture"
                && availabilityName == true {
                locationsList.append (
                    Location (
                        slug: locations[index].slug,
                        type: locations[index].type,
                        tags: locations[index].tags,
                        imageURL: locations[index].imageURL
                    )
                )
            }
        }
        self.locations = locationsList
    }

    @IBAction func BackButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
