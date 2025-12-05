//
//  HistoryCell.swift
//  Barbaris228
//
//  Created by Ivan Honcharov on 05.12.25.
//



import UIKit

final class HistoryCell: UITableViewCell {

    private let blurView: UIVisualEffectView = {
        let blur = UIBlurEffect(style: .light)
        let view = UIVisualEffectView(effect: blur)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let lockIcon: UIImageView = {
        let icon = UIImageView(image: UIImage(systemName: "lock.fill"))
        icon.tintColor = .black.withAlphaComponent(0.6)
        icon.contentMode = .scaleAspectFit
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()

    private let label: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .systemFont(ofSize: 17)
        return lbl
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    private func setupViews() {
        contentView.addSubview(label)
        contentView.addSubview(blurView)
        contentView.addSubview(lockIcon)

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

            blurView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            blurView.topAnchor.constraint(equalTo: contentView.topAnchor),
            blurView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            lockIcon.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            lockIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            lockIcon.widthAnchor.constraint(equalToConstant: 24),
            lockIcon.heightAnchor.constraint(equalToConstant: 24)
        ])
    }

    func configure(text: String, isSeen: Bool) {
        label.text = text
        if isSeen {
            // убрать размытие с анимацией
            UIView.animate(withDuration: 0.4) {
                self.blurView.alpha = 0
            } completion: { _ in
                self.blurView.isHidden = true
                self.lockIcon.isHidden = true
                self.blurView.alpha = 1
            }
        } else {
            blurView.isHidden = false
            lockIcon.isHidden = false
        }
    }
}
