//
//  Assets.swift
//  Player
//
//  Created by Josicleison on 30/09/22.
//

import UIKit

struct Archive {let file: String, type: String}

struct App {
    
    static let font = UIFont.systemFont(ofSize: 20, weight: .bold)
    
    struct Color {
        
        static let dark_Light = UIColor(named: "dark_Light")
        static let light_Dark = UIColor(named: "light_Dark")
        static let opaqueDark_Light = UIColor(named: "opaqueDark_Light")
        static let weakLight_Dark = UIColor(named: "weakLight_Dark")
    }
    
    struct Image {
        
        static let next = UIImage(systemName: "arrow.right.to.line.compact")
        static let previous = UIImage(systemName: "arrow.left.to.line.compact")
        static let note = UIImage(systemName: "music.note")
        static let play = UIImage(systemName: "play.fill")
        static let stop = UIImage(systemName: "stop.fill")
    }
    
    struct Music {
        
        static let chopin = Archive(file: "Chopin - Nocturne in F minor Op 55 No 1",
                                    type: "mp3")
        static let dio = Archive(file: "dio - holy diver",
                                 type: "mp3")
    }
    
    struct Video {
        
        static let berserk = Archive(file: "Berserk - Episódio 1",
                                     type: "mp4")
    }
}
