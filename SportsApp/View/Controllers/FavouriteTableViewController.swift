//
//  FavouriteTableViewController.swift
//  SportsApp
//
//  Created by Michael Hany on 04/02/2023.
//

import UIKit
import CoreData
import Reachability
import Kingfisher

class FavouriteTableViewController: UITableViewController
{
    var sportsType : String?
    var leagueID : Int?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let reachability : Reachability = Reachability.forInternetConnection()
        if reachability.isReachable()
        {
            //there is network
        }
        else
        {
            let alert : UIAlertController = UIAlertController(title: "Network Error", message: "You are not connected to the Network so please check your Wi-Fi or Mobile Data Again", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        let reachability : Reachability = Reachability.forInternetConnection()
        if reachability.isReachable()
        {
            //there is network
        }
        else
        {
            let alert : UIAlertController = UIAlertController(title: "Network Error", message: "You are not connected to the Network so please check your Wi-Fi or Mobile Data Again", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            self.present(alert, animated: true, completion: nil)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favCell", for: indexPath) as! FavouriteTableViewCell

        cell.leagueNameLabel.adjustsFontSizeToFitWidth = true
        cell.leagueNameLabel.text = "League Name will Be Here"
        cell.leagueImageShow.image = UIImage(named: "ea-sports")
        cell.leagueImageShow.layer.cornerRadius = cell.leagueImageShow.frame.height/2.5
        //to make the image in { diamond shape divide by 1.5 | circle shape divide by 2 | rounded shape divide by 2.5 }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("you tapped me")
        let reachability : Reachability = Reachability.forInternetConnection()
        if reachability.isReachable()
        {
            let eventView = storyboard?.instantiateViewController(withIdentifier: "eventsID") as! LeaguesEventsVC     //1
            //eventView.sportsType = sportsType  // to give the sport type to league event screen to easy access to API
            //eventView.leagueID = leagueID[indexPath.row] // to give league ID to league event screen
            eventView.modalPresentationStyle = .fullScreen                                                            //2
            self.present(eventView, animated: true, completion: nil)
        }
        else
        {
            let alert : UIAlertController = UIAlertController(title: "Network Error", message: "You are not connected to the Network so please check your Wi-Fi or Mobile Data Again", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
