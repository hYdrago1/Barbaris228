//
//  ReactionGenerator .swift
//  Barbaris228
//
//  Created by Ivan Honcharov on 29.11.25.
//

import AVFoundation
import UIKit

class ReactionGeneration {
    
    private let textMessages = [
        "оу щит",
        "злоебучий поросёнок",
        "21",
        "баба яга",
        "тапай дальше хомячка",
        "крышечка сегодня вспотела",
        "уважение",
        "крым не наш",
        "раз два - двадцать два",
        "вы петагорасы",
        "живи счастливо",
        "любишь с горочки кататься - иди нахуй",
        "продолжай",
        "через 2 тапа ахуеешь",
        "всё ещё впереди",
        "всё ещё тапаешь?",
        "не останавливайся!",
        "иди отдохни",
    ]

    private let emojis = [
        "💩",
        "🙇🏾‍♀️",
        "🌍",
        "🈲",
        "🧑‍🦼",
        "💃",
        "🕴🏻",
        "🧕🏻",
        "🍰",
        "🍻",
        "🧊",
        "🥄",
        "🤺",
        "🍄",
        "🌿",
        "💑",
        "🇬🇪",
        "⬛️",
        "🔴🟡🟢",
        "👁️‍🗨️",
        "💲",
        "✝️"
    ]
    
    private var player: AVAudioPlayer?
    
    func generate() -> Reaction {
        let type = ReactionType.allCases.randomElement()!
        
        switch type {
        case .textMessage:
            return Reaction.init(text: textMessages.randomElement())
            
        case .emoji:
            return Reaction.init(text: emojis.randomElement())
            
        case .vibration:
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.impactOccurred()
            return Reaction(text: "Вибро 💦")
            
        case .sound:
            playRandomSound()
            return Reaction(text: "Звук 🎧")
            
       
        }
        
    }
    
    private func playRandomSound() {
        guard let url = Bundle.main.url(forResource: "click", withExtension: "mp3") else { return }
        player = try? AVAudioPlayer(contentsOf: url)
        player?.play()
    }
    
}
