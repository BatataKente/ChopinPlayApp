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
    
    private let tabBar = PlayTab()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.addSubviews([tableView, tabBar])
        view.backgroundColor = App.Color.dark_Light
        
        //MARK: - player suit the view
        viewModel.player.videoContent = view
        
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
}

extension View: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        viewModel.player.stop()
        tabBar.items?[1].image = App.Image.pause
        viewModel.player.chose(indexPath.row)
        viewModel.player.play()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        viewModel.player.playList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath) as? Cell
        cell?.setup(App.Image.note, text: viewModel.player.playList[indexPath.row].file)
        
        return cell ?? UITableViewCell()
    }
}

extension View: UITabBarDelegate {
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        viewModel.selectMusic(tabBar, item, tableView)
    }
}
