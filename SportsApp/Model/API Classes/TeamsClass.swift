//
//  TeamsClass.swift
//  SportsApp
//
//  Created by Aya on 12/02/2023.
//

import Foundation

class TeamDetails : Decodable
{
    var team_key : Int?
    var team_name : String?
    var team_logo : String?
    var player : [Player]?
}

class Player:Decodable
{
    var player_name : String?
    var player_type : String?
    var player_number : String?
    var player_image : String?
    
}
        
        
