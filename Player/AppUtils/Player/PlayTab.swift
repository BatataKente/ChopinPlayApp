//
//  PlayTab.swift
//  Player
//
//  Created by Josicleison on 04/10/22.
//

import UIKit

class PlayTab: UITabBar, UITabBarDelegate {
    
    init(items: [UITabBarItem] = [UITabBarItem(title: nil,
                                               image: App.Image.previous,
                                               selectedImage: nil),
                                  UITabBarItem(title: nil,
                                               image: App.Image.play,
                                               selectedImage: nil),
                                  UITabBarItem(title: nil,
                                               image: App.Image.next,
                                               selectedImage: nil)]) {
        
        super.init(frame: .zero)
        
        self.tintColor = .yellow
        self.unselectedItemTintColor = .yellow
        
        self.barTintColor = App.Color.dark_Light
        
        self.items = items
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}
