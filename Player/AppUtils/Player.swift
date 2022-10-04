//
//  Type+Paths.swift
//  Player
//
//  Created by Josicleison on 30/09/22.
//

import AVKit

class Player: UIStackView {
    
    private var player: AVPlayer? = nil
    private var playerLayer: AVPlayerLayer? = nil
    var view: UIView? = nil
    
    let button: UIButton = {
        
        let button = UIButton()
        button.setImage(App.Image.play, for: .normal)
        button.setImage(App.Image.stop, for: .selected)
        button.changesSelectionAsPrimaryAction = true
        button.tintColor = .yellow
        
        button.imageView?.constraint(to: button, by: [.centerY, .centerX])
        button.imageView?.constraint(to: button, by: [.height], multiplier: 0.8)
        button.imageView?.constraint(to: button.imageView, by_itemItem: [.height: .width])
        
        return button
    }()
    
    init(videoContent: UIView? = nil) {
        
        super.init(frame: .zero)
        
        self.view = videoContent
        self.addArrangedSubview(button)
        
        button.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/20).isActive = true
        
        button.addTarget(self, action: #selector(buttonTarget), for: .touchUpOutside)
    }
    
    required init(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    func play(_ url: URL?) {
        
        player?.pause()
        player = nil
        self.playerLayer?.removeFromSuperlayer()
        
        if player != nil {return}
        
        guard let url = url else {return}
        player = AVPlayer(url: url)
        
        if let view = view {
            
            playerLayer = AVPlayerLayer(player: player)
            view.layer.addSublayer(playerLayer ?? CALayer())
            playerLayer?.frame = view.layer.bounds
            playerLayer?.videoGravity = .resizeAspect
        }
        
        player?.play()
    }
    
    func stop() {
        
        player?.pause()
        player = nil
        self.playerLayer?.removeFromSuperlayer()
    }
    
    @objc private func buttonTarget(_ sender: UIButton) {
        
        if !sender.isSelected {
            
            player?.play(); return
        }
        player?.pause()
    }
}
