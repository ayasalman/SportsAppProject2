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
    var managedContext : NSManagedObjectContext!
    var savedLeagues : [NSManagedObject] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        tableView.reloadData()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Fav")
        do
        {
            savedLeagues = try managedContext.fetch(fetchRequest)
            tableView.reloadData()
        } catch let error
        {
            print(error.localizedDescription)
        }
        let reachability : Reachability = Reachability.forInternetConnection()
        if reachability.isReachable()
        {
            print("there's Network")
        }
        else
        {
            let alert : UIAlertController = UIAlertController(title: "Network Error", message: "You are not connected to the Network so please check your Wi-Fi or Mobile Data Again", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            self.present(alert, animated: true, completion: nil)
        }
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return savedLeagues.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favCell", for: indexPath) as! FavouriteTableViewCell

        cell.leagueNameLabel.adjustsFontSizeToFitWidth = true
        cell.leagueNameLabel.text = savedLeagues[indexPath.row].value(forKey: "league_name") as? String
        
        let imageURL = URL(string: savedLeagues[indexPath.row].value(forKey: "league_logo") as? String ?? "https://img.freepik.com/premium-vector/system-software-update-upgrade-concept-loading-process-screen-vector-illustration_175838-2182.jpg?w=826")
        cell.leagueImageShow.kf.setImage(with: imageURL, placeholder: "https://img.freepik.com/premium-vector/system-software-update-upgrade-concept-loading-process-screen-vector-illustration_175838-2182.jpg?w=826" as? Placeholder)
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
            eventView.sportsType = savedLeagues[indexPath.row].value(forKey: "sports_type") as? String
            eventView.leagueID = savedLeagues[indexPath.row].value(forKey: "league_key") as? Int
            eventView.leagueName = savedLeagues[indexPath.row].value(forKey: "league_name") as? String
            eventView.leagueLogo = savedLeagues[indexPath.row].value(forKey: "league_logo") as? String
            eventView.isFavourite = savedLeagues[indexPath.row].value(forKey: "league_fav") as? Bool
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
