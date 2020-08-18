//
//  ViewController.swift
//  DisableTransportBarDemo
//
//  Created by Juan Carlos Ospina Gonzalez on 18/08/2020.
//  Copyright © 2020 The Widgest Company BV. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    /// A sample video URL
    ///
    /// **Big Buck Bunny (2008)**
    ///
    /// A recently awoken enormous and utterly adorable fluffy rabbit is heartlessly harassed by a flying squirrel's gang of rodents who are determined to squash his happiness.
    private let videoURL = URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!
    
    lazy private var avPlayerViewController: AVPlayerViewController = {
        AVPlayerViewController()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Layout stuff
        setupSubviews()
        
        // Setup playback
        let item = AVPlayerItem(url: videoURL)
        let player = AVPlayer(playerItem: item)
        avPlayerViewController.player = player
        player.play()
        
        // hides the transport bar
        avPlayerViewController.playbackControlsIncludeTransportBar = false
        // sets behaviour to disable skipping
        avPlayerViewController.skippingBehavior = .skipItem
        // optionally set as delegate to skip to next/previous item
        avPlayerViewController.delegate = self
    }
    
    private func setupSubviews() {
        addChild(avPlayerViewController)
        view.addSubview(avPlayerViewController.view)
        avPlayerViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avPlayerViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            avPlayerViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            avPlayerViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            avPlayerViewController.view.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        avPlayerViewController.didMove(toParent: self)
    }
}

extension ViewController: AVPlayerViewControllerDelegate {
    func skipToNextItem(for playerViewController: AVPlayerViewController) {
        print("skip to next")
        // do your thing
    }
    func skipToPreviousItem(for playerViewController: AVPlayerViewController) {
        print("skip to previous")
        // do your thing
    }
}

