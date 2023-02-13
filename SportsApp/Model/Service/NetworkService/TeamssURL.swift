//
//  TeamssURL.swift
//  SportsApp
//
//  Created by Aya on 13/02/2023.
//

import Foundation
import Alamofire
class FetchTeamssData : FetchTeamsCollectionServices
{
    static func fetchURLTeams(compeletionHandeler: @escaping (TeamssResult?) -> Void, sportType: String, leagueID: Int) {
        AF.request("https://apiv2.allsportsapi.com/\(sportType)/?met=Teams&?met=Leagues&leagueId=\(leagueID)&APIkey=59dbd205f73cf075a8012c155eec9c37aa90478a4538caf0066c651dc62bb9b8")
            .validate()
            .responseDecodable(of: TeamssResult.self) { (data) in
                guard let data = data.value else {return}
                compeletionHandeler(data)
            }
    }
    
    
}
