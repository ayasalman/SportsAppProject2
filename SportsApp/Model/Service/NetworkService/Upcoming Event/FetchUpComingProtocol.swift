//
//  FetchUpComingProtocol.swift
//  SportsApp
//
//  Created by Aya on 10/02/2023.
//

import Foundation

protocol  upComingServices
{
    static func fetchURL(completionHandler: @escaping (UpComing?) -> Void, sportType: String,  leagueID : Int)
}

