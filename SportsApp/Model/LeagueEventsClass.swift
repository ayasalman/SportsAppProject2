//
//  LeagueEventsClass.swift
//  SportsApp
//
//  Created by Aya on 09/02/2023.
//

import Foundation

class LeagueEvents : Decodable
{
    var  event_key : Int?
    var event_date : Int?
    var event_time: Double?
    var event_home_team : String?
    var home_team_key:Int?
    var event_away_team : String?
    var away_team_key : Int?
    var league_name : String?
    var league_key : Int?
    var home_team_logo : String?
    var away_team_logo : String?
    var league_logo : String?
}
