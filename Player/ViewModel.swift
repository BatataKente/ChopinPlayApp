//
//  ViewModel.swift
//  Player
//
//  Created by Josicleison on 30/09/22.
//

import UIKit

class ViewModel {
    
    func createStack(archives: [(file: String, type: String)],
                     at view: UIView) -> UIStackView {
        
        var player = Player()
        
        let stack = UIStackView()
        
        let createButton = {(archive: (file: String, type: String)) -> UIButton in
            
            let button = UIButton()
            button.setImage(UIImage(systemName: "music.note.list"), for: .normal)
            button.contentMode = .scaleAspectFit
            
            let action = UIAction{_ in
                
                button.isSelected = !button.isSelected
                if button.isSelected {
                    
                    player.play(URL(fileURLWithPath: Bundle.main.path(forResource: archive.file,
                                                                      ofType: archive.type) ?? ""), in: view)
                    button.tintColor = .yellow
                    
                    for otherButton in stack.arrangedSubviews {

                        if otherButton == button {continue}
                        otherButton.isUserInteractionEnabled = false
                    }
                }
                else {
                    
                    player.stop()
                    button.tintColor = .systemBlue
                    
                    for otherButton in stack.arrangedSubviews {

                        if otherButton == button {continue}
                        otherButton.isUserInteractionEnabled = true
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
        
        for archive in archives {
            
            stack.addArrangedSubview(createButton(archive))
        }
        stack.distribution = .fillEqually
        stack.axis = .vertical
        
        return stack
    }
}
