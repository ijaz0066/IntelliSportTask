//
//  IntelliApiUrl.swift
//  IntellisportsTask
//
//  Created by ijaz ahmad on 2021-06-06.
//

import Foundation

enum EndPoint: String {
    //add api end points here
    case player = "test"
}

class IntelliApiUrl {
    
    static private let baseUrl = "https://pushchadev.hopto.org/"
    
    //add other static varriables here like apikey, client tokens etc
}

extension IntelliApiUrl {
    
    //Functions to get api endpoints
    static func player() -> URL {
        let url = URL(string: baseUrl + EndPoint.player.rawValue + ".json")!
        return url
    }

}
