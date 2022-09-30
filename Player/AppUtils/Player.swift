//
//  Type+Paths.swift
//  Player
//
//  Created by Josicleison on 30/09/22.
//

import AVKit

struct Player {
    
    private var player: AVPlayer? = nil
    private var layer: AVPlayerLayer? = nil
    
    mutating func play(_ url: URL?, in view: UIView? = nil) {
        
        if player != nil {return}
        
        guard let url = url else {return}
        player = AVPlayer(url: url)
        
        if let view = view {
            
            layer = AVPlayerLayer(player: player)
            view.layer.addSublayer(layer ?? CALayer())
            layer?.frame = view.layer.bounds
            layer?.videoGravity = .resizeAspect
        }
        
        player?.play()
    }
    
    mutating func stop() {
        
        player?.pause()
        player = nil
        self.layer?.removeFromSuperlayer()
    }
}
