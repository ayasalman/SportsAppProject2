//
//  TeamssProtocol.swift
//  SportsApp
//
//  Created by Aya on 13/02/2023.
//

import Foundation
protocol FetchTeamsCollectionServices
{
    static func fetchURLTeams(compeletionHandeler : @escaping (TeamssResult?) -> Void, sportType : String, leagueID : Int )
   
}

