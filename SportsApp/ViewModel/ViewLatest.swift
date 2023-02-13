//
//  ViewLatest.swift
//  SportsApp
//
//  Created by Aya on 13/02/2023.
//

import Foundation


class ViewLatestCollection
{
    var bindResultToLeaguesEventsVC : ( () -> () ) = {}
    var LatestCVResult : [LatestEvents]?
    {
        didSet
        {
            bindResultToLeaguesEventsVC ()
        }
    }
    
    func getLatestCV (sportType : String , leagueID : Int)
    {
        FetchLatestData.fetchURLTeams(compeletionHandeler: {result in
            self.LatestCVResult = result?.result }, sportType: sportType, leagueID: leagueID)
    }

}
