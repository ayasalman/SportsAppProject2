//
//  LeaguesEventsVC.swift
//  SportsApp
//
//  Created by Aya on 06/02/2023.
//

import UIKit
import CoreData

class LeaguesEventsVC: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    var sportsType : String?     // type of sport will be in this text (football , basketball , tennis , cricket)
    var leagueID : Int?          // league ID that is required to show its own events
    
    var upComingList : [LeagueEvents] = []
    var viewUpComing : ViewUpcoming?
    
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
        viewUpComing = ViewUpcoming()
        viewUpComing?.getUpccoming(sportType: sportsType ?? "football", leagueID: leagueID ?? 205)
        //upComingList = ViewUpcoming?.upComingResult ?? []
        //viewUpComing?.bindResultToLeaguesEventsVC = { () in self.renderView() }

        UpComingCollection.delegate = self
        UpComingCollection.dataSource = self
        
        latestEventsCollection.delegate = self
        latestEventsCollection.dataSource = self
        
        TeamsCollection.delegate = self
        TeamsCollection.dataSource = self
        
        pageController.numberOfPages = photos1.count
        
        startTimer()
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
       // collectionView.reloadData()
    }
    
   /*func renderView() {
        DispatchQueue.main.async {
            self.upComingList = self.ViewUpcoming?.upComingResult?? []
            //self.collectionView.reloadData()
        }
    }*/
    
    
    
    @IBAction func favBtn(_ sender: Any) {
        
        //let favouriteView = storyboard?.instantiateViewController(withIdentifier: "favID") as! FavouriteTableViewController
        if heartButton.currentImage == UIImage(named: "heart")
        {
            heartButton.imageView?.image = UIImage(named: "heart.fill")
        }
        else if heartButton.currentImage == UIImage(named: "heart.fill")
        {
            heartButton.imageView?.image = UIImage(named: "heart")
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
        collectionView.deselectItem(at: indexPath, animated: true)
        print("You Tapped On Sports Screen")
    }
    
    func startTimer ()
    {
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
    }
    
    @objc func moveToNextIndex()
    {
        if currentCellIndex < photos1.count - 1
        {
            currentCellIndex += 1
        }
        else
        {
            currentCellIndex = 0
        }
        UpComingCollection.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
       pageController.currentPage = currentCellIndex
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if UpComingCollection == self.UpComingCollection
        {
            return upComingList.count
        }
        else if latestEventsCollection == self.latestEventsCollection
        {
            return photos2.count
        }
        else if TeamsCollection == self.TeamsCollection
        {
            return photos3.count
        }
       return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.UpComingCollection
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upComingCell", for: indexPath) as! UpCommingCell
            
          //  cell.upComingImage.image = upComingList[indexPath.row].home_team_logo
           // cell.dateLbl.text = upComingList[indexPath.row].event_date
            return cell
        }
        
        else if collectionView == self.latestEventsCollection
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "latestCell", for: indexPath) as! LatestCell
            cell.latestImagr.image = photos2[indexPath.row]
            return cell
        }
    
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamsCell", for: indexPath) as! TeamsCell
        cell.teamsImage.image = photos3[indexPath.row]
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
