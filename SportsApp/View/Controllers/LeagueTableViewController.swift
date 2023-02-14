//
//  LeagueTableViewController.swift
//  SportsApp
//
//  Created by Michael Hany on 04/02/2023.
//

import UIKit
import Kingfisher

class LeagueTableViewController: UITableViewController
{
    var leagueList : [League]=[]
    var sportType : String?
    var viewLeague : ViewLeague?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        viewLeague = ViewLeague()
        viewLeague?.getLeagues(sportType: sportType ?? "football")
        viewLeague?.bindResultToLeagueTableViewController = { () in self.renderView()}
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        tableView.reloadData()
    }
    
    func renderView()
    {
        DispatchQueue.main.async
        {
            self.leagueList = self.viewLeague?.sportResult ?? []
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return leagueList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leagueCell", for: indexPath) as! LeagueTableViewCell
        
        cell.leagueScreenNameLabel.adjustsFontSizeToFitWidth = true
        cell.leagueScreenNameLabel.text = leagueList[indexPath.row].league_name
        
        let imageURL = URL(string: leagueList[indexPath.row].league_logo ?? "https://img.freepik.com/premium-vector/system-software-update-upgrade-concept-loading-process-screen-vector-illustration_175838-2182.jpg?w=826")
        cell.leagueScreenImageShow.kf.setImage(with: imageURL)
        cell.leagueScreenImageShow.layer.cornerRadius = cell.leagueScreenImageShow.frame.height/2.5
        //to make the image in { diamond shape divide by 1.5 | circle shape divide by 2 | rounded shape divide by 2.5 }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("you tapped me")
        let eventView = storyboard?.instantiateViewController(withIdentifier: "eventsID") as! LeaguesEventsVC     //1
        eventView.sportsType = sportType  // to give the sport type to league event screen to easy access to API
        eventView.leagueID = leagueList[indexPath.row].league_key       // to give league ID to league event screen
        eventView.leagueName = leagueList[indexPath.row].league_name    // to give league Name to league event screen
        eventView.leagueLogo = leagueList[indexPath.row].league_logo    // to give league Logo to league event screen
        eventView.modalPresentationStyle = .fullScreen                                                            //2
        self.present(eventView, animated: true, completion: nil)                                                  //3
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
