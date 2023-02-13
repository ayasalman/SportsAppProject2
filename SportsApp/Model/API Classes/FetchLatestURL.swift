//
//  FetchLatestURL.swift
//  SportsApp
//
//  Created by Aya on 11/02/2023.
//

import Foundation
import Alamofire
class FetchLatestURL : latestServices
{

    static func fetchURL(completionHandler: @escaping (LatestResults?) -> Void, sportType: String, leagueID: Int) {
        guard let url = URL(string: "https://apiv2.allsportsapi.com/\(sportType)/?met=Fixtures&leagueId=\(leagueID)&from=2023-02-09&to=2024-02-09&APIkey=59dbd205f73cf075a8012c155eec9c37aa90478a4538caf0066c651dc62bb9b8")
                else
        {
            completionHandler(nil)
            return
        }
        
        AF.request(url).response
        {
            response in
            switch response.result
            {
            case .success(let data):
                do{
                    let json = try JSONDecoder().decode(LatestResults.self, from: data!)
                    completionHandler(json)
                }catch{
                    print(String(describing: error))
                    completionHandler(nil)
                }
            case .failure(let error):
                print(String(describing: error))
                completionHandler(nil)
            }
        }
    }
    
    
}
