//
//  Cell.swift
//  Player
//
//  Created by Josicleison on 03/10/22.
//

import UIKit

class Cell: UITableViewCell {
    
    let musicLabel: UILabel = {
        
        let musicLabel = UILabel()
        musicLabel.font = App.font
        musicLabel.textColor = App.Color.light_Dark
        musicLabel.numberOfLines = 0
        
        return musicLabel
    }()
    
    private let musicImageView: UIImageView = {
        
        let musicImageView = UIImageView()
        musicImageView.tintColor = App.Color.light_Dark
        
        return musicImageView
    }()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        if selected {
            
            musicImageView.tintColor = .yellow; return
        }
        musicImageView.tintColor = App.Color.light_Dark
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubviews([musicImageView, musicLabel])
        contentView.backgroundColor = App.Color.opaqueDark_Light
        
        musicImageView.constraint(to: contentView, by: [.centerY])
        musicImageView.constraint(to: contentView, by: [.height], multiplier: 2/3)
        musicImageView.constraint(to: musicImageView, by_itemItem: [.height: .width])
        
        musicLabel.constraint(to: contentView, by: [.leading],
                              constant: contentView.frame.height*2/3+contentView.frame.width/20)
        musicLabel.constraint(to: contentView, by: [.trailing,.top,.bottom])
    }
    
    func setup(_ image: UIImage?, text: String) {
        
        musicImageView.image = image
        musicLabel.text = text
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}
