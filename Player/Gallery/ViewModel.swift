//
//  ViewModel.swift
//  Player
//
//  Created by Josicleison on 30/09/22.
//

import UIKit

class ViewModel {
    
    let player: Player = Player(playList: [App.Video.berserk,
                                           App.Music.chopin,
                                           App.Music.dio,
                                           App.Video.berserk,
                                           App.Music.chopin,
                                           App.Music.dio,
                                           App.Video.berserk,
                                           App.Music.chopin,
                                           App.Music.dio,
                                           App.Video.berserk,
                                           App.Music.chopin,
                                           App.Music.dio,
                                           App.Video.berserk,
                                           App.Music.chopin,
                                           App.Music.dio])
    
    func selectMusic(_ tabBar: UITabBar,_ item: UITabBarItem,_ tableView: UITableView?) {
        
        let select = {(row: Int) in
            
            if let tableView = tableView {
                
                tableView.selectRow(at: IndexPath(row: row,
                                                  section: tableView.indexPathForSelectedRow?.section ?? 0),
                                    animated: false,
                                    scrollPosition: .none)
            }
        }
        
        switch item.image {
            
            case App.Image.previous:
            
                guard let tableView = tableView else {return}
                guard let row = tableView.indexPathForSelectedRow?.row else {return}
                guard row != 0 else {return}
                    
                tabBar.items?[1].image = App.Image.pause
                
                player.stop()
                select(row - 1)
                player.chose(row - 1)
                player.play()
            
            case App.Image.play:
            
                player.play()
                item.image = App.Image.pause
            
            case App.Image.pause:
            
                player.pause()
                item.image = App.Image.play

            default:
            
                guard let tableView = tableView else {return}
                guard let row = tableView.indexPathForSelectedRow?.row else {return}
            guard row != (player.playList.count - 1) else {return}
                    
                tabBar.items?[1].image = App.Image.pause
                
                player.stop()
                select(row + 1)
                player.chose(row + 1)
                player.play()
        }
    }
}
