//
//  FetchUpComingURL.swift
//  SportsApp
//
//  Created by Aya on 10/02/2023.
//

import Foundation
import Alamofire

class FetchUpcomingURL : upComingServices
{
    static func fetchURL(completionHandler: @escaping (UpComing?) -> Void, sportType: String, leagueID: Int) {
        AF.request("https://apiv2.allsportsapi.com/\(sportType)/?met=Fixtures&leagueId=\(leagueID)&from=2023-02-09&to=2024-02-09&APIkey=59dbd205f73cf075a8012c155eec9c37aa90478a4538caf0066c651dc62bb9b8").validate()
            .responseDecodable(of: UpComing.self) { (data) in
                guard let data = data.value else {return}
                completionHandler(data)
            }
        
        
    }
    
}
    
    
  
