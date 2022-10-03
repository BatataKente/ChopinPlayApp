//
//  ViewController.swift
//  Player
//
//  Created by Josicleison on 30/09/22.
//

import UIKit

class View: UIViewController {
    
    private lazy var viewModel = ViewModel(delegate: self)
    private lazy var player = Player(videoContent: self.view)
    
    private lazy var stack: UIStackView = {
        
        let stack = UIStackView()
        
        for archive in viewModel.archives {
            
            stack.addArrangedSubview(viewModel.createButton(archive))
        }
        stack.distribution = .fillEqually
        stack.axis = .vertical
        
        return stack
    }()

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

extension View: ViewModelDelegate {
    
    func play(_ archive: (file: String, type: String)) {
        
        self.player.play(URL(fileURLWithPath: Bundle.main.path(forResource: archive.file,
                                                               ofType: archive.type) ?? ""))
    }
    
    func stop() {
        
        self.player.stop()
    }
}
