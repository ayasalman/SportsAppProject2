//
//  FetchTeamDetailsURL.swift
//  SportsApp
//
//  Created by Michael Hany on 11/02/2023.
//

import Foundation
import Alamofire

class fetchTeamDetailsURL : FetchTeamDetailsService
{
    static func fetchURL(completionHandler: @escaping (TeamDetailsResult?) -> Void, sportType: String,  teamID : Int)
    {
        guard let url = URL(string: "https://apiv2.allsportsapi.com/\(sportType)/?&met=Teams&teamId=\(teamID)&APIkey=6b6ba61102364e18a3ebf5edcfcfc27406736e877f8fe6a68f73e6506117ee02") else{
            completionHandler(nil)
            return
        }
        AF.request(url).response { response in
            switch response.result{
                
            case .success(let data):
                do{
                    let json = try JSONDecoder().decode(TeamDetailsResult.self, from: data!)
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
