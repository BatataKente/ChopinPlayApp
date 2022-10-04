//
//  Type+Paths.swift
//  Player
//
//  Created by Josicleison on 30/09/22.
//

import AVKit

class Player {
    
    private var player: AVPlayer? = nil
    private var playerLayer: AVPlayerLayer? = nil
    var videoContent: UIView? = nil
    
    var playList: [Archive] = []
    
    init(videoContent: UIView? = nil) {
        
        self.videoContent = videoContent
    }
    
    private func makeWay(forResource: String,
                         ofType: String) -> URL {
        
        return URL(fileURLWithPath: Bundle.main.path(forResource: forResource,
                                                     ofType: ofType) ?? "")
    }
    
    func chose(_ playListPath: Int) {
        
        player = AVPlayer(url: makeWay(forResource: playList[playListPath].file,
                                       ofType: playList[playListPath].type))
    }
    
    func play() {
        
        if let videoContent = videoContent {
            
            playerLayer = AVPlayerLayer(player: player)
            videoContent.layer.addSublayer(playerLayer ?? CALayer())
            playerLayer?.frame = videoContent.layer.bounds
            playerLayer?.videoGravity = .resizeAspect
        }
        
        player?.play()
    }
    
    func stop() {

        player?.pause()
        player = nil
        self.playerLayer?.removeFromSuperlayer()
    }
    
    func pause() {

        player?.pause()
    }
}
