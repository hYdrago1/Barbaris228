//
//  ViewController.swift
//  Barbaris228
//
//  Created by Ivan Honcharov on 29.11.25.
//

import UIKit
import SpringAnimation

final class HomeVC: UIViewController {
    
    @IBOutlet var countrerLabel: UILabel!
    @IBOutlet var messageLabel: SpringLabel!
    
    private let generator = ReactionGeneration()
    private var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = ""
        countrerLabel.text = ""
        
    }
    
    
    @IBAction func activeButton(_ sender: SpringButton) {
        let reaction = generator.generate()
        messageLabel.text = reaction.text
        counter += 1
        countrerLabel.text = "ты тапнул уже: \(counter) раз"
    }
}
