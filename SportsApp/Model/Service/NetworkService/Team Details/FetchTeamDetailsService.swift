//
//  FetchTeamDetailsService.swift
//  SportsApp
//
//  Created by Michael Hany on 11/02/2023.
//

import Foundation

protocol FetchTeamDetailsService
{
    static func fetchURL(completionHandler: @escaping (TeamDetailsResult?) -> Void, sportType: String,  teamID : Int)
}
