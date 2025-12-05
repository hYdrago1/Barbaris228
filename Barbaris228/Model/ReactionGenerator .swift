//
//  ReactionGenerator .swift
//  Barbaris228
//
//  Created by Ivan Honcharov on 29.11.25.
//

import Foundation
import UIKit

enum ReactionType: CaseIterable {
    case textMessage
    case emoji
    case vibration
    case sound
}

enum ReactionSection: Int, CaseIterable {
    case textMessages
    case emojis
    case sounds

    var title: String {
        switch self {
        case .textMessages: return "Текстовые сообщения"
        case .emojis: return "Эмодзи"
        case .sounds: return "Звуки"
        }
    }
}

struct Reaction {
    let type: ReactionType
    let text: String
    let value: String?
}

final class ReactionGeneration {

    static let shared = ReactionGeneration()

    let textMessages = [
        "оу щит",
        "поросёнок",
        "21",
        "баба яга",
        "тапай дальше хомячка",
        "крышечка сегодня вспотела",
        "уважение",
        "крым не наш",
        "раз два - двадцать два",
        "вы петагорасы",
        "живи счастливо",
        "любишь с горочки кататься - люби маму",
        "продолжай",
        "через 2 тапа удивишься",
        "всё ещё впереди",
        "всё ещё тапаешь?",
        "не останавливайся!",
        "иди отдохни",
        "как прошел день чемпион?",
        "остановись чувак",
    ]

    let emojis = [
        "💩","🙇🏾‍♀️","🌍","🈲","🧑‍🦼","💃","🕴🏻","🧕🏻","🍰",
        "🍻","🧊","🥄","🤺","🍄","🌿","💑","🇬🇪","⬛️","🔴🟡🟢","👁️‍🗨️","💲","✝️"
    ]

    let soundNames = [
        "sound1","sound2","sound3","sound4","sound5","sound6",
        "sound7","sound8","sound9","sound10","sound11","sound12","sound13"
    ]

    var counter = 0

    private(set) var seenItems: Set<String> = []

    // Запись встреченного элемента
    func markAsSeen(_ reaction: Reaction) {
        if let key = reaction.value {
            seenItems.insert(key)
        }
    }

    func isSeen(_ item: String) -> Bool {
        seenItems.contains(item)
    }

    func items(in section: ReactionSection) -> [String] {
        switch section {
        case .textMessages: return textMessages
        case .emojis: return emojis
        case .sounds: return soundNames
        }
    }
}
