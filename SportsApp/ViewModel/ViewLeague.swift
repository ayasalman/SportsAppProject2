//
//  ViewLeague.swift
//  SportsApp
//
//  Created by Michael Hany on 09/02/2023.
//

import Foundation

class ViewLeague
{
    var bindResultToLeagueTableViewController : (()->()) = {}
    var sportResult : [League]?
    {
        didSet
        {
            bindResultToLeagueTableViewController()
        }
    }
    
    func getLeagues (sportType : String)
    {
        fetchLeagueURL.fetchURL(completionHandler: {result in self.sportResult = result?.result} ,sportType: sportType)
    }
}
