//
//  LeaguesEventsVC.swift
//  SportsApp
//
//  Created by Aya on 06/02/2023.
//

import UIKit

class LeaguesEventsVC: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    var arrEvants1 = [Event]()
    var arrEvents2 = [Event]()
    var arrEvents3 = [Event]()
  var arrEventsTemp = [Event]()
     
    
    var photos1 = [UIImage(named: "image")!, UIImage(named: "begain")!, UIImage(named: "lord")!, UIImage(named: "fault")!]
    
    var photos2 = [UIImage(named: "lord")!, UIImage(named: "image")!, UIImage(named: "begain")!, UIImage(named: "fault")!]
    
    var photos3 = [UIImage(named: "fault")!, UIImage(named: "begain")!, UIImage(named: "lord")!, UIImage(named: "image")!]
    
    

    @IBOutlet weak var UpComingCollection: UICollectionView!
    
    
    @IBOutlet weak var latestEventsCollection: UICollectionView!
    
    @IBOutlet weak var TeamsCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        UpComingCollection.delegate = self
        UpComingCollection.dataSource = self
        
        latestEventsCollection.delegate = self
        latestEventsCollection.dataSource = self
        
        TeamsCollection.delegate = self
        TeamsCollection.dataSource = self
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if UpComingCollection == self.UpComingCollection
        {
            return photos1.count
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
            
            cell.upComingImage.image = photos1[indexPath.row]
            
            return cell
        }
        
        else if collectionView == self.latestEventsCollection
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "latestCell", for: indexPath)
            return cell
        }
    
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamsCell", for: indexPath)
            return cell
        
       
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width , height: collectionView.frame.height)
    }

}

struct Event
{
    let photos : [UIImage]
}
