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
    
    @IBOutlet var counterLabel: UILabel!
    @IBOutlet var messageLabel: SpringLabel!
    @IBOutlet var messageLabelView: UIView!
    @IBOutlet var counterLabelView: UIView!
    
    private let generator = ReactionGeneration.shared
    private let audioManager = AudioManager.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage("back")

        messageLabelView.layer.cornerRadius = 20
        counterLabelView.layer.cornerRadius = 15
        counterLabelView.alpha = 0.7
        
    }
    
    
    @IBAction func activeButton(_ sender: SpringButton) {
        audioManager.stopSound()
        let reaction = generate()
        generator.markAsSeen(reaction)
        messageLabel.text = reaction.text
        generator.counter += 1
        counterLabel.text = "ты тапнул уже: \(generator.counter) раз"
    }
    
    func generate() -> Reaction {
        let type = ReactionType.allCases.randomElement()!
        
        switch type {

        case .textMessage:
            let message = generator.textMessages.randomElement()!
            return Reaction(type: .textMessage, text: message, value: message)

        case .emoji:
            let emoji = generator.emojis.randomElement()!
            return Reaction(type: .emoji, text: emoji, value: emoji)

        case .vibration:
            let vibration = UIImpactFeedbackGenerator(style: .rigid)
            vibration.impactOccurred()
            return Reaction(type: .vibration, text: "Вибрация 🫨", value: "vibration")

        case .sound:
            let soundName = generator.soundNames.randomElement()!
            audioManager.playSound(named: soundName)
            return Reaction(type: .sound, text: "Звук 🔉", value: soundName)
        }
    }
    


}
extension HomeVC {
    func setBackgroundImage(_ imageName: String) {
        let backgroundImageView = UIImageView(frame: view.bounds)
        backgroundImageView.image = UIImage(named: imageName)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        view.insertSubview(backgroundImageView, at: 0)
    }
}
