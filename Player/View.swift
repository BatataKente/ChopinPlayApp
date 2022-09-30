//
//  ViewController.swift
//  Player
//
//  Created by Josicleison on 30/09/22.
//

import UIKit
import AVKit

class View: UIViewController {
    
    private lazy var stack: UIStackView = {
        
        var player = Player()
        
        let createButton = {(archive: (file: String, type: String)) -> UIButton in
            
            
            let button = UIButton()
            button.setImage(UIImage(systemName: "music.note.list"), for: .normal)
            button.contentMode = .scaleAspectFit
            
            let action = UIAction{_ in
                
                player.play(URL(fileURLWithPath: Bundle.main.path(forResource: archive.file,
                                                                  ofType: archive.type) ?? ""), in: self.view)
            }
            
            button.addAction(action, for: .touchUpInside)
            
            button.imageView?.translatesAutoresizingMaskIntoConstraints = false
            
            button.imageView?.leadingAnchor.constraint(equalTo: button.leadingAnchor).isActive = true
            button.imageView?.trailingAnchor.constraint(equalTo: button.trailingAnchor).isActive = true
            button.imageView?.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
            button.imageView?.heightAnchor.constraint(equalTo: button.imageView?.widthAnchor ?? NSLayoutDimension()).isActive = true
            
            return button
        }
        
        
        let stack = UIStackView(arrangedSubviews: [createButton(App.Videos.berserk),
                                                   createButton(App.Musics.chopin),
                                                   createButton(App.Musics.dio)])
        stack.distribution = .fillEqually
        stack.axis = .vertical
        
        return stack
    }()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .red
        view.addSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

