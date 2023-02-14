//
//  ViewTeamsCollection.swift
//  SportsApp
//
//  Created by Aya on 13/02/2023.
//

import Foundation

class ViewTeamsCV
{
    var bindResultToLeaguesEventsVC : (() -> ()) = {}
    var TeamsCVResult : [TeamDetails]?
    {
        didSet
        {
            bindResultToLeaguesEventsVC ()
        }
    }
    
    func getTeamsCV (sportType : String , leagueID: Int)
    {
        FetchTeamssData.fetchURLTeams(compeletionHandeler: {result in self.TeamsCVResult = result?.result} ,sportType: sportType, leagueID: leagueID)
    }
}
