//
//  AudioManager.swift
//  Barbaris228
//
//  Created by Ivan Honcharov on 04.12.25.
//

import AVFoundation

class AudioManager {
    static let shared = AudioManager()
    private var audioPlayer: AVAudioPlayer?

    private init() {}

    func playSound(named name: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "m4a", subdirectory: "Sounds") else {
            print("файл не найден")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("Ошибка воспроизведения: \(error)")
        }
    }

    func stopSound() {
        audioPlayer?.stop()
    }
}
