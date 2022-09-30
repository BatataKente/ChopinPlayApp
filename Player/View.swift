//
//  ViewController.swift
//  Player
//
//  Created by Josicleison on 30/09/22.
//

import UIKit
import AVKit

class View: UIViewController {
    
    private let viewModel = ViewModel()
    
    private lazy var stack = viewModel.createStack(archives: [App.Videos.berserk,
                                                              App.Musics.chopin,
                                                              App.Musics.dio],
                                                   at: view)

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.addSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

