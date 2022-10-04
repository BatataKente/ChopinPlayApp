//
//  ViewController.swift
//  Player
//
//  Created by Josicleison on 30/09/22.
//

import UIKit

class View: UIViewController {
    
    private lazy var player = Player(videoContent: self.view)
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
    
    private let tabBar: UITabBar = {
        
        let tabBar = UITabBar()
        tabBar.barTintColor = App.Color.dark_Light
        tabBar.tintColor = .yellow
        
        let item = UITabBarItem()
        item.image = App.Image.play
        
        tabBar.items = [item]
        
        return tabBar
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.addSubviews([tableView, tabBar])
        view.backgroundColor = App.Color.dark_Light
        
        tabBar.delegate = self
        
        tableView.constraint(to: view.safeAreaLayoutGuide,
                             by: [.top, .leading, .trailing])
        tableView.constraint(to: tabBar, by_itemItem: [.bottom: .top])
        
        tabBar.constraint(to: view.safeAreaLayoutGuide, by: [.leading, .trailing, .bottom])
    }
}

extension View: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        player.play(viewModel.makeWay(indexPath))
        tabBarController?.tabBar.items?[0].image = App.Image.stop
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

extension View: UITabBarDelegate {
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        switch item.image {
            
            case App.Image.play:
            
                item.image = App.Image.stop
                player.play(viewModel.makeWay(tableView.indexPathsForSelectedRows?.first))
            
            case App.Image.stop:
            
                item.image = App.Image.play
                player.stop()
            
            default: break
        }
    }
}
