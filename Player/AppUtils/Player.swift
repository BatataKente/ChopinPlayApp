//
//  Type+Paths.swift
//  Player
//
//  Created by Josicleison on 30/09/22.
//

import AVKit

struct Player {
    
    private var player: AVPlayer? = nil
    
    mutating func play(_ url: URL?, view: UIView) {
        
        if let player = player {
            
            self.player = nil
            player.pause()
        }
        else {
            
            guard let url = url else {return}
            player = AVPlayer(url: url)
            
            let layer = AVPlayerLayer(player: player)
            view.layer.addSublayer(layer)
            layer.frame = view.layer.bounds
            layer.videoGravity = .resize
            
            player?.play()
        }
    }
}
