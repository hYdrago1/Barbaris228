//
//  ViewController.swift
//  Barbaris228
//
//  Created by Ivan Honcharov on 29.11.25.
//

import UIKit
import SpringAnimation
import AVFoundation

final class HomeVC: UIViewController {
    
    @IBOutlet var countrerLabel: UILabel!
    @IBOutlet var messageLabel: SpringLabel!
    
    private let generator = ReactionGeneration.shared
    private let audioManager = AudioManager.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = ""
        countrerLabel.text = ""
        
    }
    
    
    @IBAction func activeButton(_ sender: SpringButton) {
        audioManager.stopSound()
        let reaction = generate()
        messageLabel.text = reaction.text
        generator.counter += 1
        countrerLabel.text = "ты тапнул уже: \(generator.counter) раз"
    }
    
    func generate() -> Reaction {
        let type = ReactionType.allCases.randomElement()!
        
        switch type {
        case .textMessage:
            return Reaction.init(text: generator.textMessages.randomElement())
            
        case .emoji:
            return Reaction.init(text: generator.emojis.randomElement())
            
        case .vibration:
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.impactOccurred()
            return Reaction(text: "Вибро 💦")
            
        case .sound:
            audioManager.playSound(named: generator.soundNames.randomElement() ?? "sound1")
            return Reaction(text: "🎧")
        }
        
    }
    
    


}
