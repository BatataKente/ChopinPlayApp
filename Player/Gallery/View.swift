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

    private let tableView: UITableView = {
        
        let tableView = UITableView()
        tableView.backgroundColor = App.Color.dark_Light
        
        return tableView
    }()
    
    private let player: Player = {
        
        let player = Player()
        
        return player
    }()
    
    private let tabBar = PlayTab()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.addSubviews([tableView, tabBar])
        view.backgroundColor = App.Color.dark_Light
        
        //MARK: - player suit the view
        player.playList = viewModel.archives
        player.videoContent = view
        
        //MARK: - tabBar suit the view
        tabBar.delegate = self
        
        //MARK: - tableView suit the view
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = view.frame.height/15
        tableView.register(Cell.self, forCellReuseIdentifier: cell)
        
        //MARK: - tableView suit the view
        tableView.constraint(to: view.safeAreaLayoutGuide,
                             by: [.top, .leading, .trailing])
        tableView.constraint(to: tabBar,
                             by_itemItem: [.bottom: .top])
        tabBar.constraint(to: view.safeAreaLayoutGuide,
                          by: [.leading, .trailing, .bottom])
    }
    
    private func selectTableViewCell(_ row: Int) {
        
        tableView.selectRow(at: IndexPath(row: row,
                                          section: tableView.indexPathForSelectedRow?.section ?? 0),
                            animated: false,
                            scrollPosition: .none)
    }
}

extension View: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        player.stop()
        tabBar.items?[1].image = App.Image.pause
        player.chose(indexPath.row)
        player.play()
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
            
            case App.Image.previous:
            
                guard let row = tableView.indexPathForSelectedRow?.row else {return}
                if row != 0 {
                    
                    tabBar.items?[1].image = App.Image.pause
                    
                    player.stop()
                    selectTableViewCell(row - 1)
                    player.chose(row - 1)
                    player.play()
                }
            
            case App.Image.play:
            
                player.play()
                item.image = App.Image.pause
            
            case App.Image.pause:
            
                player.pause()
                item.image = App.Image.play

            default:
            
                guard let row = tableView.indexPathForSelectedRow?.row else {return}
                if row != (viewModel.archives.count - 1) {
                    
                    tabBar.items?[1].image = App.Image.pause
                    
                    player.stop()
                    selectTableViewCell(row + 1)
                    player.chose(row + 1)
                    player.play()
                }
        }
    }
}
