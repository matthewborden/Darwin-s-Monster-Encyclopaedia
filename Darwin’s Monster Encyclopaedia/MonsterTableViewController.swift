//
//  MonsterTableViewController.swift
//  Darwin’s Monster Encyclopaedia
//
//  Created by Matthew Borden on 13/4/17.
//  Copyright © 2017 Matthew Borden. All rights reserved.
//

import UIKit

class MonsterTableViewController: UITableViewController {
    // Create an array to store the monsters
    var allMonsters = [Monster]()
    // Create an array to store the monsters in the current search
    var filteredMonsters = [Monster]()
    // Create the search controller that will filter the list.
    let searchController = UISearchController(searchResultsController: nil)

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // Setup the search controller to use this list to display the filtered results.
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        // Create a monster to be in the list.
        // TODO: Delete this.
        let mike = Monster(name: "Jimmt the Giant", age: 30, species: "MEGAWONDERER", attackPower: 20, health: 38383)
        allMonsters.append(mike)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Attach the search controller to the table.
        tableView.tableHeaderView = searchController.searchBar
    }
    
    func filterContentForSearchText(_ searchText: String) {
        // Filter the results by the name of the monster.
        filteredMonsters = allMonsters.filter({( m : Monster) -> Bool in
            return (m.name?.lowercased().contains(searchText.lowercased()))!
        })
        // Load the data with the search results.
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            // Return the filtered results count when there is a search in progress.
            return filteredMonsters.count
        }
        // Otherwise return all the monsters in the list.
        return allMonsters.count
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MonsterTableCell", for: indexPath) as! MonsterTableCell
        let m: Monster = self.allMonsters[indexPath.row]
        // Set the labels with the name and species of the monster for that cell.
        cell.nameLabel.text = m.name
        cell.speciesLabel.text = m.species
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Prepare the segue for sending by setting the selected monster to the `monster` instance variable of the view monsters screen.
        super.prepare(for: segue, sender: sender)
            switch(segue.identifier ?? "") {
                case "MonsterListToViewMonster":
                    guard let monsterViewController = segue.destination as? ViewMonsterController
                    else {
                        fatalError("Unexpected destination: \(segue.destination)")
                    }
                
                    guard let selectedMonsterCell = sender as? MonsterTableCell else {
                        fatalError("Unexpected sender: \(sender)")
                    }
                    
                    guard let indexPath = tableView.indexPath(for: selectedMonsterCell) else {
                        fatalError("The selected cell is not being displayed by the table")
                    }
                    
                    let selectedMonster = allMonsters[indexPath.row]
                    monsterViewController.monster = selectedMonster
                default:
                    return
            }
    }
}

extension MonsterTableViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
