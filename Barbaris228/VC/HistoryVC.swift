//  HistoryVC.swift
//  Barbaris228
//
//  Created by Ivan Honcharov on 04.12.25.
//

import UIKit

class HistoryVC: UITableViewController {
    
    let reaction = ReactionGeneration.shared
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return ReactionSection.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionType = ReactionSection(rawValue: section) else { return 0 }
        return reaction.items(in: sectionType).count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        ReactionSection(rawValue: section)?.title
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let sectionType = ReactionSection(rawValue: indexPath.section)!
        let item = reaction.items(in: sectionType)[indexPath.row]
        
        cell.textLabel?.text = item
        
        if !ReactionGeneration.shared.isSeen(item) {
            let blurEffect = UIBlurEffect(style: .light)
            let blurView = UIVisualEffectView(effect: blurEffect)
            blurView.frame = cell.contentView.bounds
            blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            cell.contentView.addSubview(blurView)
            cell.textLabel?.textColor = .black
        } else {
            
            for subview in cell.contentView.subviews where subview is UIVisualEffectView {
                subview.removeFromSuperview()
            }
        }
        
        return cell
    }
    
    
}

    
