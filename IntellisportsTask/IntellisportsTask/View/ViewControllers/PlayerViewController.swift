//
//  ViewController.swift
//  IntellisportsTask
//
//  Created by ijaz ahmad on 2021-06-06.
//

import UIKit
import SDWebImage

class PlayerViewController: UIViewController {
    
    //MARK:- Local Verriables
    private var playerListPresenter = PlayerListPresenter()
    private var selectedPlayer: Player!
    private let identifier = "cell"
    private var players: [Player] = []
    private var filteredPlayers: [Player]?
    
    //MARK:- IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var playerDetailView: UIView!
    @IBOutlet weak var playerDetailViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var playerDetailViewHeightConstraint: NSLayoutConstraint!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        Common.registerTableViewCell(nibName: "PlayerTableViewCell", identifier: identifier, tableView: tableView)
        
        playerListPresenter.setViewDelegate(playerListViewDelegate: self)
        playerListPresenter.fetchPlayers()
        
        searchTextField.addTarget(self, action: #selector(PlayerViewController.textFieldDidChange(_:)),
                                  for: .editingChanged)
        
        playerDetailView.roundCorners(radius: 10.0)
        playerDetailView.shadow()
        profileImageView.roundCorners()
    }
    
    @IBAction func CloseDetailView(_ sender: UIButton) {
        self.playerDetailViewHeightConstraint.constant = 0
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        
        tableView.isUserInteractionEnabled = true
        tableView.alpha = 1.0
    }
    
}

// MARK:- Local Methods
extension PlayerViewController  {
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField.text == "" {
            tableView.reloadData()
            return
        }
        filteredPlayers = players.filter({ (player) -> Bool in
            player.name.lowercased().contains((textField.text!.lowercased()))
        })
        
        self.tableView.reloadData()
    }
    
    
}

//MARK:- TableViewDelegate

extension PlayerViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchTextField.text != "" { return filteredPlayers?.count ?? 0 }
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? PlayerTableViewCell
        if searchTextField.text == "" { cell!.player = players[indexPath.row] }
        else { cell!.player = filteredPlayers![indexPath.row] }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.playerDetailViewHeightConstraint.constant = 500
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        var selectedPlayer: Player!
        if searchTextField.text == "" { selectedPlayer = players[indexPath.row] }
        else { selectedPlayer = filteredPlayers![indexPath.row] }
        name.text = selectedPlayer.name
        profileImageView.sd_setImage(with: URL(string: selectedPlayer.profileImage), placeholderImage: nil, options: .highPriority, completed: nil)
        playerDetailView.backgroundColor = selectedPlayer.category.color()
        
        tableView.isUserInteractionEnabled = false
        tableView.alpha = 0.5
    }
}

//MARK:- PlayerViewDeleage

extension PlayerViewController: PlayerListViewDelegate {
    func displayPlayers(players: [Player]) {
        self.players = players
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

// MARK:- UITextFieldDelegate Delegate
extension PlayerViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
    }
}

