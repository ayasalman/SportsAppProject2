//
//  ViewUpComing.swift
//  SportsApp
//
//  Created by Aya on 10/02/2023.
//

import Foundation

class ViewUpcoming
{
    var bindResultToLeaguesEventsVC :  (()->()) = {}
    var upComingResult  : [LeagueEvents]?
    {
        didSet
        {
            bindResultToLeaguesEventsVC ()
        }
    }
    
    func getUpccoming(sportType :  String,  leagueID: Int) {
        fetchUpcomingURL.fetchURL(completionHandler: {result in self.upComingResult = result?.result}, sportType: sportType,  leagueID: leagueID)
    }
}


