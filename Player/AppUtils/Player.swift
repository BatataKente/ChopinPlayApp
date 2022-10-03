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
    private var view: UIView? = nil
    
    init(videoContent: UIView? = nil) {
        
        self.view = videoContent
    }
    
    mutating func play(_ url: URL?) {
        
        player?.pause()
        player = nil
        self.layer?.removeFromSuperlayer()
        
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
