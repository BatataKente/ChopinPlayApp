//
//  ViewModel.swift
//  Player
//
//  Created by Josicleison on 30/09/22.
//

import UIKit

protocol ViewModelDelegate {
    
    func play(_ archive: (file: String, type: String))
    func stop()
}

class ViewModel {
    
    let archives = [App.Videos.berserk,
                    App.Musics.chopin,
                    App.Musics.dio]
    
    private var delegate: ViewModelDelegate
    
    init(delegate: ViewModelDelegate) {
        
        self.delegate = delegate
    }
    
    func createButton(_ archive: (file: String, type: String)) -> UIButton {
        
        let button = UIButton()
        button.setImage(UIImage(systemName: "music.note.list"), for: .normal)
        button.contentMode = .scaleAspectFit
        
        let action = UIAction{_ in
            
            if let stack = button.superview as? UIStackView {
                
                button.tintColor = .yellow
                button.isUserInteractionEnabled = false
                self.delegate.play(archive)
                
                for arrangedSubview in stack.arrangedSubviews {

                    if arrangedSubview == button {continue}
                    arrangedSubview.tintColor = .systemBlue
                    arrangedSubview.isUserInteractionEnabled = true
                }
            }
        }
        
        button.addAction(action, for: .touchUpInside)
        
        button.imageView?.translatesAutoresizingMaskIntoConstraints = false
        
        button.imageView?.leadingAnchor.constraint(equalTo: button.leadingAnchor).isActive = true
        button.imageView?.trailingAnchor.constraint(equalTo: button.trailingAnchor).isActive = true
        button.imageView?.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
        button.imageView?.heightAnchor.constraint(equalTo: button.imageView?.widthAnchor ?? NSLayoutDimension()).isActive = true
        
        return button
    }
}
