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
    
    lazy var button: UIButton = {
        
        let button = UIButton(frame: .zero, primaryAction: buttonAction())
        button.setImage(App.Image.play, for: .normal)
        button.setImage(App.Image.stop, for: .selected)
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
    }
    
    required init(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buttonAction() -> UIAction {
        
        return UIAction{_ in
            
            self.button.isSelected = !self.button.isSelected
            
            if !self.button.isSelected {
                
                self.stop(); return
            }
            self.play()
        }
    }
    
    func chose(_ url: URL?) {
        
        self.button.isSelected = true
        
        guard let url = url else {return}
        player = AVPlayer(url: url)
    }
    
    func play() {
        
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
}
