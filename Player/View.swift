//
//  ViewController.swift
//  Player
//
//  Created by Josicleison on 30/09/22.
//

import UIKit
import AVFoundation

class View: UIViewController {
    
    private let button: UIButton = {
        
        let button = UIButton()
        button.setImage(UIImage(systemName: "music.note.list"), for: .normal)
        button.contentMode = .scaleAspectFit
        
        button.imageView?.translatesAutoresizingMaskIntoConstraints = false
        
        button.imageView?.leadingAnchor.constraint(equalTo: button.leadingAnchor).isActive = true
        button.imageView?.trailingAnchor.constraint(equalTo: button.trailingAnchor).isActive = true
        button.imageView?.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
        button.imageView?.heightAnchor.constraint(equalTo: button.imageView?.widthAnchor ?? NSLayoutDimension()).isActive = true
        
        return button
    }()
    
    private var player: AVAudioPlayer? = nil
    private var currentTime: Double = 0.0

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        button.addTarget(nil, action: #selector(buttonTarget), for: .touchUpInside)
    }
    
    @objc private func buttonTarget() {
        
        if let player = player, player.isPlaying {
            
            player.stop()
        }
        else {
            
            let url = Bundle.main.path(forResource: "Chopin - Nocturne in F minor Op 55 No 1", ofType: "mp3")
            
            do {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                guard let url = url else {return}
                
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: url))
                
                guard let player = player else {return}
                
                player.play()
            }
            catch {
                
                print("algo errado nao esta certo")
            }
        }
    }
}

