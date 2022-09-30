//
//  ViewController.swift
//  Player
//
//  Created by Josicleison on 30/09/22.
//

import UIKit
import AVKit

class View: UIViewController {
    
    private lazy var player = Player()
    
    private struct Archives {
        
        static let chopin = (file: "Chopin - Nocturne in F minor Op 55 No 1", type: "mp3")
        static let berserk = (file: "Berserk - Episódio 1", type: "mp4")
    }
    
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

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .red
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        button.addTarget(nil, action: #selector(buttonTarget), for: .touchUpInside)
    }
    
    @objc private func buttonTarget() {
       
        player.play(URL(fileURLWithPath: Bundle.main.path(forResource: Archives.berserk.file,
                                                          ofType: Archives.berserk.type) ?? ""), in: view)
    }
}

