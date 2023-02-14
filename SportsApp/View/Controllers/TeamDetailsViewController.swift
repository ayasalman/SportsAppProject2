//
//  TeamDetailsViewController.swift
//  SportsApp
//
//  Created by Michael Hany on 11/02/2023.
//

import UIKit
import Kingfisher

class TeamDetailsViewController: UIViewController
{

    @IBOutlet var teamImageDetails: UIImageView!
    @IBOutlet var teamNameDetails: UILabel!
    @IBOutlet var playerTable: UITableView!
    
    var teamDetailsList : TeamDetails?
    var viewTeamDetails : ViewTeamDetails?
    
    var players : [Player]?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        playerTable.delegate = self
        playerTable.dataSource = self
        players = teamDetailsList?.players ?? []
        teamNameDetails.text = teamDetailsList?.team_name
        let imageURL = URL(string: teamDetailsList?.team_logo ?? "https://img.freepik.com/premium-vector/system-software-update-upgrade-concept-loading-process-screen-vector-illustration_175838-2182.jpg?w=826")
        teamImageDetails.kf.setImage(with: imageURL)
        playerTable.reloadData()
      
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        playerTable.reloadData()
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


extension TeamDetailsViewController : UITableViewDataSource , UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return players?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return "Players"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 75
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playersCell", for: indexPath) as! TeamDetailsTableViewCell
        
        cell.playerName.adjustsFontSizeToFitWidth = true
        cell.playerName.text = players?[indexPath.row].player_name ?? ""
        cell.playerNumber.text = players?[indexPath.row].player_number ?? ""
        
        let imageURL = URL(string: players?[indexPath.row].player_image ?? "https://img.freepik.com/premium-vector/system-software-update-upgrade-concept-loading-process-screen-vector-illustration_175838-2182.jpg?w=826")
        cell.playerImage.kf.setImage(with: imageURL, placeholder: "https://img.freepik.com/premium-vector/system-software-update-upgrade-concept-loading-process-screen-vector-illustration_175838-2182.jpg?w=826" as? Placeholder)
        
        return cell
    }
}
