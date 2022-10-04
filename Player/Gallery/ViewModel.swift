//
//  ViewModel.swift
//  Player
//
//  Created by Josicleison on 30/09/22.
//

import UIKit

class ViewModel {
    
    let archives = [App.Video.berserk,
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
                    App.Music.dio]
    
    func makeWay(_ indexPath: IndexPath?) -> URL? {
        
        guard let indexPath = indexPath else {return nil}
        return URL(fileURLWithPath: Bundle.main.path(forResource: archives[indexPath.row].file,
                                                     ofType: archives[indexPath.row].type) ?? "")
    }
}
