//
//  TeamDetailsViewController.swift
//  SportsApp
//
//  Created by Michael Hany on 11/02/2023.
//

import UIKit
import Kingfisher

class TeamDetailsViewController: UIViewController {

    @IBOutlet var teamImageDetails: UIImageView!
    @IBOutlet var teamNameDetails: UILabel!
    
    var sportsType : String?
    var teamID : Int?
    var teamDetailsList : TeamDetails?
    var viewTeamDetails : ViewTeamDetails?
//    let imageURL = URL(string: teamDetailsList ?? "https://img.freepik.com/premium-vector/system-software-update-upgrade-concept-loading-process-screen-vector-illustration_175838-2182.jpg?w=826")
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        viewTeamDetails = ViewTeamDetails()
        viewTeamDetails?.getLeagues(sportType: sportsType ?? "football", teamID: teamID ?? 205)
        viewTeamDetails?.bindResultToTeamDetailsViewController = { () in self.renderView()}
        
        let imageURL = URL(string: teamDetailsList?.team_logo ?? "https://img.freepik.com/premium-vector/system-software-update-upgrade-concept-loading-process-screen-vector-illustration_175838-2182.jpg?w=826")
        teamImageDetails.kf.setImage(with: imageURL)
        teamNameDetails.text = teamDetailsList?.team_name
    }
    
    func renderView()
    {
        DispatchQueue.main.async
        {
            self.teamDetailsList = self.viewTeamDetails?.teamDetailsResult
        }
    }
    
    @IBAction func backButton(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
