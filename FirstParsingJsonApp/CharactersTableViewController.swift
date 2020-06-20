//
//  CharactersTableViewController.swift
//  FirstParsingJsonApp
//
//  Created by Ирина Кузнецова on 20.06.2020.
//  Copyright © 2020 Irina Kuznetsova. All rights reserved.
//

import UIKit

class CharactersTableViewController: UITableViewController {
    
    var character = Character.getCharacter()

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return character.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "character", for: indexPath)
        
        cell.textLabel?.text = character[indexPath.row].nameCharacter
        cell.detailTextLabel?.text = character[indexPath.row].classCharacter
        cell.imageView?.image = UIImage(named: character[indexPath.row].nameCharacter)

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow
            else { return }
        guard let characterView = segue.destination as? CharacterViewController
            else { return }
        characterView.character = character[indexPath.row]
    }

    @IBAction func BackButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
