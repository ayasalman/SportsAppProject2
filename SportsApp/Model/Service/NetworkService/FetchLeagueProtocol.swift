//
//  FetchLeagueProtocol.swift
//  SportsApp
//
//  Created by Michael Hany on 09/02/2023.
//

import Foundation

protocol FetchLeagueService
{
    static func fetchURL(completionHandler: @escaping (MyResult?) -> Void, sportType: String)
}
