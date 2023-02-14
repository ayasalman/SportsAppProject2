//
//  LeagueEventsClass.swift
//  SportsApp
//
//  Created by Aya on 09/02/2023.
//

import Foundation


class LeagueEvents : Decodable
{
    var event_key : Int?
    var event_date : String? //1
    var event_time: String? //2
    var event_home_team : String? //3
    var event_away_team : String? //4
    var home_team_logo : String? //5
    var away_team_logo : String? //6
    
    var event_home_team_logo : String?
    var Event_away_team_logo : String?
    
    
   // var event_home_team_logo : String
  //  var event_away_team_logo : String?
    
    /*
    var home_team_key:Int?
    var away_team_key : Int?
    var league_name : String?
    var league_key : Int?
    var league_logo : String?
     */
}
