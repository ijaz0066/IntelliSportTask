//
//  PlayerService.swift
//  IntellisportsTask
//
//  Created by ijaz ahmad on 2021-06-06.
//

import Foundation

class PlayerService {
    
    static let shared = PlayerService()
    private init() {}
    
    //add functions here to send, update or receive data from rest api
    
    func getPlayers(compilitionHandler: @escaping (_ players: [Player]?, _ error: Error?)->Void) {
        
        var request = URLRequest(url: URL(string: "https://pushchadev.hopto.org/test.json")!)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(PlayerResponse.self, from: data!)
                compilitionHandler(responseModel.players, nil)
            } catch {
                print("JSON Serialization error")
                compilitionHandler(nil, error)
                
            }
        }).resume()
    }
}
