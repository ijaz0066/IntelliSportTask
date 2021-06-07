//
//  Player.swift
//  IntellisportsTask
//
//  Created by ijaz ahmad on 2021-06-06.
//

import Foundation
import UIKit


struct Player: Decodable {
    let id: Int
    let name: String
    let type: Int
    let profileImage: String
    var category: Category = .Silver
    
    enum CodingKeys: String, CodingKey {
        case id = "id_user"
        case name
        case type = "user_type"
        case profileImage = "profile_image"
    }
    
     init(id: Int, name: String, type: Int, profileImage: String) {
        self.id = id
        self.name = name
        self.type = type
        self.profileImage = profileImage
        if type == 1 { category = .Silver }
        else if type == 2 { category = .Gold }
        else { category = .Diamond }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decode(Int.self, forKey: .id)
        let name = try container.decode(String.self, forKey: .name)
        let type = try container.decode(Int.self, forKey: .type)
        let profileImage = try container.decode(String.self, forKey: .profileImage)
        
        self.init(id: id, name: name, type: type, profileImage: profileImage)
    }
}

struct PlayerResponse: Decodable {
    let players: [Player]
    
    enum CodingKeys: String, CodingKey {
        case players = "players_list"
    }
}

enum Category: String {
    
    case Silver = "Silver"
    case Gold = "Gold"
    case Diamond = "Diamond"
    
    func color() -> UIColor {
        switch self {
        case .Silver:
            return UIColor.init(red: 156.0/255.0, green: 166.0/255.0, blue: 164.0/255.0, alpha: 1.0)
        case .Gold:
            return UIColor.init(red: 170.0/255.0, green: 108.0/255.0, blue: 57.0/255.0, alpha: 1.0)
        case .Diamond:
            return UIColor.init(red: 85.0/255.0, green: 242.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        }
    }
}
