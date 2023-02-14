//
//  ViewTeamDetails.swift
//  SportsApp
//
//  Created by Michael Hany on 11/02/2023.
//

import Foundation

class ViewTeamDetails
{
    var bindResultToTeamDetailsViewController : (()->()) = {}
    var teamDetailsResult : TeamDetailsClass?
    {
        didSet
        {
            bindResultToTeamDetailsViewController()
        }
    }
    
    func getLeagues (sportType : String, teamID : Int)
    {
        fetchTeamDetailsURL.fetchURL(completionHandler: {result in self.teamDetailsResult = result?.result}, sportType: sportType, teamID: teamID)
    }
}
