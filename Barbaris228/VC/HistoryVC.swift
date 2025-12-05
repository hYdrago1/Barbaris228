//  HistoryVC.swift
//  Barbaris228
//
//  Created by Ivan Honcharov on 04.12.25.
//

import UIKit

import UIKit

class HistoryVC: UITableViewController {
    
    let reaction = ReactionGeneration.shared
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        ReactionSection.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = ReactionSection(rawValue: section)!
        return reaction.items(in: sectionType).count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        ReactionSection(rawValue: section)?.title
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as! HistoryCell
        
        let sectionType = ReactionSection(rawValue: indexPath.section)!
        let item = reaction.items(in: sectionType)[indexPath.row]
        
        let isSeen = ReactionGeneration.shared.isSeen(item)
        cell.configure(text: item, isSeen: isSeen)
        
        return cell
    }
}
