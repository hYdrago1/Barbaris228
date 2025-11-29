//
//  Reaction.swift
//  Barbaris228
//
//  Created by Ivan Honcharov on 29.11.25.
//

import Foundation

enum ReactionType: CaseIterable {
    case textMessage
    case emoji
    case vibration
    case sound
}

struct Reaction {
    let text: String?
}
