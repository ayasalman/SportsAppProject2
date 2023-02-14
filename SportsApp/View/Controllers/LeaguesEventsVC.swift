//
//  LeaguesEventsVC.swift
//  SportsApp
//
//  Created by Aya on 06/02/2023.
//

import UIKit
import CoreData

class LeaguesEventsVC: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    var sportsType : String?                // type of sport will be in this text (football , basketball , tennis , cricket)
    var leagueID : Int?                     // league ID that is required to show its own events
    var leagueName : String?                // league Name that is required to save to Core Data
    var leagueLogo : String?                // league Logo that is required to save to Core Data
    var isFavourite : Bool?                 // league Fav that is required to save to Core Data
    
    var managedContext : NSManagedObjectContext!
    var resultOfSearch : [NSManagedObject] = []
    
    var teamsCVList : [TeamDetails] = []
    var viewTeamssCv : ViewTeamsCV?
    
    var upComingList : [LeagueEvents] = []
    var viewUpComing : ViewUpcoming?
    
    var latestCVList : [LatestEvents] = []
    var viewLatest :ViewLatestCollection?
    
    var arrEvants1 = [Event]()
    var arrEvents2 = [Event]()
    var arrEvents3 = [Event]()
    var arrEventsTemp = [Event]()
     
    
    var photos1 = [UIImage(named: "image")!, UIImage(named: "begain")!, UIImage(named: "lord")!, UIImage(named: "fault")!]
    
    var photos2 = [UIImage(named: "lord")!, UIImage(named: "image")!, UIImage(named: "begain")!, UIImage(named: "fault")!]
    
    var photos3 = [UIImage(named: "fault")!, UIImage(named: "begain")!, UIImage(named: "lord")!, UIImage(named: "image")!]
    
    
    var timer : Timer?
    var currentCellIndex = 0
    
    @IBOutlet weak var pageController: UIPageControl!
    
    @IBOutlet var heartButton: UIButton!
    
    @IBOutlet weak var UpComingCollection: UICollectionView!
    
    
    @IBOutlet weak var latestEventsCollection: UICollectionView!
    
    @IBOutlet weak var TeamsCollection: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        viewTeamssCv = ViewTeamsCV()
        viewUpComing = ViewUpcoming()
        viewLatest = ViewLatestCollection()
        //viewUpComing?.getUpccoming(sportType: sportsType ?? "football", leagueID: leagueID ?? 205)
        //upComingList = ViewUpcoming?.upComingResult ?? []
        //viewUpComing?.bindResultToLeaguesEventsVC = { () in self.renderView() }

        viewTeamssCv?.getTeamsCV(sportType: sportsType!, leagueID: leagueID!)
        viewTeamssCv?.bindResultToLeaguesEventsVC = {() in self.renderView()}
        
        viewUpComing?.getUpccoming(sportType: sportsType!, leagueID: leagueID!)
        viewUpComing?.bindResultToLeaguesEventsVC = {() in self.renderViewUpcoming()}
        
        viewLatest?.getLatestCV(sportType: sportsType!, leagueID: leagueID!)
        viewLatest?.bindResultToLeaguesEventsVC = {() in
            self.renderViewLatest()
        }
        
        UpComingCollection.delegate = self
        UpComingCollection.dataSource = self
        
        latestEventsCollection.delegate = self
        latestEventsCollection.dataSource = self
        
        TeamsCollection.delegate = self
        TeamsCollection.dataSource = self
        
        pageController.numberOfPages = photos1.count
        
        //startTimer()
        
    }
    
    func renderView()
    {
        DispatchQueue.main.async {
            self.teamsCVList = self.viewTeamssCv?.TeamsCVResult ?? []
            self.TeamsCollection.reloadData()
        }
    }
    
    func renderViewUpcoming()
    {
        DispatchQueue.main.async {
            self.upComingList = self.viewUpComing?.upComingResult ?? []
            self.UpComingCollection.reloadData()
        }
    }
    
    func renderViewLatest()
    {
        DispatchQueue.main.async {
            self.latestCVList = self.viewLatest?.LatestCVResult ?? []
            self.latestEventsCollection.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Fav")
        fetchRequest.predicate = NSPredicate(format: "league_name == %@",leagueName!)
        do
        {
            resultOfSearch = try managedContext.fetch(fetchRequest)
        }catch let error
        {
            print(error.localizedDescription)
        }
        
        if resultOfSearch.count == 0 // not saved to the core data
        {
            heartButton.imageView?.image = UIImage(named: "heart")
            heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        else if resultOfSearch.count != 0 // saved to the device
        {
            heartButton.imageView?.image = UIImage(named: "heart.fill")
            heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
    }
    
   /*func renderView() {
        DispatchQueue.main.async {
            self.upComingList = self.ViewUpcoming?.upComingResult?? []
            //self.collectionView.reloadData()
        }
    }*/
    
    
    
    @IBAction func favBtn(_ sender: Any) {
        
        print("pressed on heart button")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Fav")
        print("League Name is: \(leagueName!)")
        fetchRequest.predicate = NSPredicate(format: "league_name == %@",leagueName!)
        do
        {
            resultOfSearch = try managedContext.fetch(fetchRequest)
        }catch let error
        {
            print(error.localizedDescription)
        }
        
        if resultOfSearch.count == 0 // not saved to the core data
        {
            heartButton.imageView?.image = UIImage(named: "heart.fill")
            heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            isFavourite = true
            let entity = NSEntityDescription.entity(forEntityName: "Fav", in: managedContext)
            let favLeagues = NSManagedObject(entity: entity!, insertInto: managedContext)
            favLeagues.setValue(sportsType, forKey: "sports_type")
            favLeagues.setValue(leagueID, forKey: "league_key")
            favLeagues.setValue(leagueName, forKey: "league_name")
            favLeagues.setValue(isFavourite, forKey: "league_fav")
            favLeagues.setValue(leagueLogo ?? "https://img.freepik.com/premium-vector/system-software-update-upgrade-concept-loading-process-screen-vector-illustration_175838-2182.jpg?w=826", forKey: "league_logo")
            do
            {
                try managedContext.save()
            }catch let error
            {
                print(error.localizedDescription)
            }
        }
        else if resultOfSearch.count != 0 // saved to the device
        {
            heartButton.imageView?.image = UIImage(named: "heart")
            heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
            let target = resultOfSearch[0]
            managedContext.delete(target)
            do
            {
                try managedContext.save()
            } catch let error
            {
                print(error.localizedDescription)
            }
        }
    }
    
    @objc
    func addToFavourite(sender : UIButton) {
       
      /*   favouriteView.modalPresentationStyle = .fullScreen
        self.present(favouriteView, animated: true,completion: nil)*/
    }
    @IBAction func backBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true) as?  TeamsCell
        print("You Tapped On Sports Screen")
        let teamView = storyboard?.instantiateViewController(withIdentifier: "detailsID") as! TeamDetailsViewController     //1
        teamView.teamDetailsList = teamsCVList[indexPath.row]
        teamView.modalPresentationStyle = .fullScreen                                                            //2
        self.present(teamView, animated: true, completion: nil)
    }
    
//    func startTimer ()
//    {
//        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
//    }
//
//    @objc func moveToNextIndex()
//    {
//        if currentCellIndex < photos1.count - 1
//        {
//            currentCellIndex += 1
//        }
//        else
//        {
//            currentCellIndex = 0
//        }
//        UpComingCollection.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
//       pageController.currentPage = currentCellIndex
//    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.UpComingCollection
        {
            return upComingList.count
        }
        else if collectionView == self.latestEventsCollection
        {
            return latestCVList.count
        }
        else if collectionView == self.TeamsCollection
        {
            return teamsCVList.count
        }
       return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.UpComingCollection
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upComingCell", for: indexPath) as! UpCommingCell
            
           cell.upComingImage.kf.setImage(with: URL(string: upComingList[indexPath.row].home_team_logo ?? ""))
            cell.upComingImage2.kf.setImage(with: URL(string: upComingList[indexPath.row].away_team_logo ?? ""))
            cell.upComingLbl1.text = upComingList[indexPath.row].event_home_team
            cell.upComingLbl2.text = upComingList[indexPath.row].event_away_team
            cell.timeLbl.text = upComingList[indexPath.row].event_time
           cell.dateLbl.text = upComingList[indexPath.row].event_date
            // cell.dateLbl.text = "aaaa"
           // cell.upComingImage.image = photos1[indexPath.row]
            return cell
            
        }
        
        else if collectionView == self.latestEventsCollection
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "latestCell", for: indexPath) as! LatestCell
            
            cell.latestImagr.kf.setImage(with: URL(string: latestCVList[indexPath.row].home_team_logo ?? ""))
            cell.latestImage2.kf.setImage(with: URL(string: latestCVList[indexPath.row].away_team_logo ?? ""))
            cell.latestLbl1.text = latestCVList[indexPath.row].event_home_team
            cell.latestLbl2.text = latestCVList[indexPath.row].event_away_team
            cell.resultLbl.text = latestCVList[indexPath.row].event_final_result
            
            
            //cell.latestImagr.image = photos2[indexPath.row]
            return cell
        }
    
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamsCell", for: indexPath) as! TeamsCell
       // cell.teamsImage.image = photos3[indexPath.row]
        cell.teamsImage.kf.setImage(with: URL(string: teamsCVList[indexPath.row].team_logo ?? ""))
        cell.teamsLbl.text = teamsCVList[indexPath.row].team_name
        
            return cell
        
       
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width , height: collectionView.frame.height)
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

struct Event
{
    let photos : [UIImage]
}
