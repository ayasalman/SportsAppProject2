//
//  LatestProtocol.swift
//  SportsApp
//
//  Created by Aya on 13/02/2023.
//

import Foundation
protocol FetchLatestServices
{
    static func fetchURLTeams(compeletionHandeler: @escaping (LatestResults?) -> Void, sportType: String, leagueID: Int)
}

