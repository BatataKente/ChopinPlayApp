//
//  ViewController.swift
//  Player
//
//  Created by Josicleison on 30/09/22.
//

import UIKit

class View: UIViewController {
    
    private let viewModel = ViewModel()
    private let cell = "Cell"

    private lazy var tableView: UITableView = {
        
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = view.frame.height/15
        tableView.backgroundColor = App.Color.dark_Light
        
        tableView.register(Cell.self, forCellReuseIdentifier: cell)
        
        return tableView
    }()
    
    private lazy var player: Player = {
        
        let player = Player(videoContent: self.view)
        player.backgroundColor = App.Color.dark_Light
        
        return player
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.addSubviews([tableView, player])
        view.backgroundColor = App.Color.dark_Light
        
        tableView.constraint(to: view.safeAreaLayoutGuide,
                             by: [.top, .leading, .trailing])
        tableView.constraint(to: player, by_itemItem: [.bottom: .top])
        
        player.constraint(to: view.safeAreaLayoutGuide, by: [.leading, .trailing, .bottom])
    }
}

extension View: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        player.play(viewModel.makeWay(indexPath))
        player.button.isSelected = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        viewModel.archives.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath) as? Cell
        cell?.setup(App.Image.note, text: viewModel.archives[indexPath.row].file)
        
        return cell ?? UITableViewCell()
    }
}
