//
//  PlayerViewController.swift
//  STARZPLAY
//
//  Created by Umair on 31/03/2024.
//

import UIKit
import AVKit

class VideoPlayerViewController: UIViewController {
    
    // MARK: - Properties
    
    var videoURL: URL?
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        setupPlayer()
    }
    
    // MARK: - Private Methods
    
    private func setupPlayer() {
        guard let videoURL = videoURL else {
            fatalError("Video URL is not provided")
        }
        
        let playerViewController = createPlayerViewController(with: videoURL)
        addChild(playerViewController)
        view.addSubview(playerViewController.view)
        setupConstraints(for: playerViewController.view)
        playerViewController.didMove(toParent: self)
    }
    
    private func createPlayerViewController(with videoURL: URL) -> AVPlayerViewController {
        let playerViewController = AVPlayerViewController()
        let player = AVPlayer(url: videoURL)
        playerViewController.player = player
        player.play()
        return playerViewController
    }
    
    private func setupConstraints(for playerView: UIView) {
        playerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            playerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            playerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            playerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            playerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
        ])
    }
}
