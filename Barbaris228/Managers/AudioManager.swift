//
//  AudioManager.swift
//  Barbaris228
//
//  Created by Ivan Honcharov on 04.12.25.
//

import AVFoundation

final class AudioManager {

    static let shared = AudioManager()
    private var player: AVAudioPlayer?

    func playSound(named name: String) {
        guard let url = Bundle.main.url(forResource: "Sounds", withExtension: "m4a") else { return }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Ошибка воспроизведения звука: \(error)")
        }
    }

    func stopSound() {
        player?.stop()
        player = nil
    }
}
