//
//  PlayerListPresenter.swift
//  IntellisportsTask
//
//  Created by ijaz ahmad on 2021-06-07.
//

import Foundation

protocol PlayerListViewDelegate: class {
    
    func displayPlayers(players: [Player])
}

class PlayerListPresenter {
    
    weak private var playerListViewDelegate: PlayerListViewDelegate?
    
    func setViewDelegate(playerListViewDelegate: PlayerListViewDelegate?) {
        self.playerListViewDelegate = playerListViewDelegate
    }
    
    func fetchPlayers() {
        PlayerService.shared.getPlayers { (players, error) in
            if let error = error { print("we found an error\(error.localizedDescription)") }
            if let players = players {
                self.playerListViewDelegate?.displayPlayers(players: players)
            }
        }
    }
}
